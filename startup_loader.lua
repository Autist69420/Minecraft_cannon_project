---
--- Created by Autist69420.
---

function loader()
    local function load_preset()
        local out = fs.open("settings", "r")
        local type = out.readLine()

        if type == "cannon_node" then
            shell.run("rm cannon_node.lua")
            shell.run("wget https://raw.githubusercontent.com/Autist69420/Minecraft_cannon_project/master/cannon_node.lua")
            shell.run("cannon_node.lua")
        elseif type == "reloader_controller" then
            shell.run("rm reloader_controller.lua")
            shell.run("wget https://raw.githubusercontent.com/Autist69420/Minecraft_cannon_project/master/reloader_controller.lua")
            shell.run("reloader_controller.lua")
        elseif type == "cannon_controller" then
            shell.run("rm cannon_controller.lua")
            shell.run("wget https://raw.githubusercontent.com/Autist69420/Minecraft_cannon_project/master/cannon_controller.lua")
            shell.run("cannon_controller.lua")
        elseif type == "main_node" then
            print("Not implemented")
        end
    end

    local function configure_new()
        term.clear()
        term.setCursorPos(1, 1)

        while true do
            print("Hello, please choose what part of automatic cannon is this:\n1 - Cannon node\n2 - Cannon controller\n3 - Cannon reloader\n")
            local answer = io.read()

            if answer == "1" then
                local file = fs.open("settings", "w")
                file.write("cannon_node")
                file.close()
                os.reboot()
            elseif answer == "2" then
                local file = fs.open("settings", "w")
                file.write("cannon_controller")
                file.close()
                os.reboot()
            elseif answer == "3" then
                local file = fs.open("settings", "w")
                file.write("reloader_controller")
                file.close()
                os.reboot()
            else
                term.clear()
                term.setCursorPos(1, 1)

                print("Not correct option, try again")
            end
        end
    end

    if fs.exists("settings") then
        load_preset()
        return
    end
    configure_new()
end


loader()