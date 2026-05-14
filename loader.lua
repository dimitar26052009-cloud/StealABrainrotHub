-[[
    STEAL A BRAINROT HUB
    Created by: dimitar26052009-cloud
    Version: 1.0
    
    How to use:
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dimitar26052009-cloud/StealABrainrotHub/main/loader.lua"))()
]]

print("="*60)
print("STEAL A BRAINROT HUB - Loading...")
print("="*60)

-- Check if correct game
local PlaceId = game.PlaceId
local GAME_ID = 109983668079237

if PlaceId ~= GAME_ID then
    warn("[SAB HUB] Wrong game! This hub is for Steal a Brainrot only.")
    warn("[SAB HUB] Current PlaceID:", PlaceId)
    warn("[SAB HUB] Required PlaceID:", GAME_ID)
    return
end

-- Check if already loaded
if _G.SABHub then
    warn("[SAB HUB] Already loaded!")
    return
end

_G.SABHub = true

-- Initialize global settings
_G.SABSettings = {
    version = "1.0",
    premium = false,
    
    -- ESP Settings
    esp = {
        enabled = false,
        showConveyor = true,
        showBases = true,
        showBrainrots = true,
        showDistance = true
    },
    
    -- Auto Buy Settings
    autoBuy = {
        enabled = false,
        rarities = {"Secret", "OG", "Brainrot God"},
        maxPrice = 100000000000, -- 100B
        mutations = {},
        minValue = 0
    },
    
    -- Auto Steal Settings (Premium)
    autoSteal = {
        enabled = false,
        minValue = 50000000, -- 50M
        rarities = {"Secret", "OG", "Brainrot God"},
        whitelist = {},
        safeMode = true,
        delay = 15 -- seconds between steals
    },
    
    -- Movement Settings
    movement = {
        speed = 16,
        fly = false,
        noclip = false
    }
}

-- Load UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Create Window
local Window = Library.CreateLib("STEAL A BRAINROT HUB", "Ocean")

print("[SAB HUB] UI Library loaded")

-- Load main GUI
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dimitar26052009-cloud/StealABrainrotHub/main/ui/main_gui.lua"))()
end)

if not success then
    warn("[SAB HUB] Failed to load main GUI:", err)
    return
end

print("[SAB HUB] ✓ Loaded successfully!")
print("[SAB HUB] Press RIGHT SHIFT to toggle UI")
print("="*60)

-- Store window globally
_G.SABWindow = Window