_G.ToggleColor = Color3.fromRGB(175, 255, 71);
_G.SliderColor = Color3.fromRGB(175, 255, 71);
_G.ButtonColor = Color3.fromRGB(175, 255, 71);

if game.PlaceId == 5098929086 then

    local Library = loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/eqq-evil/plox-hud/main/wally%20ui.lua")))()

    local function notify(title,description,duration)
        loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/eqq-evil/plox-hud/main/notify.lua")))().Notify({
            Title = title,
            Description = description,
            Duration = duration
        })
    end

    Library.notify = notify
    
    Library.notify("PloxHud", "Loaded "..getgenv().Version,10)
    
    local Windows = {
        Main = Library:CreateWindow("Main"),
        Settings = Library:CreateWindow("Settings")
    }

    local folders = {
        misc = Windows.Main:CreateFolder("Misc"),
        lplr = Windows.Main:CreateFolder("LocalPlayer"),
        ver = Windows.Settings:CreateFolder("Version"),
        gui = Windows.Settings:CreateFolder("GUI")
    }

    shared.AutoTap = false
    shared.AutoRebirth = false

    folders.misc:Toggle("AutoTap", function(bool)
        shared.AutoTap = bool
        if bool == true then
            Library.notify("PloxHud", "AutoTap Enabled",2)
        else
            Library.notify("PloxHud", "AutoTap Disabled",2)
        end
    end)

    folders.misc:Toggle("AutoRebirth", function(bool)
        shared.AutoRebirth = bool
        if bool == true then
            Library.notify("PloxHud", "AutoRebirth Enabled",2)
        else
            Library.notify("PloxHud", "AutoRebirth Disabled",2)
        end
    end)

    folders.lplr:Slider("WalkSpeed",math.floor(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed),1000,math.floor(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed),function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end)

    folders.lplr:Slider("JumpPower",math.floor(game.Players.LocalPlayer.Character.Humanoid.JumpPower),1000,math.floor(game.Players.LocalPlayer.Character.Humanoid.JumpPower),function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end)

    folders.ver:Label(getgenv().Name,Color3.fromRGB(38,38,38),Color3.fromRGB(175, 255, 71))
    folders.ver:Label("Version "..getgenv().Version,Color3.fromRGB(38,38,38),Color3.fromRGB(175, 255, 71))
    folders.ver:Label("Made by "..getgenv().Scripter,Color3.fromRGB(38,38,38),Color3.fromRGB(175, 255, 71))

    folders.gui:DestroyGUI()
    folders.gui:GuiSettings()

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
