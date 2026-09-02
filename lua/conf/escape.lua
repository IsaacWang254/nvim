-- Mash h, j, k and l together in insert mode to get back to normal mode.
--
-- Not a plugin, and not a two-key sequence: it is a chord. All four keys must
-- arrive, in any order, each within `window_ms` of the one before. The keys
-- typed so far are inserted as normal text, then backspaced away when the set
-- completes -- so a partial mash costs you nothing but the characters you see.
--
-- Requiring all four is what makes this safe: no English word runs h, j, k and
-- l together, so unlike a "jk"-style pair this never fires mid-word. milk,
-- walk, sparkle and athlete all type literally.
--
-- Stopping at three (say "hjk") leaves those three characters behind, since
-- there is no way to know the chord was abandoned. Backspace as usual.

local keys = { "h", "j", "k", "l" }

-- Max gap between consecutive keys of the chord, in ms. Generous on purpose:
-- there is nothing to collide with, so the only cost of a wide window is that
-- four such keys spread over a few hundred ms would also count.
local window_ms = 200

local uv = vim.uv or vim.loop

-- hrtime, not uv.now(): the latter is the event loop's cached timestamp and
-- does not advance between iterations.
local function now_ms()
  return uv.hrtime() / 1e6
end

local is_chord_key = {}
for _, key in ipairs(keys) do
  is_chord_key[key] = true
end

-- seen     = which of the four have arrived in this burst
-- inserted = how many characters this burst has put in the buffer, so we know
--            how many <BS> to send when it completes
local seen, inserted, last_time = {}, 0, 0

local function reset()
  seen, inserted = {}, 0
end

local function chord_complete()
  for _, key in ipairs(keys) do
    if not seen[key] then
      return false
    end
  end
  return true
end

for _, key in ipairs(keys) do
  vim.keymap.set("i", key, function()
    local now = now_ms()
    if now - last_time > window_ms then
      reset()
    end
    last_time = now
    seen[key] = true

    if chord_complete() then
      -- This key is never inserted, so only the earlier ones need removing.
      local erase = string.rep("<BS>", inserted)
      reset()
      return erase .. "<Esc>"
    end

    inserted = inserted + 1
    return key
  end, { expr = true, desc = "insert " .. key .. ", or escape when chorded with the other hjkl keys" })
end

local group = vim.api.nvim_create_augroup("HjklEscape", { clear = true })

vim.api.nvim_create_autocmd("InsertLeave", {
  group = group,
  callback = reset,
})

-- Any other character breaks the chord, so "hulk" cannot complete one across
-- the "u". Our own keys re-arm it on the way through.
vim.api.nvim_create_autocmd("InsertCharPre", {
  group = group,
  callback = function()
    if not is_chord_key[vim.v.char] then
      reset()
    end
  end,
})
