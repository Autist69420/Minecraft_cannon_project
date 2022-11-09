---
--- Created by SpaceEye.
---

function loader()
    local function load_preset()
        local out = fs.open("settings", "r")
        local type = out.readLine()

        if type == "cannon_node" then
            shell.run("rm cannon_node")
            shell.run("wget https://github.com/SuperSpaceEye/Minecraft_cannon_project/blob/master/cannon_node.lua")
            shell.run("cannon_node")

        elseif type == "reloader_controller" then

        elseif type == "cannon_controller" then

        elseif type == "main_node" then

        end
    end

    local function configure_new()
        temp.clear()
        temp.setCursorPos(1, 1)

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
                temp.clear()
                temp.setCursorPos(1, 1)

                print("Not correct option, try again")
            end
        end
    end

    local function try_update_version()
        local function compare_files()
            current_file = fs.open("startup", "r")
            new_file = fs.open("temp_loader", "r")

            if current_file.readAll() == new_file.readAll() then
                return true
            end
            return false
        end

        shell.run("wget https://raw.githubusercontent.com/SuperSpaceEye/Minecraft_cannon_project/master/startup_loader.lua temp_loader")
        if compare_files() then
            shell.run("rm temp_loader")
        else
            shell.run("rm startup")
            shell.run("rename temp_loader startup")
            os.reboot()
        end
    end

    try_update_version()

    if fs.exists("settings") then
        load_preset()
        return
    end
    configure_new()
end


loader()