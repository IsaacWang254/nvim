-- Tests for lua/conf/escape.lua (the hjkl chord).
--
-- Run from the repo root:
--   nvim --headless -u init.lua -l tests/escape_test.lua
--
-- Exits non-zero if anything fails. The timing here is real -- it sleeps
-- between keys -- so this is slow by design and catches the two bugs an
-- earlier version had: a cached clock that never advanced, and a pending
-- key that survived an unrelated character.

local results, failed = {}, false
local sleep = (vim.uv or vim.loop).sleep

local function check(name, got, want)
  local ok = got == want
  if not ok then failed = true end
  table.insert(results, string.format("%-50s %s  got=%-22q want=%q",
    name, ok and "PASS" or "FAIL", tostring(got), tostring(want)))
end

local cb = {}
for _, m in ipairs(vim.api.nvim_get_keymap("i")) do
  if m.callback and #m.lhs == 1 and ("hjkl"):find(m.lhs, 1, true) then cb[m.lhs] = m.callback end
end

local function mash(seq, gap)
  local last
  for c in seq:gmatch(".") do
    if gap then sleep(gap) end
    last = cb[c]()
  end
  return last
end

sleep(400); check("h j k l in order -> escape",        mash("hjkl"), "<BS><BS><BS><Esc>")
sleep(400); check("l k j h reversed -> escape",        mash("lkjh"), "<BS><BS><BS><Esc>")
sleep(400); check("k h l j scrambled -> escape",       mash("khlj"), "<BS><BS><BS><Esc>")
sleep(400); check("repeats: h h j k l -> escape",      mash("hhjkl"), "<BS><BS><BS><BS><Esc>")
sleep(400); check("long mash hkjhkjl -> escape",       mash("hkjhkjl"), "<BS><BS><BS><BS><BS><BS><Esc>")
sleep(400); check("only three (hjk) -> no escape",     mash("hjk"), "k")
sleep(400); check("pair (jk) -> no escape",            mash("jk"), "k")
sleep(400); check("too slow (300ms gaps) -> no escape", mash("hjkl", 300), "l")

local function typed(s)
  vim.cmd("enew!")
  vim.api.nvim_feedkeys(s, "x", false)
  return table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
end
sleep(400); check("end to end: 'abhjkl' -> escapes, 'ab' left", typed("iabhjkl"), "ab")
sleep(400); check("'milk' types literally",                     typed("imilk"),   "milk")
sleep(400); check("'sparkle' types literally",                  typed("isparkle"),"sparkle")
sleep(400); check("'hello' types literally",                    typed("ihello"),  "hello")
sleep(400); check("'hulk' types literally (broken by u)",       typed("ihulk"),   "hulk")
sleep(400); check("partial 'hjk' stays in buffer",              typed("ihjk"),    "hjk")

print(table.concat(results, "\n"))
print(failed and "\nSOME TESTS FAILED" or "\nall tests passed")
vim.cmd(failed and "cq" or "qa!")
