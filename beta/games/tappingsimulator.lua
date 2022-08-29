---- PloxHud BETA UI
----- Game: Tapping Simulator

if game.PlaceId == 5098929086 then

    local Library = loadstring(game:HttpGetAsync(("https://eqq-evil.github.io/plox-hud/venyx%20ui.lua")))()

    local function notify(title,description,duration)
        loadstring(game:HttpGetAsync(("https://eqq-evil.github.io/plox-hud/notify.lua")))().Notify({
            Title = title,
            Description = description,
            Duration = duration
        })
    end
    
    notify("PloxHud", "Loaded betaUI",10)

    local w = Library.new("PloxHud")

    
    local Pages = {
        Main = w:addPage("Main",5012544693),
        Settings = w:addPage("Settings",5012544693)
    }

    local Sections = {
        misc = Pages.Main:addSection("Misc"),
        lplr = Pages.Main:addSection("LocalPlayer"),
        ver = Pages.Settings:addSection("Version"),
        gui = Pages.Settings:addSection("GUI")
    }

    shared.AutoTap = false
    shared.AutoRebirth = false

    Sections.misc:addToggle("AutoTap", false, function(bool)
        shared.AutoTap = bool
        if bool == true then
            notify("PloxHud", "AutoTap Enabled",2)
        else
            notify("PloxHud", "AutoTap Disabled",2)
        end
    end)

    Sections.misc:addToggle("AutoRebirth", false, function(bool)
        shared.AutoRebirth = bool
        if bool == true then
            notify("PloxHud", "AutoRebirth Enabled",2)
        else
            notify("PloxHud", "AutoRebirth Disabled",2)
        end
    end)

    Sections.lplr:addSlider("WalkSpeed", math.floor(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed), math.floor(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed), 1000, function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end)

    Sections.lplr:addSlider("WalkSpeed", math.floor(game.Players.LocalPlayer.Character.Humanoid.JumpPower), math.floor(game.Players.LocalPlayer.Character.Humanoid.JumpPower), 1000, function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end)

    w:SelectPage(w.pages[1], true)

    Sections.ver:addButton(getgenv().Name)
    Sections.ver:addButton("Version betaUI")
    Sections.ver:addButton("Made by "..getgenv().Scripter)

    Sections.gui:addKeybind("Toggle GUI", Enum.KeyCode.RightControl, function()
        w:toggle()
    end)

    Sections.gui:addButton("Colors:")

    local themes = {
        Background = Color3.fromRGB(255, 255, 255),
        Glow = Color3.fromRGB(175, 255, 71),
        Accent = Color3.fromRGB(175, 255, 71),
        LightContrast = Color3.fromRGB(255, 255, 255),
        DarkContrast = Color3.fromRGB(255, 255, 255),  
        TextColor = Color3.fromRGB(0, 0, 0)
    }

    for theme, color in pairs(themes) do
        w:setTheme("Background",Color3.fromRGB(255, 255, 255))
        w:setTheme("Glow", Color3.fromRGB(175, 255, 71))
        w:setTheme("Accent", Color3.fromRGB(175, 255, 71))
        w:setTheme("LightContrast", Color3.fromRGB(255, 255, 255))
        w:setTheme("DarkContrast", Color3.fromRGB(255, 255, 255))
        w:setTheme("TextColor",Color3.fromRGB(0,0,0))

        Sections.gui:addColorPicker(theme, color, function(color3)
            w:setTheme(theme, color3)
        end)
    end

    while true do
        wait(.1)
        if shared.AutoTap == true then
            game:GetService("ReplicatedStorage").PlayerClick:FireServer(false)
        end
        if shared.AutoRebirth == true then
            game:GetService("ReplicatedStorage").PlayerClick:FireServer(false)
            wait(.1)
            game:GetService("ReplicatedStorage").PlayerRebirth:FireServer(1)
        end
    end
end
