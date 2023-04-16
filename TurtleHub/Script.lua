local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})

local Services = game:GetService("Workspace")

local Client = {}
function _CLIENT_enemy()
for _,ClientEnemy in pairs(Services.ClientEnemies:GetChildren()) do
      table.insert(Client, ClientEnemy.Name)
end
end

local cd = 0.5

local _Enemy = {}
function _Enemies()
for _,Enemys in pairs(Services.Enemies:GetChildren()) do
     table.insert(_Enemy, Enemys.Name)
end
end

local Yen = {}
function DropYen()
for _,YenDrop in pairs(Services.Drops:GetChildren()) do
      table.insert(Yen, YenDrop.Name)
end
end

local T1 = Window:MakeTab({
Name = "Farm",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://4483345998",
PremiumOnly = false
})

local _function_A3 = "ClientEnemies"
T1:AddDropdown({
Name = "use this function if the feature is bug",
Default = "ClientEnemies",
Options = {"ClientEnemies", "Enemies"},
Callback = function(Value)
          _function_A3 = Value
end    
})

local toggle_Button = false

T1:AddToggle({
Name = "start farming",
Default = false,
Callback = function(Value)
toggle_Button = Value
while wait(cd) do
if toggle_Button == false then break end
if _function_A3 == "ClientEnemies" then
 _CLIENT_enemy()
 local args = {
    [1] = {
        [1] = {
            [1] = "%",
            [2] = Client[math.random(1, #Client)]
        }
    }
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
 end
 if _function_A3 == "Enemies" then
 _Enemies()
 local args = {
    [1] = {
        [1] = {
            [1] = "%",
            [2] = _Enemy[math.random(1, #_Enemy)]
        }
    }
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
 end
 end
end    
})

local toggle_Click = false
T1:AddToggle({
Name = "Auto attack or click",
Default = false,
Callback = function(Value)
toggle_Click = Value
while wait(cd) do
if toggle_Click == false then break end
local args = {
    [1] = {
        [1] = {
            [1] = "&"
        }
    }
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
end
end    
})

local toggle_Yen = false
T1:AddToggle({
Name = "Auto collect yen",
Default = false,
Callback = function(Value)
toggle_Yen = Value
while wait(cd) do
if toggle_Yen == false then break end
DropYen()
local args = {
    [1] = {
        [1] = {
            [1] = ".",
            [2] = Yen[math.random(1, #Yen)]
        }
    }
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
end
end    
})
