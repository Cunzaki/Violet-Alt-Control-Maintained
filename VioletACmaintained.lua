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
for i, botName in ipairs(bots) do
    if game:GetService("Players").LocalPlayer.Name == botName and config["SendJoinMsg"] == true then
    ohString1 = "A bot has loaded! [Bot " .. i .. " of " .. #bots .. "]"
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(ohString1)
        task.wait()
    end
end

    if not (game:GetService("Players").LocalPlayer.Name == controller["MainAccount"]) then
    game:GetService("Players"):FindFirstChild(controller["MainAccount"]).Chatted:Connect(function(msg)


    local args = string.split(string.lower(msg), " ")
    local cmd = args[1]
    local function chatmsg(message, target)
    target = target or "All"
    game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
end

        
    if cmd == "$say" then
        local say_msg = string.sub(msg, string.len(cmd)+2, string.len(msg))
        ohString1 = say_msg
        chatmsg(ohString1)
    end

    local args = string.split(string.lower(msg), " ")
    local cmd = args[1]
                
    if cmd == "$slowspam" then
    getgenv().LoopSlowSpam = false
    getgenv().LoopFastSpam = false
    local say_msg = string.sub(msg, string.len(cmd)+2, string.len(msg))
    getgenv().LoopSlowSpam = true
    local counter = 0 
    while getgenv().LoopSlowSpam == true do
        task.wait(4)
        counter = counter + 1
        if counter % 2 == 0 then
            ohString1 = say_msg .. "1" 
        else
            ohString1 = say_msg
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
        getgenv().LoopFastSpam = false
        getgenv().LoopSlowSpam = false
    end
                
    if msg == "$rj" then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId,game:GetService("Players").LocalPlayer)
        ohString1 = "Rejoining bot for an update to the script to replicate!"
        chatmsg(ohString1) 
    end

        if msg == "$cmds" then
        if game:GetService("Players").LocalPlayer.Name == bots[1] then
        chatmsg("Join discordant.gg/agrxDcyRsG to see the commands! (remove ant from discordant)")
        elseif game:GetService("Players").LocalPlayer.Name ~= bots[1] then
        --
        end
        end
            
    if msg == "$jump" then
        game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
    end

    if msg == "$dance1" then
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
        task.wait()
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
        game:GetService("Players"):Chat("/e dance")
    end 

    if msg == "$dance2" then
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
        task.wait()
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
        game:GetService("Players"):Chat("/e dance2")
    end

    if msg == "$dance3" then
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
        task.wait()
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
        game:GetService("Players"):Chat("/e dance3")
    end

    if msg == "$dance4" then
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "rbxassetid://12874447851"
        local k = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
        k:Play(0)
        k:AdjustSpeed(1)
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
        game:GetService("Players").LocalPlayer.Character.Humanoid.Running:connect(function(speed)
        if speed > 0 then
            game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
        k:Stop(0)
        end
        end)
        end

    if msg == "$laugh" then
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
        task.wait()
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
        game:GetService("Players"):Chat("/e laugh")
    end
         
    if msg == "$wave" then
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
        task.wait()
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
        game:GetService("Players"):Chat("/e wave")
    end

    if msg == "$cheer" then
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
        task.wait()
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
        game:GetService("Players"):Chat("/e cheer")
    end

    if msg == "$point" then
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
        task.wait()
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
        game:GetService("Players"):Chat("/e point")
    end

    if msg == "$stopemotes" then
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
        task.wait()
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
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
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[player.Name].Character.HumanoidRootPart.CFrame * CFrame.new(offset, 0, 0)
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
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[player.Name].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, offset)
                    task.wait()
                end
            end
        end
       end

if msg:sub(1, 7) == "$swarm " then
    getgenv().LoopSwarm, getgenv().LoopLine, getgenv().LoopWall, getgenv().LoopLook, getgenv().LoopFollow, getgenv().LoopStack = false, false, false, false, false, false
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
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[player.Name].Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-5,5),0,math.random(-5,5))
                task.wait()
            end
        end
    end
end

            
if msg:sub(1, 8) == "$lookat " then
    getgenv().LoopSwarm, getgenv().LoopLine, getgenv().LoopWall, getgenv().LoopLook, getgenv().LoopFollow, getgenv().LoopStack = false, false, false, false, false, false
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
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, game:GetService("Players")[player.Name].Character.HumanoidRootPart.Position)
                task.wait()
            end
        end
    end
end




if msg:sub(1, 8) == "$follow " then
    local playerName = msg:sub(9)
    if getgenv().LoopFollow == true then
        getgenv().LoopFollow = false
        task.wait()
    end
    getgenv().LoopSwarm, getgenv().LoopLine, getgenv().LoopWall, getgenv().LoopLook, getgenv().LoopFollow, getgenv().LoopStack = false, false, false, false, false, false
    
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
                            if (LocalPlayer.Character.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude > 3 then
                                LocalPlayer.Character.Humanoid:MoveTo(humanoidRootPart.Position)
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
    getgenv().LoopSwarm, getgenv().LoopLine, getgenv().LoopWall, getgenv().LoopLook, getgenv().LoopFollow, getgenv().LoopStack = false, false, false, false, false, false
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
                    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -2)
                        task.wait()
                        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(LocalPlayer.Character.HumanoidRootPart.Position, player.Character.HumanoidRootPart.Position)
                        task.wait()
                    end
                end
            end
        end
    end

    gotoPlayer(playerName)
end

            
if msg:sub(1, 7) == "$stack " then
    getgenv().LoopSwarm, getgenv().LoopLine, getgenv().LoopWall, getgenv().LoopLook, getgenv().LoopFollow, getgenv().LoopStack = false, false, false, false, false, false
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
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[player.Name].Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, offset, 0)
                game:GetService("Workspace").NewPartInstance.CFrame = game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, -3.6, 0)
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
        getgenv().LoopSwarm, getgenv().LoopLine, getgenv().LoopWall, getgenv().LoopLook, getgenv().LoopFollow, getgenv().LoopStack = false, false, false, false, false, false
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v.Name == "PartForBot" then
                    v:Destroy()
                end
            end   
        end

        if msg == "$rejoin" then
        game:GetService("Players").LocalPlayer.Character:Destroy()
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
        --
        end
        end
        end)
end
