local callbacks = {}

callbacks.notify = function(title,description,duration)
    loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/mrm7000/plox-hud/main/notify.lua")))().Notify({
        Title = title,
        Description = description,
        Duration = duration
    })
end

callbacks.Loader = function(g)
    local UI = Instance.new("ScreenGui")
    local Main = Instance.new("ImageLabel")
    local Plox = Instance.new("TextLabel")
    local Hud = Instance.new("TextLabel")
    local tysm = Instance.new("TextLabel")
    local tysmr = Instance.new("ImageLabel")
  
    UI.Name = "UI"
    UI.Parent = game.CoreGui
  
    Main.Name = "Main"
    Main.Parent = UI
    Main.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    Main.BackgroundTransparency = 1.000
    Main.ClipsDescendants = true
    Main.Position = UDim2.new(0.45762825, -75, 0.491325974, -37)
    Main.Size = UDim2.new(0, 285, 0, 76)
    Main.Image = "rbxassetid://3570695787"
    Main.ImageColor3 = Color3.fromRGB(48, 48, 48)
    Main.ScaleType = Enum.ScaleType.Slice
    Main.SliceCenter = Rect.new(100, 100, 100, 100)
    Main.SliceScale = 0.120
  
    Plox.Name = "Plox"
    Plox.Parent = Main
    Plox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Plox.BackgroundTransparency = 1.000
    Plox.Position = UDim2.new(0.342508763, 0, 0.333470106, 0)
    Plox.Size = UDim2.new(0, 45, 0, 25)
    Plox.Font = Enum.Font.GothamBold
    Plox.Text = "Plox"
    Plox.TextColor3 = Color3.fromRGB(255, 255, 255)
    Plox.TextScaled = true
    Plox.TextSize = 21.000
    Plox.TextWrapped = true
    Plox.TextXAlignment = Enum.TextXAlignment.Left
  
    Hud.Name = "Hud"
    Hud.Parent = Plox
    Hud.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hud.BackgroundTransparency = 1.000
    Hud.Position = UDim2.new(0.997591972, 0, -0.00319284946, 0)
    Hud.Size = UDim2.new(0, 45, 0, 25)
    Hud.Font = Enum.Font.GothamBold
    Hud.Text = "Hud"
    Hud.TextColor3 = Color3.fromRGB(175, 255, 71)
    Hud.TextScaled = true
    Hud.TextSize = 21.000
    Hud.TextWrapped = true
    Hud.TextXAlignment = Enum.TextXAlignment.Left
  
    tysm.Name = "tysm"
    tysm.Parent = Main
    tysm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tysm.BackgroundTransparency = 1.000
    tysm.BorderSizePixel = 0
    tysm.Position = UDim2.new(0.147368416, 0, 0.157894731, 0)
    tysm.Size = UDim2.new(0, 200, 0, 50)
    tysm.ZIndex = 2
    tysm.Font = Enum.Font.GothamBold
    tysm.Text = "Thank You So Much For Using PloxHud!"
    tysm.TextColor3 = Color3.fromRGB(255, 255, 255)
    tysm.TextSize = 9.000
    tysm.Visible = false
  
    tysmr.Name = "tysmr"
    tysmr.Parent = tysm
    tysmr.AnchorPoint = Vector2.new(0.5, 0.5)
    tysmr.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tysmr.BackgroundTransparency = 1.000
    tysmr.Position = UDim2.new(0.5, 0, 0.5, 0)
    tysmr.Size = UDim2.new(1, 0, 1, 0)
    tysmr.Image = "rbxassetid://3570695787"
    tysmr.ImageColor3 = Color3.fromRGB(60, 60, 60)
    tysmr.ScaleType = Enum.ScaleType.Slice
    tysmr.SliceCenter = Rect.new(100, 100, 100, 100)
    tysmr.SliceScale = 0.120
  
    for i = 1,4,1 do
        wait(2)
        game:GetService("TweenService"):Create(Plox, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(175, 255, 71)}):Play()
        game:GetService("TweenService"):Create(Hud, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        wait(2)
        game:GetService("TweenService"):Create(Plox, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        game:GetService("TweenService"):Create(Hud, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(175, 255, 71)}):Play()
    end
    Plox:TweenPosition(UDim2.new(0.343, 0, 0.202, 0),"Out","Quint",0.5)
    Main:TweenSize(UDim2.new(0, 285,0, 146),"Out","Quint",0.5)
    wait(.5)
    tysm.Visible = true
    tysm:TweenPosition(UDim2.new(0.151, 0,0.5, 0),"Out","Quint",0.5)
    wait(4)
    Main:TweenSize(UDim2.new(0, 285, 0, 0),"Out","Quint",0.5)
    wait(.6)
    if g == "Tapping Simulator" then
        callbacks.notify("PloxHud", "Loaded b0.1",10)
        loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/mrm7000/plox-hud/main/games/Tapping%20Simulator.lua")))()
    else
        callbacks.notify("PloxHud", "Game Not Supported",10)
    end
    UI:Destroy()
end

if game.PlaceId == 5098929086 then
    callbacks.Loader("Tapping Simulator")
else
    callbacks.Loader("Just Load")
end
