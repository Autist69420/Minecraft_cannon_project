---
--- Created by SpacEeye.
---

function clear_console()
    term.clear()
    term.setCursorPos(1, 1)
end

-- for communication between cannon parts
l_modem = peripheral.wrap("back")
-- for communication between nodes (in the future)
g_modem = peripheral.wrap("top")

clear_console()

print("Type \"help\" to list all available arguments")


i = 0

function redraw()
    local x, y = term.getCursorPos()
    term.setCursorPos(1, 2)
    term.clearLine()
    i = i + 1
    term.write("i =", i)
    term.setCursorPos(x, y)
end

while true do
    redraw()
    sleep(0.1)
end