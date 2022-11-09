---
--- Created by SpaceEye.
---

function loader()
    local function load_preset()
        local out = fs.open("settings", "r")
        local type = out.readLine()

        if type == "cannon_node" then

        elseif type == "reloader" then

        elseif type == "cannon_controler" then

        elseif type == "main_node" then

        end
    end

    local function configure_new()

    end

    local function update_version()
        os.shell("wget ")
    end

    if fs.exists("settings") then
        load_preset()
        return
    end
    configure_new()
end


loader()