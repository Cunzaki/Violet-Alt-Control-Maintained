if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

local args = {...}
local controller = args[1].controller
local bots = args[1].bots
local config = args[1].config
















if not (game:GetService("Players").LocalPlayer.Name == controller["MainAccount"]) then
    local UserSettings = UserSettings()
    UserSettings.GameSettings.MasterVolume = 0
    task.wait()
    setfpscap(30)
    task.wait()
    game:GetService("RunService"):Set3dRenderingEnabled(false)
    task.wait()
    game:GetService("Players").LocalPlayer.PlayerGui:Destroy()
    task.wait()
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
    task.wait()
    for i,v in next, workspace:GetDescendants() do
    if v:IsA'Seat' then
    v:Destroy()
    end
    end
    task.wait()
    repeat task.wait() until game:GetService("Players").LocalPlayer
    local connections = getconnections or get_signal_cons
    if connections then
        for _, v in pairs(connections(game:GetService("Players").LocalPlayer.Idled)) do
            if v.Disable then
                v:Disable()
            elseif v.Disconnect then
                v:Disconnect()
            end
        end
    end
end
local function resetAllLoops()
    -- Reset all loop variables with multiple attempts to ensure they're properly set
    for attempt = 1, 3 do
        getgenv().LoopSwarm = false
        getgenv().LoopLine = false
        getgenv().LoopWall = false
        getgenv().LoopLook = false
        getgenv().LoopFollow = false
        getgenv().LoopStack = false
        getgenv().LoopFastSpam = false
        getgenv().LoopSlowSpam = false
        task.wait(0.05) -- Small delay between attempts
    end
    
    -- Clean up any parts that might have been created
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "PartForBot" or v.Name == "NewPartInstance" then
            v:Destroy()
        end
    end
end

local function sendChatMessage(message, target)
    target = target or "All"
    local success = pcall(function()
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
    end)
    
    if not success then
        pcall(function()
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, target)
        end)
    end
end

for i, botName in ipairs(bots) do
    if game:GetService("Players").LocalPlayer.Name == botName and config["SendJoinMsg"] == true then
        ohString1 = "A bot has loaded! [Bot " .. i .. " of " .. #bots .. "]"
        sendChatMessage(ohString1)
        task.wait()
    end
