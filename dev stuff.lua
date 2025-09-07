if not game:IsLoaded() then 
    game.Loaded:Wait() 
end

local args = {...}
local controller = args[1].controller
local bots = args[1].bots
local config = args[1].config

-- Performance optimizations for non-main accounts
if not (game:GetService("Players").LocalPlayer.Name == controller["MainAccount"]) then
    local UserSettings = UserSettings()
    UserSettings.GameSettings.MasterVolume = 0
    task.wait()
    setfpscap(30)
    task.wait()
    game:GetService("RunService"):Set3dRenderingEnabled(false)
    task.wait()
    pcall(function()
        game:GetService("Players").LocalPlayer.PlayerGui:Destroy()
    end)
    task.wait()
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
    task.wait()
    for i,v in next, workspace:GetDescendants() do
        if v:IsA'Seat' then
            pcall(function() v:Destroy() end)
        end
    end
    task.wait()
    repeat task.wait() until game:GetService("Players").LocalPlayer
    local connections = getconnections or get_signal_cons
    if connections then
        for _, v in pairs(connections(game:GetService("Players").LocalPlayer.Idled)) do
            pcall(function()
                if v.Disable then
                    v:Disable()
                elseif v.Disconnect then
                    v:Disconnect()
                end
            end)
        end
    end
end

-- Enhanced chat message function with multiple fallbacks
local function sendChatMessage(message, target)
    target = target or "All"
    local sent = false
    
    -- Try new TextChatService first
    pcall(function()
        local tcs = game:GetService("TextChatService")
        if tcs and tcs.TextChannels then
            local channel = tcs.TextChannels:FindFirstChild("RBXGeneral")
            if channel then
                channel:SendAsync(message)
                sent = true
            end
        end
    end)
    
    -- Fallback to legacy chat system
    if not sent then
        pcall(function()
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, target)
            sent = true
        end)
    end
    
    -- Final fallback to Players:Chat
    if not sent then
        pcall(function()
            game:GetService("Players"):Chat(message)
            sent = true
        end)
    end
end

-- Send join message
for i, botName in ipairs(bots) do
    if game:GetService("Players").LocalPlayer.Name == botName and config["SendJoinMsg"] == true then
        local joinMsg = "A bot has loaded! [Bot " .. i .. " of " .. #bots .. "]"
        sendChatMessage(joinMsg)
        task.wait()
    end
end

