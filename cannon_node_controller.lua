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
    function os_info()
        print("Cannon node controller 0.0.1")
        print("Made by SpaceEye https://github.com/SuperSpaceEye/Minecraft_cannon_project")
        print("")
    end

    function await_connection_to_reloader()
        local x, y = term.getCursorPos()

        -- red text on white
        term.setTextColor(16384)
        term.setBackgroundColor(1)

        term.write("Trying to connect to the reloading module...")
        while true do
            _, freq, _, _, msg, _ = os.pullEvent("modem_message")
            if freq == "back" then
                break
            end
        end

        term.setTextColor(32)
        term.setBackgroundColor(32768)
        term.setCursorPos(x,y)
        term.clearLine()

        term.write("Connected to the reloading module!")
        term.setCursorPos(x, y+1)
    end

    function await_connection_to_cannon_controller()
        local x, y = term.getCursorPos()

        -- red text on white
        term.setTextColor(16384)
        term.setBackgroundColor(1)

        term.write("Trying to connect to the cannon control module...")
        while true do
            _, freq, _, _, msg, _ = os.pullEvent("modem_message")
            if freq == "back" then
                break
            end
        end

        term.setTextColor(32)
        term.setBackgroundColor(32768)
        term.setCursorPos(x, y)
        term.clearLine()

        term.write("Connected to the cannon control module!")
        term.setCursorPos(x, y+1)
    end

    term.setCursorPos(1, 1)
    os_info()

    await_connection_to_reloader()
    await_connection_to_cannon_controller()

    term.setTextColor(1)
    term.setBackgroundColor(32768)
end

function main_loop()
    local result = connect_to_modules()

    clear_console()
    if not result then

        return
    end

    while true do
        mytest = io.read()

        sleep(0.1)
    end
end

parallel.waitForAll(async_ui, main_loop)