end

    if not (game:GetService("Players").LocalPlayer.Name == controller["MainAccount"]) then
    local mainAccount = game:GetService("Players"):FindFirstChild(controller["MainAccount"])
    if mainAccount then
        mainAccount.Chatted:Connect(function(msg)
            -- Add a small random delay to prevent all bots from processing commands simultaneously
            -- This helps prevent race conditions and makes command processing more reliable
            task.wait(math.random(0, 10) / 100) -- Random delay between 0 and 0.1 seconds
            
            local success, error = pcall(function()


    local args = string.split(string.lower(msg), " ")
    local cmd = args[1]
    local function chatmsg(message, target)
        sendChatMessage(message, target)
    end

        
    if cmd == "$say" then
        local say_msg = string.sub(msg, string.len(cmd)+2, string.len(msg))
        ohString1 = say_msg
        chatmsg(ohString1)
    end

    local args = string.split(string.lower(msg), " ")
    local cmd = args[1]
                
    
local function randomString(length)
    local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local str = ''
    for i = 1, length do
        local randomIndex = math.random(#chars)
        str = str .. string.sub(chars, randomIndex, randomIndex)
    end
    return str
end

if cmd == "$slowspam" then
    getgenv().LoopSlowSpam = false
    getgenv().LoopFastSpam = false
    local say_msg = string.sub(msg, string.len(cmd) + 2, string.len(msg))
    getgenv().LoopSlowSpam = true
    local counter = 0  
    while getgenv().LoopSlowSpam == true do
        task.wait(math.random(2, 4)) 
        counter = counter + 1
        if counter % 3 == 0 then
            local random_replacement = randomString(3) 
            ohString1 = string.gsub(say_msg, " ", random_replacement)
        elseif counter % 3 == 1 then
            ohString1 = say_msg
        else
            ohString1 = randomString(3) 
        end
        chatmsg(ohString1)
    end
end


    
    if cmd == "$fastspam" then
        getgenv().LoopFastSpam = false
        getgenv().LoopSlowSpam = false
        local say_msg = string.sub(msg, string.len(cmd)+2, string.len(msg))
        getgenv().LoopFastSpam = true
        while getgenv().LoopFastSpam == true do
            task.wait()
            ohString1 = say_msg
            chatmsg(ohString1)
        end
    end
                
    if msg == "$unspam" then
        -- Use the resetAllLoops function to ensure all loops are stopped
        resetAllLoops()
    end
                
    if msg == "$rj" then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,game:GetService("Players").LocalPlayer)
        ohString1 = "Rejoining bot for an update to the script to replicate!"
        chatmsg(ohString1) 
    end

        if msg == "$cmds" then
        if game:GetService("Players").LocalPlayer.Name == bots[1] then
        chatmsg("")
        elseif game:GetService("Players").LocalPlayer.Name ~= bots[1] then
        
        end
        end
            
    if msg == "$jump" then
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.Jump = true
        end
    end

    if msg == "$dance1" then
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("Animate") then
            character.Animate.Disabled = true
            task.wait()
            character.Animate.Disabled = false
            game:GetService("Players"):Chat("/e dance")
        end
    end 

    if msg == "$dance2" then
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("Animate") then
            character.Animate.Disabled = true
            task.wait()
            character.Animate.Disabled = false
            game:GetService("Players"):Chat("/e dance2")
        end
    end

    if msg == "$dance3" then
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("Animate") then
            character.Animate.Disabled = true
            task.wait()
            character.Animate.Disabled = false
            game:GetService("Players"):Chat("/e dance3")
        end
    end

    if msg == "$dance4" then
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") and character:FindFirstChild("Animate") then
            local Anim = Instance.new("Animation")
            Anim.AnimationId = "rbxassetid://12874447851"
            local k = character.Humanoid:LoadAnimation(Anim)
            k:Play(0)
            k:AdjustSpeed(1)
            character.Animate.Disabled = true
            character.Humanoid.Running:connect(function(speed)
                if speed > 0 then
                    character.Animate.Disabled = false
                    k:Stop(0)
                end
            end)
        end
    end

    if msg == "$laugh" then
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("Animate") then
            character.Animate.Disabled = true
            task.wait()
            character.Animate.Disabled = false
            game:GetService("Players"):Chat("/e laugh")
        end
    end
         
    if msg == "$wave" then
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("Animate") then
            character.Animate.Disabled = true
            task.wait()
            character.Animate.Disabled = false
            game:GetService("Players"):Chat("/e wave")
        end
    end

    if msg == "$cheer" then
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("Animate") then
            character.Animate.Disabled = true
            task.wait()
            character.Animate.Disabled = false
            game:GetService("Players"):Chat("/e cheer")
        end
    end

    if msg == "$point" then
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("Animate") then
            character.Animate.Disabled = true
            task.wait()
            character.Animate.Disabled = false
            game:GetService("Players"):Chat("/e point")
        end
    end

    if msg == "$stopemotes" then
        local character = game:GetService("Players").LocalPlayer.Character
        if character and character:FindFirstChild("Animate") then
            character.Animate.Disabled = true
            task.wait()
            character.Animate.Disabled = false
        end
    end

    if msg and #msg >= 10 and msg:sub(1, 10) == "$calculate" then
        local equation = msg:sub(12)
        local result = loadstring("return " .. equation)()
        if #equation == 0 then
        chatmsg("There must be a math equation after the $math command! | Usage: $math <equation>")
        else
        chatmsg("The answer to the equation you sent: " .. tostring(result))   
    end
    end

    
    if msg and #msg >= 7 and msg:sub(1, 7) == "$runlua" then
        local luaCode = msg:sub(9)
        if #luaCode == 0 then
          chatmsg("There must be code after the $runlua command! | Usage: $runlua <code>")
          return
        end
        local success, result = pcall(loadstring(luaCode))
        if success then chatmsg("✅ | Successfully ran the LUA Code you sent!")
          if result ~= nil then
            chatmsg(result)
          end
        else
          chatmsg("❌ | " .. result)
        end
      end

      if msg:sub(1, 6) == "$predict" then
        local answers = {
            "It is certain.",
            "Without a doubt.",
            "You may rely on it.",
            "Yes, definitely.",
            "It is decidedly so.",
            "As I see it, yes.",
            "Most likely.",
            "Yes.",
            "Outlook good.",
            "Signs point to yes.",
            "Reply hazy, try again.",
            "Better not tell you now.",
            "Ask again later.",
            "Cannot predict now.",
            "Concentrate and ask again.",
            "Don't count on it.",
            "Outlook not so good.",
            "My sources say no.",
            "Very doubtful.",
            "Signs point to no."
        }

        local response = answers[math.random(1, 20)]
        if game:GetService("Players").LocalPlayer.Name == bots[1] then
        chatmsg(response)    
        elseif game:GetService("Players").LocalPlayer.Name ~= bots[1] then    
        end
        end

if msg:sub(1, 6) == "$wall " then
    getgenv().LoopSwarm, getgenv().LoopLine, getgenv().LoopWall, getgenv().LoopLook, getgenv().LoopFollow, getgenv().LoopStack = false, false, false, false, false, false
    local player = game:GetService("Players"):GetPlayers()[
        (function()
            for i, plr in ipairs(game:GetService("Players"):GetPlayers()) do
                if string.lower(plr.Name):sub(1, string.len(msg:sub(7))) == string.lower(msg:sub(7)) or
                    string.lower(plr.DisplayName):sub(1, string.len(msg:sub(7))) == string.lower(msg:sub(7)) then
                    return i
                end
            end
            return nil
        end)()
    ]
    if player then
        local botIndex = 1
        for i, botName in pairs(bots) do
            if string.lower(botName) == string.lower(game:GetService("Players").LocalPlayer.Name) then
                botIndex = i
                break
            end
        end
        local offsets = {4, 8, -4, -8, 12, -12, 16, -16, 20, -20, 24, -24, 28, -28, 32, -32, 36, -36, 40, -40}
        local offset = offsets[botIndex] or 0
        if player == game:GetService("Players").LocalPlayer then
            chatmsg("The user you specified is one of your bots!")
        elseif table.find(bots, player.Name) then
            chatmsg("The user you specified is one of your bots!")
        else
            getgenv().LoopWall = true
             while getgenv().LoopWall do
                 local localChar = game:GetService("Players").LocalPlayer.Character
                 local targetChar = game:GetService("Players")[player.Name].Character
                 if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                     localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(offset, 0, 0)
                 else
                     getgenv().LoopWall = false
                     break
                 end
                 task.wait()
             end
        end
    end
end

        
        if msg:sub(1, 6) == "$line " then
            getgenv().LoopSwarm, getgenv().LoopLine, getgenv().LoopWall, getgenv().LoopLook, getgenv().LoopFollow, getgenv().LoopStack = false, false, false, false, false, false
            local player = game:GetService("Players"):GetPlayers()[
                (function()
                    for i, plr in ipairs(game:GetService("Players"):GetPlayers()) do
                        if string.lower(plr.Name):sub(1, string.len(msg:sub(7))) == string.lower(msg:sub(7)) or
                            string.lower(plr.DisplayName):sub(1, string.len(msg:sub(7))) == string.lower(msg:sub(7)) then
                            return i
                        end
                    end
                    return nil
                end)()
            ]
            if player then
                local botIndex = 1
                for i, botName in pairs(bots) do
                    if string.lower(botName) == string.lower(game:GetService("Players").LocalPlayer.Name) then
                        botIndex = i
                        break
                    end
                end
                local offsets = {-2, -4, -6, -8, -10, -12, -14, -16, -18, -20, -22, -24, -26, -28, -30, -32, -34, -36, -38, -40}
                local offset = offsets[botIndex] or 0
        	if player == game:GetService("Players").LocalPlayer then
            	chatmsg("The user you specified is one of your bots!")
        	elseif table.find(bots, player.Name) then
            	chatmsg("The user you specified is one of your bots!")
        	else
                getgenv().LoopLine = true
                 while getgenv().LoopLine do
                     local localChar = game:GetService("Players").LocalPlayer.Character
                     local targetChar = game:GetService("Players")[player.Name].Character
                     if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                         localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, offset)
                     else
                         getgenv().LoopLine = false
                         break
                     end
                     task.wait()
                 end
            end
        end
       end

if msg:sub(1, 7) == "$swarm " then
    -- Use the resetAllLoops function to ensure all loops are stopped
    resetAllLoops()
    local player = game:GetService("Players"):GetPlayers()[
        (function()
            for i, plr in ipairs(game:GetService("Players"):GetPlayers()) do
                if string.lower(plr.Name):sub(1, string.len(msg:sub(8))) == string.lower(msg:sub(8)) or
                    string.lower(plr.DisplayName):sub(1, string.len(msg:sub(8))) == string.lower(msg:sub(8)) or
                    string.lower(plr.Name):sub(1, string.len(msg:sub(8))) == string.lower(msg:sub(8)).." " or
                    string.lower(plr.DisplayName):sub(1, string.len(msg:sub(8))) == string.lower(msg:sub(8)).." " then
                    return i
                end
            end
            return nil
        end)()
    ]
    if player then
        local botIndex = 1
        for i, botName in pairs(bots) do
            if string.lower(botName) == string.lower(game:GetService("Players").LocalPlayer.Name) then
                botIndex = i
                break
            end
        end
        if player == game:GetService("Players").LocalPlayer then
            chatmsg("The user you specified is one of your bots!")
        elseif table.find(bots, player.Name) then
            chatmsg("The user you specified is one of your bots!")
        else
            getgenv().LoopSwarm = true
             while getgenv().LoopSwarm do
                 local localChar = game:GetService("Players").LocalPlayer.Character
                 local targetChar = game:GetService("Players")[player.Name].Character
                 if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                     localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(math.random(-5,5),0,math.random(-5,5))
                 else
                     getgenv().LoopSwarm = false
                     break
                 end
                 task.wait()
             end
        end
    end
end

            
if msg:sub(1, 8) == "$lookat " then
    -- Use the resetAllLoops function to ensure all loops are stopped
    resetAllLoops()
    local player = game:GetService("Players"):GetPlayers()[
        (function()
            for i, plr in ipairs(game:GetService("Players"):GetPlayers()) do
                if string.lower(plr.Name):sub(1, string.len(msg:sub(9))) == string.lower(msg:sub(9)) or
                    string.lower(plr.DisplayName):sub(1, string.len(msg:sub(9))) == string.lower(msg:sub(9)) then
                    return i
                end
            end
            return nil
        end)()
    ]
    if player then
        local botIndex = 1
        for i, botName in pairs(bots) do
            if string.lower(botName) == string.lower(game:GetService("Players").LocalPlayer.Name) then
                botIndex = i
                break
            end
        end
        if player == game:GetService("Players").LocalPlayer then
            chatmsg("The user you specified is one of your bots!")
        elseif table.find(bots, player.Name) then
            chatmsg("The user you specified is one of your bots!")
        else
            getgenv().LoopLook = true
             while getgenv().LoopLook do
                 local localChar = game:GetService("Players").LocalPlayer.Character
                 local targetChar = game:GetService("Players")[player.Name].Character
                 if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                     localChar.HumanoidRootPart.CFrame = CFrame.lookAt(localChar.HumanoidRootPart.Position, targetChar.HumanoidRootPart.Position)
                 else
                     getgenv().LoopLook = false
                     break
                 end
                 task.wait()
             end
        end
    end
end




if msg:sub(1, 8) == "$follow " then
    local playerName = msg:sub(9)
    -- Use the resetAllLoops function to ensure all loops are stopped
    resetAllLoops()
    
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    local function followPlayer(playerName)
        for _, player in ipairs(Players:GetPlayers()) do
            if string.lower(player.Name):sub(1, #playerName) == string.lower(playerName)
                or string.lower(player.DisplayName):sub(1, #playerName) == string.lower(playerName) then
                if player == game:GetService("Players").LocalPlayer then
                    chatmsg("The user you specified is one of your bots!")
                elseif table.find(bots, player.Name) then
                    chatmsg("The user you specified is one of your bots!")
                else
                    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        getgenv().LoopFollow = true
                         while getgenv().LoopFollow do
                             local localChar = LocalPlayer.Character
                             local targetChar = player.Character
                             if localChar and localChar:FindFirstChild("HumanoidRootPart") and localChar:FindFirstChild("Humanoid") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                                 if (localChar.HumanoidRootPart.Position - targetChar.HumanoidRootPart.Position).Magnitude > 3 then
                                     localChar.Humanoid:MoveTo(targetChar.HumanoidRootPart.Position)
                                 end
                             else
                                 getgenv().LoopFollow = false
                                 break
                             end
                             task.wait()
                         end
                    end
                end
            end
        end
    end
    followPlayer(playerName)
end









if msg:sub(1, 6) == "$goto " then
    -- Use the resetAllLoops function to ensure all loops are stopped
    resetAllLoops()
    local playerName = msg:sub(7)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local function gotoPlayer(playerName)
        for _, player in ipairs(Players:GetPlayers()) do
            if (string.lower(player.Name):sub(1, #playerName) == string.lower(playerName)
                or string.lower(player.DisplayName):sub(1, #playerName) == string.lower(playerName)) then
                if player == LocalPlayer then
                    chatmsg("The user you specified is one of your bots!")
                elseif table.find(bots, player.Name) then
                    chatmsg("The user you specified is one of your bots!")
                else
                    local localChar = LocalPlayer.Character
                     local targetChar = player.Character
                     if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                         localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
                         task.wait()
                         localChar.HumanoidRootPart.CFrame = CFrame.lookAt(localChar.HumanoidRootPart.Position, targetChar.HumanoidRootPart.Position)
                         task.wait()
                     end
                end
            end
        end
    end

    gotoPlayer(playerName)
end

            
if msg:sub(1, 7) == "$stack " then
    -- Use the resetAllLoops function to ensure all loops are stopped
    resetAllLoops()
    local player = game:GetService("Players"):GetPlayers()[
        (function()
            for i, plr in ipairs(game:GetService("Players"):GetPlayers()) do
                if string.lower(plr.Name):sub(1, string.len(msg:sub(8))) == string.lower(msg:sub(8)) or
                    string.lower(plr.DisplayName):sub(1, string.len(msg:sub(8))) == string.lower(msg:sub(8)) then
                    return i
                end
            end
            return nil
        end)()
    ]
    if player then
        local botIndex = 1
        for i, botName in pairs(bots) do
            if string.lower(botName) == string.lower(game:GetService("Players").LocalPlayer.Name) then
                botIndex = i
                break
            end
        end
        local offsets = {5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100}
        local offset = offsets[botIndex] or 0
        if player == game:GetService("Players").LocalPlayer then
            chatmsg("The user you specified is one of your bots!")
        elseif table.find(bots, player.Name) then
            chatmsg("The user you specified is one of your bots!")
        else
            PartForBot = Instance.new("Part", game:GetService("Workspace"))
            PartForBot.Name = "NewPartInstance"
            PartForBot.CFrame = game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
            PartForBot.Transparency = 1
            getgenv().LoopStack = true
            local currentPlayer = player
            while getgenv().LoopStack and currentPlayer == player do
                 local localChar = game:GetService("Players").LocalPlayer.Character
                 local targetChar = game:GetService("Players")[player.Name].Character
                 if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                     localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(0, offset, 0)
                     if game:GetService("Workspace"):FindFirstChild("NewPartInstance") then
                         game:GetService("Workspace").NewPartInstance.CFrame = localChar.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
                     end
                 else
                     getgenv().LoopStack = false
                     break
                 end
                 task.wait()
                 currentPlayer = game:GetService("Players"):GetPlayerByUserId(player.UserId)
             end
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v.Name == "NewPartInstance" then
                    v:Destroy()
                end
            end   
        end
    end
end

            



            
        if msg == "$stop" then
            -- Use the resetAllLoops function to ensure all loops are stopped
            resetAllLoops()
        end

        if msg == "$rejoin" then
             local character = game:GetService("Players").LocalPlayer.Character
             if character then
                 character:Destroy()
             end
         end
           
        if msg == "$fall" then
        function getRoot(char)
	    local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	    return rootPart
        end
        local lp = game:GetService("Players").LocalPlayer
	    if lp and lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") and getRoot(lp.Character) then
		local hum = lp.Character:FindFirstChildOfClass("Humanoid")
		local root = getRoot(lp.Character)
		hum:ChangeState(0)
		root.Velocity = root.CFrame.LookVector * 30
	    end
        end
 
        if msg == "$playercount" then
        if game:GetService("Players").LocalPlayer.Name == bots[1] then
        local botAmount = 0
        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if table.find(bots, player.Name) then
        botAmount = botAmount + 1
        end
        end
        local playerAmount = #game:GetService("Players"):GetPlayers() - botAmount
        chatmsg("There are " .. #game:GetService("Players"):GetPlayers() .. " players currently in the server including " .. botAmount .. " bot(s), " .. playerAmount .. " players without the bot(s) being included!")
        elseif game:GetService("Players").LocalPlayer.Name ~= bots[1] then
        
        end
        end
                        end)
                        if not success then
                            warn("Bot command error: " .. tostring(error))
                        end
                    end
                end
            end
        end)
    end
end
