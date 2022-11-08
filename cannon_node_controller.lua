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

--print("Type \"help\" to list all available arguments")
--print("Placeholder")
--print("Other text")
--print("")

i = 0

function redraw()
    local x, y = term.getCursorPos()
    term.setCursorPos(1, 2)
    term.clearLine()
    i = i + 1
    term.write("i =" .. i)
    term.setCursorPos(x, y)
end

function async_ui()
    --while true do
    --    redraw()
    --    sleep(0.1)
    --end

    while true do
        sleep(0.1)
    end
end

function connect_to_modules()
    term.setCursorPos(1, 1)

    -- red text on white
    term.setTextColor(16384)
    term.setBackgroundColor(1)

    term.write("Trying to connect to the reloading module...")
    l_modem.open(1)
    _, msg, __ = rednet.receive("reloader")

    term.setTextColor(32)
    term.setBackgroundColor(32768)
    term.write("Connected to the reloading module!", "5", "1")


    term.setTextColor(1)
    term.setBackgroundColor(32768)
end

function main_loop()
    local result = connect_to_modules()

    if not result then

        return
    end

    while true do
        mytest = io.read()

        sleep(0.1)
    end
end

parallel.waitForAll(async_ui, main_loop)