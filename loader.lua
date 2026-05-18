--[[
    STEAL A BRAINROT HUB
    Created by: dimitar26052009-cloud
    Version: 1.0
]]

print("============================================================")
print("STEAL A BRAINROT HUB - Loading...")
print("============================================================")

-- Check if correct game
local PlaceId = game.PlaceId
local GAME_ID = 109983668079237

if PlaceId ~= GAME_ID then
    warn("[SAB HUB] Wrong game! This hub is for Steal a Brainrot only.")
    warn("[SAB HUB] Current PlaceID: " .. PlaceId)
    warn("[SAB HUB] Required PlaceID: " .. GAME_ID)
    return
end

-- Check if already loaded
if _G.SABHub then
    warn("[SAB HUB] Already loaded!")
    return
end

_G.SABHub = true

print("[SAB HUB] Loading UI Library...")

-- Load Orion UI Library (more reliable)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Create Window
local Window = OrionLib:MakeWindow({
    Name = "Steal a Brainrot Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "SABHub"
})

print("[SAB HUB] UI Library loaded!")

-- Home Tab
local HomeTab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

HomeTab:AddLabel("Steal a Brainrot Hub v1.0")
HomeTab:AddLabel("Created by: dimitar26052009-cloud")
HomeTab:AddLabel("Press RIGHT CTRL to toggle UI")

local player = game.Players.LocalPlayer

-- Movement Tab
local MovementTab = Window:MakeTab({
    Name = "Movement",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MovementTab:AddSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 500,
    Default = 16,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(Value)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
    end    
})

MovementTab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
        _G.InfiniteJump = Value
        
        if Value then
            game:GetService("UserInputService").JumpRequest:connect(function()
                if _G.InfiniteJump and player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid:ChangeState("Jumping")
                end
            end)
        end
    end    
})

-- ESP Tab
local ESPTab = Window:MakeTab({
    Name = "ESP",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

ESPTab:AddLabel("ESP features coming soon!")
ESPTab:AddLabel("Will show brainrots on conveyor")
ESPTab:AddLabel("Will show player bases")

-- Settings Tab
local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

SettingsTab:AddButton({
    Name = "Destroy GUI",
    Callback = function()
        OrionLib:Destroy()
    end    
})

print("[SAB HUB] ✓ Loaded successfully!")
print("[SAB HUB] Press RIGHT CTRL to toggle UI")
print("============================================================")

OrionLib:Init()