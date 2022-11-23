---
--- Created by Autist69420.
---

local function clear_console()
    term.clear()
    term.setCursorPos(1, 1)
end

-- for communication between cannon parts
local l_modem = peripheral.wrap("back")
-- for communication between nodes (in the future)
local g_modem = peripheral.wrap("top")

clear_console()

--print("Type \"help\" to list all available arguments")
--print("Placeholder")
--print("Other text")
--print("")

local i = 0

local function redraw()
    local x, y = term.getCursorPos()
    term.setCursorPos(1, 2)
    term.clearLine()
    i = i + 1
    term.write("i =" .. i)
    term.setCursorPos(x, y)
end

local function async_ui()
    --while true do
    --    redraw()
    --    sleep(0.1)
    --end

    while true do
        sleep(0.1)
    end
end

local necessary_reloader_arguments = {"load", "unload", "reload"}
local necessary_cannon_controller_arguments = {"move_pitch", "move_yaw", "enable_cannon", "disable_cannon", "fire"}

local function connect_to_modules()
    local function os_info()
        print("Cannon node controller 0.0.1")
        print("Made by Autist69420")
        print("Code repository: https://github.com/Autist69420/Minecraft_cannon_project")
        -- notable mentions
        print("Ballistic calculator made by: @sashafiesta#1978 @Malex#6461")
        print("")
    end

    local function await_connection_to_reloader()
        local function are_valid_reloader_arguments()
            return true
        end

        local x, y = term.getCursorPos()

        -- red text on white
        term.setTextColor(16384)
        term.setBackgroundColor(1)

        term.write("Trying to connect to the reloading module...")
        while true do
            local  _, freq, _, _, msg, _ = os.pullEvent("modem_message")
            if freq == "back" and msg["message"] == "reloader" then
                if are_valid_reloader_arguments() then break end
            end
        end

        term.setTextColor(32)
        term.setBackgroundColor(32768)
        term.setCursorPos(x,y)
        term.clearLine()

        term.write("Connected to the reloading module!")
        term.setCursorPos(x, y+1)
    end

    local function await_connection_to_cannon_controller()
        local function are_valid_cannon_control_arguments() return true end
        local x, y = term.getCursorPos()

        -- red text on white
        term.setTextColor(16384)
        term.setBackgroundColor(1)

        term.write("Trying to connect to the cannon control module...")
        while true do
            local  _, freq, _, _, msg, _ = os.pullEvent("modem_message")
            if freq == "back" and msg["message"] == "cannon_ctrl" then
                if are_valid_cannon_control_arguments() then break end
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

    term.setTextColor(colors.white)
    term.setBackgroundColor(colors.black)
end

local function main_loop()
    local result = connect_to_modules()

    clear_console()
    if not result then return end

    while true do
        local mytest = io.read()

        sleep(0.1)
    end
end

parallel.waitForAll(async_ui, main_loop)