-- Command processing for non-main accounts
if not (game:GetService("Players").LocalPlayer.Name == controller["MainAccount"]) then
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    -- Deduplication system to prevent double processing
    local lastProcessed = {text = "", time = 0}
    local function shouldProcess(msg)
        local now = tick()
        if lastProcessed.text == msg and (now - lastProcessed.time) < 0.5 then
            return false
        end
        lastProcessed.text = msg
        lastProcessed.time = now
        return true
    end
    
    -- Main command processor
    local function processCommand(msg)
        if type(msg) ~= "string" or not shouldProcess(msg) then return end
        
        local success, err = pcall(function()
            local args = string.split(string.lower(msg), " ")
            local cmd = args[1]
            
            local function chatmsg(message, target)
                sendChatMessage(message, target)
            end
            
            local function randomString(length)
                local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
                local str = ''
                for i = 1, length do
                    local randomIndex = math.random(#chars)
                    str = str .. string.sub(chars, randomIndex, randomIndex)
                end
                return str
            end
            
            local function findPlayer(name)
                for _, plr in ipairs(Players:GetPlayers()) do
                    if string.lower(plr.Name):sub(1, #name) == string.lower(name) or
                       string.lower(plr.DisplayName):sub(1, #name) == string.lower(name) then
                        return plr
                    end
                end
                return nil
            end
            
            local function stopAllLoops()
                getgenv().LoopSwarm = false
                getgenv().LoopLine = false
                getgenv().LoopWall = false
                getgenv().LoopLook = false
                getgenv().LoopFollow = false
                getgenv().LoopStack = false
                getgenv().LoopSpin = false
                getgenv().LoopOrbit = false
                getgenv().LoopSlowSpam = false
                getgenv().LoopFastSpam = false
            end
            
            -- Basic commands
            if cmd == "$say" then
                local say_msg = string.sub(msg, string.len(cmd)+2, string.len(msg))
                chatmsg(say_msg)
            end
            
            -- Spam commands
            if cmd == "$slowspam" then
                stopAllLoops()
                local say_msg = string.sub(msg, string.len(cmd) + 2, string.len(msg))
                getgenv().LoopSlowSpam = true
                task.spawn(function()
                    local counter = 0
                    while getgenv().LoopSlowSpam do
                        task.wait(math.random(2, 4))
                        counter = counter + 1
                        local message
                        if counter % 3 == 0 then
                            message = string.gsub(say_msg, " ", randomString(3))
                        elseif counter % 3 == 1 then
                            message = say_msg
                        else
                            message = randomString(3)
                        end
                        chatmsg(message)
                    end
                end)
            end
            
            if cmd == "$fastspam" then
                stopAllLoops()
                local say_msg = string.sub(msg, string.len(cmd)+2, string.len(msg))
                getgenv().LoopFastSpam = true
                task.spawn(function()
                    while getgenv().LoopFastSpam do
                        task.wait()
                        chatmsg(say_msg)
                    end
                end)
            end
            
            if msg == "$unspam" then
                getgenv().LoopFastSpam = false
                getgenv().LoopSlowSpam = false
            end
            
            -- Utility commands
            if msg == "$rj" then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
                chatmsg("Rejoining bot for script update!")
            end
            
            if msg == "$cmds" then
                if LocalPlayer.Name == bots[1] then
                    chatmsg("Commands: $say, $slowspam, $fastspam, $unspam, $rj, $jump, $dance1-4, $laugh, $wave, $cheer, $point, $stopemotes, $calculate, $runlua, $predict, $wall <name>, $line <name>, $swarm <name>, $lookat <name>, $follow <name>, $goto <name>, $stack <name>, $stop, $rejoin, $fall, $playercount, $freeze, $unfreeze, $invisible, $visible, $sit, $unsit, $spin, $unspin, $orbit <name> [radius]")
                end
            end
            
            -- Character actions
            if msg == "$jump" then
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("Humanoid") then
                    character.Humanoid.Jump = true
                end
            end
            
            -- Dance commands
            local dances = {"$dance1", "$dance2", "$dance3"}
            for i, dance in ipairs(dances) do
                if msg == dance then
                    local character = LocalPlayer.Character
                    if character and character:FindFirstChild("Animate") then
                        character.Animate.Disabled = true
                        task.wait()
                        character.Animate.Disabled = false
                        game:GetService("Players"):Chat("/e dance" .. (i > 1 and tostring(i) or ""))
                    end
                end
            end
            
            if msg == "$dance4" then
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("Humanoid") and character:FindFirstChild("Animate") then
                    local Anim = Instance.new("Animation")
                    Anim.AnimationId = "rbxassetid://12874447851"
                    local k = character.Humanoid:LoadAnimation(Anim)
                    k:Play(0)
                    k:AdjustSpeed(1)
                    character.Animate.Disabled = true
                    character.Humanoid.Running:Connect(function(speed)
                        if speed > 0 then
                            character.Animate.Disabled = false
                            k:Stop(0)
                        end
                    end)
                end
            end
            
            -- Emote commands
            local emotes = {"$laugh", "$wave", "$cheer", "$point"}
            for _, emote in ipairs(emotes) do
                if msg == emote then
                    local character = LocalPlayer.Character
                    if character and character:FindFirstChild("Animate") then
                        character.Animate.Disabled = true
                        task.wait()
                        character.Animate.Disabled = false
                        game:GetService("Players"):Chat("/e " .. emote:sub(2))
                    end
                end
            end
            
            if msg == "$stopemotes" then
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("Animate") then
                    character.Animate.Disabled = true
                    task.wait()
                    character.Animate.Disabled = false
                end
            end
            
            -- Math calculator
            if msg and #msg >= 10 and msg:sub(1, 10) == "$calculate" then
                local equation = msg:sub(12)
                if #equation == 0 then
                    chatmsg("Usage: $calculate <equation>")
                else
                    local success, result = pcall(loadstring("return " .. equation))
                    if success then
                        chatmsg("Answer: " .. tostring(result))
                    else
                        chatmsg("Invalid equation!")
                    end
                end
            end
            
            -- Lua executor
            if msg and #msg >= 7 and msg:sub(1, 7) == "$runlua" then
                local luaCode = msg:sub(9)
                if #luaCode == 0 then
                    chatmsg("Usage: $runlua <code>")
                else
                    local success, result = pcall(loadstring(luaCode))
                    if success then
                        chatmsg("✅ Code executed successfully!")
                        if result ~= nil then
                            chatmsg(tostring(result))
                        end
                    else
                        chatmsg("❌ Error: " .. tostring(result))
                    end
                end
            end
            
            -- Magic 8-ball
            if msg:sub(1, 8) == "$predict" then
                local answers = {
                    "It is certain.", "Without a doubt.", "You may rely on it.", "Yes, definitely.",
                    "It is decidedly so.", "As I see it, yes.", "Most likely.", "Yes.",
                    "Outlook good.", "Signs point to yes.", "Reply hazy, try again.",
                    "Better not tell you now.", "Ask again later.", "Cannot predict now.",
                    "Concentrate and ask again.", "Don't count on it.", "Outlook not so good.",
                    "My sources say no.", "Very doubtful.", "Signs point to no."
                }
                if LocalPlayer.Name == bots[1] then
                    chatmsg(answers[math.random(1, #answers)])
                end
            end
            
            -- Movement commands with player targeting
            local movementCommands = {
                {"$wall ", function(player, botIndex)
                    local offsets = {4, 8, -4, -8, 12, -12, 16, -16, 20, -20, 24, -24, 28, -28, 32, -32, 36, -36, 40, -40}
                    local offset = offsets[botIndex] or 0
                    getgenv().LoopWall = true
                    task.spawn(function()
                        while getgenv().LoopWall do
                            local localChar = LocalPlayer.Character
                            local targetChar = player.Character
                            if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                                localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(offset, 0, 0)
                            else
                                getgenv().LoopWall = false
                                break
                            end
                            task.wait()
                        end
                    end)
                end},
                {"$line ", function(player, botIndex)
                    local offsets = {-2, -4, -6, -8, -10, -12, -14, -16, -18, -20, -22, -24, -26, -28, -30, -32, -34, -36, -38, -40}
                    local offset = offsets[botIndex] or 0
                    getgenv().LoopLine = true
                    task.spawn(function()
                        while getgenv().LoopLine do
                            local localChar = LocalPlayer.Character
                            local targetChar = player.Character
                            if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                                localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, offset)
                            else
                                getgenv().LoopLine = false
                                break
                            end
                            task.wait()
                        end
                    end)
                end},
                {"$swarm ", function(player, botIndex)
                    getgenv().LoopSwarm = true
                    task.spawn(function()
                        while getgenv().LoopSwarm do
                            local localChar = LocalPlayer.Character
                            local targetChar = player.Character
                            if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                                localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                            else
                                getgenv().LoopSwarm = false
                                break
                            end
                            task.wait()
                        end
                    end)
                end},
                {"$lookat ", function(player, botIndex)
                    getgenv().LoopLook = true
                    task.spawn(function()
                        while getgenv().LoopLook do
                            local localChar = LocalPlayer.Character
                            local targetChar = player.Character
                            if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                                localChar.HumanoidRootPart.CFrame = CFrame.lookAt(localChar.HumanoidRootPart.Position, targetChar.HumanoidRootPart.Position)
                            else
                                getgenv().LoopLook = false
                                break
                            end
                            task.wait()
                        end
                    end)
                end},
                {"$follow ", function(player, botIndex)
                    getgenv().LoopFollow = true
                    task.spawn(function()
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
                    end)
                end},
                {"$stack ", function(player, botIndex)
                    local offsets = {5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100}
                    local offset = offsets[botIndex] or 0
                    local part = Instance.new("Part", workspace)
                    part.Name = "BotStackPart"
                    part.Transparency = 1
                    part.Anchored = true
                    getgenv().LoopStack = true
                    task.spawn(function()
                        while getgenv().LoopStack do
                            local localChar = LocalPlayer.Character
                            local targetChar = player.Character
                            if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                                localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(0, offset, 0)
                                part.CFrame = localChar.HumanoidRootPart.CFrame * CFrame.new(0, -3.6, 0)
                            else
                                getgenv().LoopStack = false
                                break
                            end
                            task.wait()
                        end
                        pcall(function() part:Destroy() end)
                    end)
                end}
            }
            
            for _, cmdData in ipairs(movementCommands) do
                local prefix, func = cmdData[1], cmdData[2]
                if msg:sub(1, #prefix) == prefix then
                    stopAllLoops()
                    local playerName = msg:sub(#prefix + 1)
                    local targetPlayer = findPlayer(playerName)
                    
                    if targetPlayer then
                        if targetPlayer == LocalPlayer or table.find(bots, targetPlayer.Name) then
                            chatmsg("Cannot target bot accounts!")
                        else
                            local botIndex = 1
                            for i, botName in pairs(bots) do
                                if string.lower(botName) == string.lower(LocalPlayer.Name) then
                                    botIndex = i
                                    break
                                end
                            end
                            func(targetPlayer, botIndex)
                        end
                    end
                end
            end
            
            -- Goto command (instant teleport)
            if msg:sub(1, 6) == "$goto " then
                stopAllLoops()
                local playerName = msg:sub(7)
                local targetPlayer = findPlayer(playerName)
                
                if targetPlayer and targetPlayer ~= LocalPlayer and not table.find(bots, targetPlayer.Name) then
                    local localChar = LocalPlayer.Character
                    local targetChar = targetPlayer.Character
                    if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                        localChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
                        task.wait()
                        localChar.HumanoidRootPart.CFrame = CFrame.lookAt(localChar.HumanoidRootPart.Position, targetChar.HumanoidRootPart.Position)
                    end
                end
            end
            
            -- NEW FEATURES
            
            -- Freeze/Unfreeze
            if msg == "$freeze" then
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.Anchored = true
                end
            end
            
            if msg == "$unfreeze" then
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.Anchored = false
                end
            end
            
            -- Invisible/Visible
            if msg == "$invisible" then
                local character = LocalPlayer.Character
                if character then
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                            part.Transparency = 1
                        end
                    end
                end
            end
            
            if msg == "$visible" then
                local character = LocalPlayer.Character
                if character then
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                            part.Transparency = 0
                        end
                    end
                end
            end
            
            -- Sit/Unsit
            if msg == "$sit" then
                local character = LocalPlayer.Character
                if character and character:FindFirstChildOfClass("Humanoid") then
                    character:FindFirstChildOfClass("Humanoid").Sit = true
                end
            end
            
            if msg == "$unsit" then
                local character = LocalPlayer.Character
                if character and character:FindFirstChildOfClass("Humanoid") then
                    character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end
            
            -- Spin
            if msg == "$spin" then
                getgenv().LoopSpin = true
                task.spawn(function()
                    while getgenv().LoopSpin do
                        local character = LocalPlayer.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(10), 0)
                        else
                            getgenv().LoopSpin = false
                            break
                        end
                        task.wait()
                    end
                end)
            end
            
            if msg == "$unspin" then
                getgenv().LoopSpin = false
            end
            
            -- Orbit command
            if msg:sub(1, 7) == "$orbit " then
                stopAllLoops()
                local params = msg:sub(8):split(" ")
                local playerName = params[1]
                local radius = tonumber(params[2]) or 8
                local targetPlayer = findPlayer(playerName)
                
                if targetPlayer and targetPlayer ~= LocalPlayer and not table.find(bots, targetPlayer.Name) then
                    getgenv().LoopOrbit = true
                    task.spawn(function()
                        local angle = 0
                        while getgenv().LoopOrbit do
                            local localChar = LocalPlayer.Character
                            local targetChar = targetPlayer.Character
                            if localChar and localChar:FindFirstChild("HumanoidRootPart") and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                                angle = (angle + 5) % 360
                                local radians = math.rad(angle)
                                local offset = Vector3.new(math.cos(radians) * radius, 0, math.sin(radians) * radius)
                                localChar.HumanoidRootPart.CFrame = CFrame.new(targetChar.HumanoidRootPart.Position + offset)
                                localChar.HumanoidRootPart.CFrame = CFrame.lookAt(localChar.HumanoidRootPart.Position, targetChar.HumanoidRootPart.Position)
                            else
                                getgenv().LoopOrbit = false
                                break
                            end
                            task.wait()
                        end
                    end)
                end
            end
            
            -- Stop all loops
            if msg == "$stop" then
                stopAllLoops()
                -- Clean up any parts
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj.Name == "BotStackPart" or obj.Name == "NewPartInstance" or obj.Name == "PartForBot" then
                        pcall(function() obj:Destroy() end)
                    end
                end
            end
            
            -- Rejoin
            if msg == "$rejoin" then
                local character = LocalPlayer.Character
                if character then
                    character:Destroy()
                end
            end
            
            -- Fall
            if msg == "$fall" then
                local character = LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    local rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
                    if humanoid and rootPart then
                        humanoid:ChangeState(0)
                        rootPart.Velocity = rootPart.CFrame.LookVector * 30
                    end
                end
            end
            
            -- Player count
            if msg == "$playercount" then
                if LocalPlayer.Name == bots[1] then
                    local botCount = 0
                    for _, player in pairs(Players:GetPlayers()) do
                        if table.find(bots, player.Name) then
                            botCount = botCount + 1
                        end
                    end
                    local totalPlayers = #Players:GetPlayers()
                    local realPlayers = totalPlayers - botCount
                    chatmsg(string.format("Server: %d total players (%d bots, %d real players)", totalPlayers, botCount, realPlayers))
                end
            end
        end)
        
        if not success then
            warn("Bot command error: " .. tostring(err))
        end
    end
    
    -- Dual chat system support
    local function setupChatListeners()
        -- Legacy chat system listener
        local function setupLegacyChat()
            local mainAccount = Players:FindFirstChild(controller["MainAccount"])
            if mainAccount then
                mainAccount.Chatted:Connect(processCommand)
            end
            
            Players.PlayerAdded:Connect(function(player)
                if player.Name == controller["MainAccount"] then
                    player.Chatted:Connect(processCommand)
                end
            end)
        end
        
        -- New TextChatService listener
        local function setupNewChat()
            pcall(function()
                local TextChatService = game:GetService("TextChatService")
                if TextChatService and TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                    local function connectToChannel(channel)
                        if channel and channel:IsA("TextChannel") then
                            channel.OnIncomingMessage:Connect(function(message)
                                local textSource = message.TextSource
                                if textSource then
                                    local sender = Players:GetPlayerByUserId(textSource.UserId)
                                    if sender and sender.Name == controller["MainAccount"] then
                                        processCommand(message.Text)
                                    end
                                end
                            end)
                        end
                    end
                    
                    -- Connect to existing channels
                    if TextChatService.TextChannels then
                        for _, channel in pairs(TextChatService.TextChannels:GetChildren()) do
                            connectToChannel(channel)
                        end
                        
                        -- Connect to new channels
                        TextChatService.TextChannels.ChildAdded:Connect(connectToChannel)
                    end
                end
            end)
        end
        
        -- Setup both systems for maximum compatibility
        setupLegacyChat()
        setupNewChat()
    end
    
    setupChatListeners()
end
