_G.ToggleColor = Color3.fromRGB(175, 255, 71);
_G.SliderColor = Color3.fromRGB(175, 255, 71);
_G.ButtonColor = Color3.fromRGB(175, 255, 71);

if game.PlaceId == 155615604 then

    local function GetPos()
        return game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
    
    local function GetCamPos()
        return workspace.CurrentCamera.CFrame
    end
    
    local function GetTeam()
        return game.Players.LocalPlayer.TeamColor.Name
    end

    local function GetPlayer(String)
        if not String then return end
        local Yes = {}
        for _, Player in ipairs(game.Players:GetPlayers()) do
            if string.lower(Player.Name):match(string.lower(String)) or string.lower(Player.DisplayName):match(string.lower(String)) then
                table.insert(Yes, Player)
            end
        end
        if #Yes > 0 then
            return Yes[1]
        elseif #Yes < 1 then
            return nil
        end
    end

    local function Kill(Player)
        pcall(function()
            if Player.Character:FindFirstChild("ForceField") or not workspace:FindFirstChild(Player.Name) or not workspace:FindFirstChild(Player.Name):FindFirstChild("Head") or Player == nil or Player.Character.Parent ~= workspace then return end
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
    
            local MyTeam = GetTeam()
            if Player.TeamColor.Name == game.Players.LocalPlayer.TeamColor.Name then
                local savedcf = GetPos()
                local savedcamcf = GetCamPos()
                workspace.Remote.loadchar:InvokeServer(nil, BrickColor.random().Name)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedcf
                workspace.CurrentCamera.CFrame = savedcamcf
                workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver["Remington 870"].ITEMPICKUP)
            end
    
            local Gun = game.Players.LocalPlayer.Character:FindFirstChild("Remington 870") or game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870")
    
            local FireEvent = {
                [1] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [2] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [3] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [4] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [5] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [6] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [7] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }, [8] = {
                    ["RayObject"] = Ray.new(Vector3.new(), Vector3.new()), 
                    ["Distance"] = 0, 
                    ["Cframe"] = CFrame.new(), 
                    ["Hit"] = workspace[Player.Name].Head
                }
            }
    
            game:GetService("ReplicatedStorage").ShootEvent:FireServer(FireEvent, Gun)
            Gun.Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Character["Remington 870"]:Destroy()
        end)
    end
    
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
        main = Library:CreateWindow("Main"),
        kill = Library:CreateWindow("Kill"),
        setting = Library:CreateWindow("Settings")
    }

    local folders = {
        lkill = Windows.kill:CreateFolder("Loop Kill"),
        qkill = Windows.kill:CreateFolder("Kill"),
        lplr = Windows.main:CreateFolder("LocalPlayer"),
        team = Windows.main:CreateFolder("Team"),
        other = Windows.main:CreateFolder("Other"),
        ver = Windows.setting:CreateFolder("Version"),
        gui = Windows.setting:CreateFolder("GUI")
    }

    shared.LoopKillAll = false
    shared.LoopKillInmates = false
    shared.LoopKillGuards = false
    shared.LoopKillCriminals = false

    folders.lkill:Toggle("Loop Kill All", function(bool)
        shared.LoopKillAll = bool
        if bool == true then
            Library.notify("PloxHud", "Loop Kill All Enabled",2)
        else
            Library.notify("PloxHud", "Loop Kill All Disabled",2)
        end
    end)

    folders.lkill:Toggle("Loop Kill Inmates", function(bool)
        shared.LoopKillInmates = bool
        if bool == true then
            Library.notify("PloxHud", "Loop Kill Inmates Enabled",2)
        else
            Library.notify("PloxHud", "Loop Kill Inmates Disabled",2)
        end
    end)

    folders.lkill:Toggle("Loop Kill Guards", function(bool)
        shared.LoopKillGuards = bool
        if bool == true then
            Library.notify("PloxHud", "Loop Kill Guards Enabled",2)
        else
            Library.notify("PloxHud", "Loop Kill Guards Disabled",2)
        end
    end)

    folders.lkill:Toggle("Loop Kill Criminals", function(bool)
        shared.LoopKillCriminals = bool
        if bool == true then
            Library.notify("PloxHud", "Loop Kill Criminals Enabled",2)
        else
            Library.notify("PloxHud", "Loop Kill Criminals Disabled",2)
        end
    end)

    folders.team:Button("Team Guards",function()
        workspace.Remote.TeamEvent:FireServer("Bright blue")
    end)

    folders.team:Button("Team Inmate",function()
        workspace.Remote.TeamEvent:FireServer("Bright orange")
    end)

    folders.team:Button("Team Criminals",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-976.125183, 109.123924, 2059.99536)
        wait(.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(918.77,100,2379.07)
    end)

    folders.team:Button("Team Neutral",function()
        workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    end)

    folders.other:Button("Arrest All Criminals",function()
        local cposs = GetCamPos()
        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
        if v.Name ~= game.Players.LocalPlayer then
        local i = 10
            repeat
            wait()
            i = i-1
            workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
            until i == 0
        end
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cposs
        Library.notify("PloxHud", "Arrested All Criminals", 2)
    end)

    folders.qkill:Box("Kill Player","string",function(value)
        local Player = GetPlayer(value)
		if Player ~= nil then
			Kill(Player)
			Library.notify("PloxHud","Killed "..Player.Name,2)
		else
            Library.notify("PloxHud","Player Not Found.",2)
		end
    end)

    folders.qkill:Button("Kill All", function()
        for _,v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer then
				Kill(v)
			end
		end
    end)

    folders.qkill:Button("Kill Inmates", function()
        for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer then
				if v.TeamColor.Name == "Bright orange" then
					Kill(v)
				end
			end
		end
    end)

    
    folders.qkill:Button("Kill Guards", function()
        for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer then
				if v.TeamColor.Name == "Bright blue" then
					Kill(v)
				end
			end
		end
    end)

    folders.qkill:Button("Kill Criminals", function()
        for i,v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer then
				if v.TeamColor.Name == "Bright blue" then
					Kill(v)
				end
			end
		end
    end)


    folders.lplr:Slider("WalkSpeed",math.floor(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed),1000,math.floor(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed),function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end)

    folders.lplr:Slider("JumpPower",math.floor(game.Players.LocalPlayer.Character.Humanoid.JumpPower),1000,math.floor(game.Players.LocalPlayer.Character.Humanoid.JumpPower),function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end)

    folders.lplr:Button("Destroy Doos", function()
        workspace.Doors:Destroy()
    end)

    folders.ver:Label(getgenv().Name,Color3.fromRGB(38,38,38),Color3.fromRGB(175, 255, 71))
    folders.ver:Label("Version "..getgenv().Version,Color3.fromRGB(38,38,38),Color3.fromRGB(175, 255, 71))
    folders.ver:Label("Made by "..getgenv().Scripter,Color3.fromRGB(38,38,38),Color3.fromRGB(175, 255, 71))

    folders.gui:DestroyGUI()
    folders.gui:GuiSettings()


    while true do
        wait(0.1)
        if shared.LoopKillAll == true then
            for _,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    Kill(v)
                end
            end
        end
        if shared.LoopKillInmates == true then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if v.TeamColor.Name == "Bright orange" then
                        Kill(v)
                    end
                end
            end
        end
        if shared.LoopKillGuards == true then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if v.TeamColor.Name == "Bright blue" then
                        Kill(v)
                    end
                end
            end
        end
        if shared.LoopKillCriminals == true then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if v.TeamColor.Name == "Bright blue" then
                        Kill(v)
                    end
                end
            end
        end
    end
end
