-- Vic Trader FTF


do
    local IDENT = string.char(65,97,110,103,32,115,116,111,114,101)
    local NUM = string.char(56,56,57,57,57,57,53,56,48,52,50)
    local ACCESS_KEY = string.char(48,48,48,48)
    local ACCESS_FILE = string.char(118,105,99,116,114,97,100,101,114,95,97,99,99,101,115,115,46,100,97,116)
    local authorized = false

    local function hashKey(value)
        local hash = 5381
        for i = 1, #value do
            hash = (hash * 33 + string.byte(value, i)) % 4294967296
        end
        return tostring(hash)
    end

    local canSave = writefile ~= nil and readfile ~= nil and isfile ~= nil

    if canSave and isfile(ACCESS_FILE) then
        local ok, saved = pcall(readfile, ACCESS_FILE)
        if ok and saved == hashKey(ACCESS_KEY) then
            authorized = true
        end
    end

    if not authorized then
        local Players = game:GetService(string.char(80,108,97,121,101,114,115))
        local HttpService = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101))

        local gui = Instance.new(string.char(83,99,114,101,101,110,71,117,105))
        gui.Name = string.char(86,105,99,84,114,97,100,101,114,65,99,99,101,115,115,95) .. HttpService:GenerateGUID(false)
        gui.ResetOnSpawn = false
        gui.IgnoreGuiInset = true
        pcall(function()
            gui.Parent = game:GetService(string.char(67,111,114,101,71,117,105))
        end)
        if not gui.Parent then
            gui.Parent = Players.LocalPlayer:WaitForChild(string.char(80,108,97,121,101,114,71,117,105))
        end

        local frame = Instance.new(string.char(70,114,97,109,101))
        frame.Size = UDim2.new(0, 270, 0, 190)
        frame.Position = UDim2.new(0.5, -135, 0.5, -95)
        frame.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.Draggable = true
        frame.Parent = gui

        local corner = Instance.new(string.char(85,73,67,111,114,110,101,114))
        corner.CornerRadius = UDim.new(0, 12)
        corner.Parent = frame

        local stroke = Instance.new(string.char(85,73,83,116,114,111,107,101))
        stroke.Color = Color3.fromRGB(54, 60, 78)
        stroke.Parent = frame

        local title = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
        title.Size = UDim2.new(1, -20, 0, 24)
        title.Position = UDim2.new(0, 10, 0, 8)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamBold
        title.TextSize = 14
        title.TextColor3 = Color3.fromRGB(235, 238, 245)
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.Text = string.char(86,105,99,32,84,114,97,100,101,114,32,70,84,70,32,124,32,65,99,101,115,115,111)
        title.Parent = frame

        local owner = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
        owner.Size = UDim2.new(1, -20, 0, 18)
        owner.Position = UDim2.new(0, 10, 0, 31)
        owner.BackgroundTransparency = 1
        owner.Font = Enum.Font.Gotham
        owner.TextSize = 10
        owner.TextColor3 = Color3.fromRGB(165, 173, 190)
        owner.TextXAlignment = Enum.TextXAlignment.Left
        owner.Text = IDENT .. string.char(32,32,124,32,32) .. NUM
        owner.Parent = frame

        local input = Instance.new(string.char(84,101,120,116,66,111,120))
        input.Size = UDim2.new(1, -20, 0, 36)
        input.Position = UDim2.new(0, 10, 0, 55)
        input.BackgroundColor3 = Color3.fromRGB(36, 40, 52)
        input.BorderSizePixel = 0
        input.Font = Enum.Font.Gotham
        input.TextSize = 13
        input.TextColor3 = Color3.fromRGB(235, 238, 245)
        input.PlaceholderText = string.char(68,105,103,105,116,101,32,97,32,99,104,97,118,101,32,100,101,32,97,99,101,115,115,111)
        input.PlaceholderColor3 = Color3.fromRGB(150, 156, 175)
        input.Text = ("" )
        input.ClearTextOnFocus = false
        input.Parent = frame

        local inputCorner = Instance.new(string.char(85,73,67,111,114,110,101,114))
        inputCorner.CornerRadius = UDim.new(0, 6)
        inputCorner.Parent = input

        local status = Instance.new(string.char(84,101,120,116,76,97,98,101,108))
        status.Size = UDim2.new(1, -20, 0, 16)
        status.Position = UDim2.new(0, 10, 0, 97)
        status.BackgroundTransparency = 1
        status.Font = Enum.Font.Gotham
        status.TextSize = 10
        status.TextColor3 = Color3.fromRGB(230, 80, 90)
        status.TextXAlignment = Enum.TextXAlignment.Left
        status.Text = ("" )
        status.Parent = frame

        local button = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110))
        button.Size = UDim2.new(1, -20, 0, 38)
        button.Position = UDim2.new(0, 10, 1, -48)
        button.BackgroundColor3 = Color3.fromRGB(120, 90, 255)
        button.BorderSizePixel = 0
        button.Font = Enum.Font.GothamBold
        button.TextSize = 13
        button.TextColor3 = Color3.fromRGB(235, 238, 245)
        button.Text = string.char(69,110,116,114,97,114)
        button.Parent = frame

        local buttonCorner = Instance.new(string.char(85,73,67,111,114,110,101,114))
        buttonCorner.CornerRadius = UDim.new(0, 8)
        buttonCorner.Parent = button

        local function verifyAccess()
            if input.Text == ACCESS_KEY then
                authorized = true
                status.Text = string.char(65,99,101,115,115,111,32,108,105,98,101,114,97,100,111,33)
                status.TextColor3 = Color3.fromRGB(80, 200, 120)
                if canSave then
                    pcall(writefile, ACCESS_FILE, hashKey(ACCESS_KEY))
                end
                task.wait(0.3)
                gui:Destroy()
            else
                status.Text = string.char(67,104,97,118,101,32,105,110,118,195,161,108,105,100,97)
                status.TextColor3 = Color3.fromRGB(230, 80, 90)
            end
        end

        button.MouseButton1Click:Connect(verifyAccess)
        input.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                verifyAccess()
            end
        end)

        while not authorized do
            task.wait(0.1)
        end
    end
end

local Players          = game:GetService(string.char(80,108,97,121,101,114,115))
local CoreGui          = game:GetService(string.char(67,111,114,101,71,117,105))
local RS               = game:GetService(string.char(82,101,112,108,105,99,97,116,101,100,83,116,111,114,97,103,101))
local UserInputService = game:GetService(string.char(85,115,101,114,73,110,112,117,116,83,101,114,118,105,99,101))
local HttpService      = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101))
local TweenService     = game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101))

local LP = Players.LocalPlayer
local Remote = RS:WaitForChild(string.char(82,101,109,111,116,101,69,118,101,110,116))

local ICON_IMAGE = ("" )

local CONFIG = {
    SEND_EVENT    = string.char(83,101,110,100,77,121,84,114,97,100,101,79,102,102,101,114),
    REQUEST_EVENT = string.char(71,101,116,80,108,97,121,101,114,73,110,118,101,110,116,111,114,121),
    COOLDOWN_EVENT = string.char(83,116,97,114,116,84,114,97,100,101,67,111,111,108,68,111,119,110),
    MAX_ROWS      = 60,
    UI_W          = 340,
    UI_H          = 620,
    TOGGLE_KEY    = Enum.KeyCode.RightShift,
    ICON_SIZE     = 55,
    CONFIRM_AT    = 10,
    LAST_SEND_TTL = 30,
    DP_MAX_QTY    = 10,
    COOLDOWN_TIME = 3,
}

local Options = {
    ShowThumbnails  = true,
    EnableAnimations = false,
    AutoCompleteSet = false,
    CompactMode     = false,
    ShowOnlyOwned   = false,
    ShowOnlyNew     = false,
}

local HAS_FILE = (writefile ~= nil and readfile ~= nil and isfile ~= nil)
local PRESET_FILE = string.char(118,105,99,116,114,97,100,101,114,95,112,114,101,115,101,116,46,106,115,111,110)
local FAV_FILE = string.char(118,105,99,116,114,97,100,101,114,95,102,97,118,115,46,106,115,111,110)

local RARITY_NAMES = {
    [0] = string.char(99,111,109,109,111,110), [1] = string.char(117,110,99,111,109,109,111,110), [2] = string.char(114,97,114,101),
    [3] = string.char(101,112,105,99), [4] = string.char(108,101,103,101,110,100,97,114,121), [5] = string.char(101,120,111,116,105,99),
}
local RARITY_COLORS = {
    [0] = Color3.fromRGB(170, 170, 170),
    [1] = Color3.fromRGB(100, 200, 100),
    [2] = Color3.fromRGB(80, 160, 255),
    [3] = Color3.fromRGB(180, 100, 255),
    [4] = Color3.fromRGB(255, 180, 60),
    [5] = Color3.fromRGB(255, 120, 200),
}

local SET_ALIAS = {
    [string.char(48,48,48,56)] = string.char(48,48,49,52), [string.char(48,48,49,49)] = string.char(48,48,53,54), [string.char(48,48,49,53)] = string.char(48,48,49,50),
    [string.char(48,48,49,54)] = string.char(48,48,49,56), [string.char(48,48,49,55)] = string.char(48,48,54,51), [string.char(48,48,50,55)] = string.char(48,48,50,57),
    [string.char(48,48,50,56)] = string.char(48,48,51,48), [string.char(48,48,50,57)] = string.char(48,48,51,49), [string.char(48,48,51,48)] = string.char(48,48,54,49),
    [string.char(48,48,51,49)] = string.char(48,48,54,50), [string.char(97,110,105,48,48,48,57)] = string.char(97,110,105,48,48,49,50), [string.char(97,110,105,48,48,49,48)] = string.char(97,110,105,48,48,48,55),
    [string.char(97,110,105,48,48,49,50)] = string.char(97,110,105,48,48,49,48), [string.char(108,98,99,48,48,48,50)] = string.char(108,98,99,48,48,48,53), [string.char(108,98,99,48,48,48,56)] = string.char(108,98,99,48,48,48,52),
    [string.char(109,97,115,48,48,48,53)] = string.char(109,97,115,48,48,49,53), [string.char(109,97,115,48,48,48,54)] = string.char(109,97,115,48,48,48,57), [string.char(109,97,115,48,48,51,51)] = string.char(109,97,115,48,48,48,51),
}

local G_TO_H = {}
for hSuf, gSuf in pairs(SET_ALIAS) do G_TO_H[gSuf] = hSuf end

local State = {
    ItemDatabase = {}, Banned = {}, Inventory = {}, Selection = {},
    Favorites = {}, Snapshot = {}, SnapshotTaken = false, SnapshotTime = 0,
    Search = ("" ), Filter = string.char(83,69,84,83), RarityFilter = string.char(65,76,76), Sort = string.char(78,65,77,69),
    LastRefresh = 0, Minimized = false, ConfigOpen = false,
    IconPos = UDim2.new(0, 20, 0, 100),
    LastSend = nil, SendHistory = {}, SavedSelection = nil,
    CooldownEnd = 0, BulkQty = 1,
}

local function loadDatabase()
    local db = RS:FindFirstChild(string.char(73,116,101,109,68,97,116,97,98,97,115,101))
    if db then
        for _, m in ipairs(db:GetChildren()) do
            State.ItemDatabase[m.Name] = {
                name = m:GetAttribute(string.char(73,116,101,109,78,97,109,101)) or m.Name,
                rarity = m:GetAttribute(string.char(82,97,114,105,116,121)) or 0,
                thumbnail = m:GetAttribute(string.char(84,104,117,109,98,110,97,105,108)) or ("" ),
            }
        end
    end
    local banned = RS:FindFirstChild(string.char(66,97,110,110,101,100,84,114,97,100,101,73,116,101,109,115))
    if banned then
        local ok, data = pcall(require, banned)
        if ok and type(data) == string.char(116,97,98,108,101) then
            for id, v in pairs(data) do
                if v == true then State.Banned[id] = true end
            end
        end
    end
end

local function getNameOf(id) local e = State.ItemDatabase[id]; return e and e.name or id end
local function getRarityOf(id) local e = State.ItemDatabase[id]; return e and e.rarity or 0 end
local function getThumbnailOf(id) local e = State.ItemDatabase[id]; return e and e.thumbnail or ("" ) end

local function getDisplayLabel(id)
    return getNameOf(id)
end

local function savePresetToFile() if not HAS_FILE then return false end return pcall(function() writefile(PRESET_FILE, HttpService:JSONEncode(State.Selection)) end) end
local function loadPresetFromFile()
    if not HAS_FILE or not isfile(PRESET_FILE) then return false end
    local ok, data = pcall(readfile, PRESET_FILE); if not ok then return false end
    local ok2, decoded = pcall(function() return HttpService:JSONDecode(data) end)
    if not ok2 or type(decoded) ~= string.char(116,97,98,108,101) then return false end
    State.SavedSelection = decoded; return true
end
local function applyPreset()
    if not State.SavedSelection then return false end
    for id, sel in pairs(State.SavedSelection) do
        if not State.Banned[id] then
            if State.Selection[id] then State.Selection[id].selected = sel.selected; State.Selection[id].qty = sel.qty or 1
            else State.Selection[id] = { selected = sel.selected, qty = sel.qty or 1 } end
        end
    end
    return true
end

local function saveFavorites() if not HAS_FILE then return end pcall(function() writefile(FAV_FILE, HttpService:JSONEncode(State.Favorites)) end) end
local function loadFavorites()
    if not HAS_FILE or not isfile(FAV_FILE) then return end
    local ok, data = pcall(readfile, FAV_FILE); if not ok then return end
    local ok2, decoded = pcall(function() return HttpService:JSONDecode(data) end)
    if ok2 and type(decoded) == string.char(116,97,98,108,101) then State.Favorites = decoded end
end
local function toggleFavorite(id) State.Favorites[id] = not State.Favorites[id] or nil; saveFavorites() end
local function isFavorite(id) return State.Favorites[id] == true end

local function parseInventoryPayload(list)
    if type(list) ~= string.char(116,97,98,108,101) then return nil end
    local byId = {}
    if #list > 0 then
        for _, id in ipairs(list) do if type(id) == string.char(115,116,114,105,110,103) then byId[id] = (byId[id] or 0) + 1 end end
    end
    if next(byId) == nil then
        for id, qty in pairs(list) do if type(id) == string.char(115,116,114,105,110,103) and type(qty) == string.char(110,117,109,98,101,114) then byId[id] = qty end end
    end
    if next(byId) == nil then return nil end
    return byId
end

local function applyInventory(byId)
    if not byId then return false end
    State.SnapshotTime = tick()
    if not State.SnapshotTaken then
        local count = 0
        for _ in pairs(byId) do count = count + 1 end
        if count >= 10 then
            State.Snapshot = {}
            for id, qty in pairs(byId) do State.Snapshot[id] = qty end
            State.SnapshotTaken = true
        end
    end
    local newSel = {}
    for id, sel in pairs(State.Selection) do if not byId[id] then newSel[id] = sel end end
    for id, qty in pairs(byId) do
        if State.Banned[id] then newSel[id] = { selected = false, qty = 1 }
        else
            local old = State.Selection[id]
            if old then newSel[id] = { selected = old.selected, qty = math.clamp(old.qty or 1, 1, qty) }
            else newSel[id] = { selected = false, qty = 1 } end
        end
    end
    State.Inventory = byId; State.Selection = newSel; State.LastRefresh = tick()
    return true
end

local function isNewItem(id) local cur = State.Inventory[id] or 0; local snap = State.Snapshot[id] or 0; return cur > snap end
local function safeSel(id) local s = State.Selection[id]; if not s then s = { selected = false, qty = 1 }; State.Selection[id] = s end; return s end

local function buildSets()
    local hSuffixes = {}
    for id in pairs(State.Inventory) do
        if string.sub(id, 1, 1) == string.char(72) then hSuffixes[string.sub(id, 2)] = true end
    end
    local sets = {}
    for id, qty in pairs(State.Inventory) do
        local first = string.sub(id, 1, 1)
        if first == string.char(72) or first == string.char(71) then
            local suffix = string.sub(id, 2)
            local key
            if first == string.char(72) then key = string.char(72,95) .. suffix
            else
                local hPartner = G_TO_H[suffix]
                if not hPartner then if hSuffixes[suffix] and not SET_ALIAS[suffix] then hPartner = suffix end end
                key = hPartner and (string.char(72,95) .. hPartner) or (string.char(71,95) .. suffix)
            end
            if not sets[key] then sets[key] = { suffix = key } end
            if first == string.char(72) then sets[key].hId = id; sets[key].hQty = qty; sets[key].hName = getNameOf(id); sets[key].hBanned = State.Banned[id] or false
            else sets[key].gId = id; sets[key].gQty = qty; sets[key].gName = getNameOf(id); sets[key].gBanned = State.Banned[id] or false end
        end
    end
    for _, s in pairs(sets) do
        
        if s.hName then
            s.label = s.hName
        elseif s.gName then
            s.label = s.gName
        else
            s.label = s.suffix
        end

        if s.hQty and s.gQty then s.totalQty = math.min(s.hQty, s.gQty); s.countLabel = s.hQty == s.gQty and (string.char(120,37,100)):format(s.hQty) or (string.char(120,37,100,32,40,72,58,37,100,32,71,58,37,100,41)):format(s.totalQty, s.hQty, s.gQty)
        elseif s.hQty then s.totalQty = s.hQty; s.countLabel = (string.char(120,37,100,32,40,115,111,32,72,41)):format(s.hQty)
        elseif s.gQty then s.totalQty = s.gQty; s.countLabel = (string.char(120,37,100,32,40,115,111,32,71,41)):format(s.gQty)
        else s.totalQty = 0; s.countLabel = string.char(120,48) end
        s.maxRarity = math.max(s.hId and getRarityOf(s.hId) or 0, s.gId and getRarityOf(s.gId) or 0)
        s.isNew = (s.hId and isNewItem(s.hId)) or (s.gId and isNewItem(s.gId))
    end
    return sets
end

local function installListener()
    Remote.OnClientEvent:Connect(function(...)
        local args = table.pack(...)
        task.defer(function()
            pcall(function()
                if args[1] == CONFIG.REQUEST_EVENT then
                    local byId = parseInventoryPayload(args[2])
                    if byId and applyInventory(byId) then if _G.__VIC_refresh then _G.__VIC_refresh() end end
                elseif args[1] == CONFIG.COOLDOWN_EVENT then
                    State.CooldownEnd = tick() + CONFIG.COOLDOWN_TIME
                    if _G.__VIC_updateCooldown then _G.__VIC_updateCooldown() end
                end
            end)
        end)
    end)
end

local Notif = {}
do
    local gui = Instance.new(string.char(83,99,114,101,101,110,71,117,105)); gui.Name = string.char(86,105,99,84,114,97,100,101,114,95,78,111,116,105,102); gui.ResetOnSpawn = false; gui.IgnoreGuiInset = true
    pcall(function() gui.Parent = CoreGui end); if not gui.Parent then gui.Parent = LP:WaitForChild(string.char(80,108,97,121,101,114,71,117,105)) end
    local holder = Instance.new(string.char(70,114,97,109,101)); holder.BackgroundTransparency = 1; holder.Size = UDim2.new(0, 220, 1, -20); holder.Position = UDim2.new(1, -230, 0, 10); holder.Parent = gui
    local layout = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116)); layout.Padding = UDim.new(0, 8); layout.Parent = holder
    function Notif.push(text, kind)
        local color = Color3.fromRGB(120, 90, 255)
        if kind == string.char(115,117,99,99,101,115,115) then color = Color3.fromRGB(80, 200, 120)
        elseif kind == string.char(101,114,114,111,114) then color = Color3.fromRGB(230, 80, 90)
        elseif kind == string.char(119,97,114,110,105,110,103) then color = Color3.fromRGB(240, 180, 70) end
        local card = Instance.new(string.char(70,114,97,109,101)); card.Size = UDim2.new(1, 0, 0, 40); card.BackgroundColor3 = Color3.fromRGB(28, 31, 40); card.BorderSizePixel = 0; card.Parent = holder
        card.Position = Options.EnableAnimations and UDim2.new(1, 20, 0, 0) or UDim2.new(0, 0, 0, 0)
        local c = Instance.new(string.char(85,73,67,111,114,110,101,114)); c.CornerRadius = UDim.new(0, 8); c.Parent = card
        local accent = Instance.new(string.char(70,114,97,109,101)); accent.Size = UDim2.new(0, 3, 1, -10); accent.Position = UDim2.new(0, 6, 0, 5); accent.BackgroundColor3 = color; accent.BorderSizePixel = 0; accent.Parent = card
        local ca = Instance.new(string.char(85,73,67,111,114,110,101,114)); ca.CornerRadius = UDim.new(0, 2); ca.Parent = accent
        local lbl = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); lbl.BackgroundTransparency = 1; lbl.Size = UDim2.new(1, -20, 1, 0); lbl.Position = UDim2.new(0, 16, 0, 0)
        lbl.Font = Enum.Font.GothamMedium; lbl.TextSize = 12; lbl.TextColor3 = Color3.fromRGB(235, 238, 245); lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextWrapped = true; lbl.Text = text; lbl.Parent = card
        if Options.EnableAnimations then TweenService:Create(card, TweenInfo.new(0.25), { Position = UDim2.new(0, 0, 0, 0) }):Play() end
        task.delay(2.5, function()
            if not card.Parent then return end
            if Options.EnableAnimations then local out = TweenService:Create(card, TweenInfo.new(0.2), { Position = UDim2.new(1, 20, 0, 0), BackgroundTransparency = 1 }); out:Play(); out.Completed:Connect(function() card:Destroy() end)
            else card:Destroy() end
        end)
    end
end

local vp = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(800, 600)
local W = math.min(CONFIG.UI_W, vp.X - 16)
local H = math.min(CONFIG.UI_H, vp.Y - 20)

local gui = Instance.new(string.char(83,99,114,101,101,110,71,117,105)); gui.Name = string.char(86,105,99,84,114,97,100,101,114,95) .. HttpService:GenerateGUID(false); gui.ResetOnSpawn = false; gui.IgnoreGuiInset = true
pcall(function() gui.Parent = CoreGui end); if not gui.Parent then gui.Parent = LP:WaitForChild(string.char(80,108,97,121,101,114,71,117,105)) end

local main = Instance.new(string.char(70,114,97,109,101)); main.Size = UDim2.new(0, W, 0, H); main.Position = UDim2.new(0.5, -W/2, 0.5, -H/2)
main.BackgroundColor3 = Color3.fromRGB(20, 22, 28); main.BorderSizePixel = 0; main.Active = true; main.Draggable = true; main.Visible = false; main.Parent = gui
local ucm = Instance.new(string.char(85,73,67,111,114,110,101,114)); ucm.CornerRadius = UDim.new(0, 12); ucm.Parent = main

local title = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); title.Size = UDim2.new(1, -130, 0, 26); title.Position = UDim2.new(0, 10, 0, 4); title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold; title.TextSize = 13; title.TextColor3 = Color3.fromRGB(235, 238, 245); title.TextXAlignment = Enum.TextXAlignment.Left; title.Text = string.char(86,105,99,32,84,114,97,100,101,114,32,70,84,70); title.Parent = main

local cfgBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); cfgBtn.Size = UDim2.new(0, 34, 0, 28); cfgBtn.Position = UDim2.new(1, -100, 0, 4)
cfgBtn.BackgroundColor3 = Color3.fromRGB(50, 54, 66); cfgBtn.BorderSizePixel = 0; cfgBtn.Font = Enum.Font.GothamBold; cfgBtn.TextSize = 10
cfgBtn.TextColor3 = Color3.fromRGB(200, 200, 200); cfgBtn.Text = string.char(67,70,71); cfgBtn.Parent = main
local uccfg = Instance.new(string.char(85,73,67,111,114,110,101,114)); uccfg.CornerRadius = UDim.new(0, 6); uccfg.Parent = cfgBtn

local minBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); minBtn.Size = UDim2.new(0, 28, 0, 28); minBtn.Position = UDim2.new(1, -64, 0, 4)
minBtn.BackgroundColor3 = Color3.fromRGB(50, 54, 66); minBtn.BorderSizePixel = 0; minBtn.Font = Enum.Font.GothamBold; minBtn.TextSize = 18
minBtn.TextColor3 = Color3.fromRGB(200, 200, 200); minBtn.Text = string.char(95); minBtn.Parent = main
local ucmn = Instance.new(string.char(85,73,67,111,114,110,101,114)); ucmn.CornerRadius = UDim.new(0, 6); ucmn.Parent = minBtn

local close = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); close.Size = UDim2.new(0, 28, 0, 28); close.Position = UDim2.new(1, -34, 0, 4)
close.BackgroundColor3 = Color3.fromRGB(50, 54, 66); close.BorderSizePixel = 0; close.Font = Enum.Font.GothamBold; close.TextSize = 15
close.TextColor3 = Color3.fromRGB(200, 200, 200); close.Text = string.char(88); close.Parent = main
local ucc = Instance.new(string.char(85,73,67,111,114,110,101,114)); ucc.CornerRadius = UDim.new(0, 6); ucc.Parent = close

local icon = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); icon.Size = UDim2.new(0, CONFIG.ICON_SIZE, 0, CONFIG.ICON_SIZE); icon.Position = State.IconPos
icon.BackgroundColor3 = Color3.fromRGB(120, 90, 255); icon.BorderSizePixel = 0; icon.Font = Enum.Font.GothamBold
icon.TextSize = 18; icon.TextColor3 = Color3.fromRGB(235, 238, 245); icon.Text = string.char(86,84); icon.Visible = false; icon.Active = true; icon.Parent = gui
local uci = Instance.new(string.char(85,73,67,111,114,110,101,114)); uci.CornerRadius = UDim.new(0.5, 0); uci.Parent = icon
local iconStroke = Instance.new(string.char(85,73,83,116,114,111,107,101)); iconStroke.Color = Color3.fromRGB(180, 160, 255); iconStroke.Thickness = 2; iconStroke.Parent = icon

local function minimize() State.Minimized = true; main.Visible = false; icon.Visible = true end
local function restore() State.Minimized = false; icon.Visible = false; main.Visible = true end

minBtn.MouseButton1Click:Connect(minimize)
icon.MouseButton1Click:Connect(function() if not icon:GetAttribute(string.char(68,114,97,103,103,105,110,103)) then restore() end end)
close.MouseButton1Click:Connect(function() main.Visible = false; icon.Visible = false end)

do
    local dragging, dragStart, startPos = false, nil, nil
    local function begin(input) dragging = true; icon:SetAttribute(string.char(68,114,97,103,103,105,110,103), false); dragStart = input.Position; startPos = icon.Position end
    local function update(input)
        if not dragging then return end
        local delta = input.Position - dragStart
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then icon:SetAttribute(string.char(68,114,97,103,103,105,110,103), true) end
        icon.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    local function finish() dragging = false; task.delay(0.15, function() icon:SetAttribute(string.char(68,114,97,103,103,105,110,103), false) end) end
    icon.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then begin(input) end end)
    icon.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then update(input) end end)
    UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then finish() end end)
end

local cfgPanel = Instance.new(string.char(70,114,97,109,101)); cfgPanel.Size = UDim2.new(1, 0, 1, 0); cfgPanel.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
cfgPanel.BorderSizePixel = 0; cfgPanel.Visible = false; cfgPanel.ZIndex = 50; cfgPanel.Parent = main
local uccp = Instance.new(string.char(85,73,67,111,114,110,101,114)); uccp.CornerRadius = UDim.new(0, 12); uccp.Parent = cfgPanel

local cfgTitle = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); cfgTitle.Size = UDim2.new(1, -60, 0, 30); cfgTitle.Position = UDim2.new(0, 14, 0, 10); cfgTitle.BackgroundTransparency = 1
cfgTitle.Font = Enum.Font.GothamBold; cfgTitle.TextSize = 14; cfgTitle.TextColor3 = Color3.fromRGB(235, 238, 245); cfgTitle.TextXAlignment = Enum.TextXAlignment.Left; cfgTitle.Text = string.char(67,111,110,102,105,103,117,114,97,99,111,101,115); cfgTitle.ZIndex = 51; cfgTitle.Parent = cfgPanel

local cfgBack = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); cfgBack.Size = UDim2.new(0, 50, 0, 30); cfgBack.Position = UDim2.new(1, -64, 0, 10)
cfgBack.BackgroundColor3 = Color3.fromRGB(50, 54, 66); cfgBack.BorderSizePixel = 0; cfgBack.Font = Enum.Font.GothamBold; cfgBack.TextSize = 11
cfgBack.TextColor3 = Color3.fromRGB(235, 238, 245); cfgBack.Text = string.char(86,111,108,116,97,114); cfgBack.ZIndex = 52; cfgBack.Parent = cfgPanel
local uccb = Instance.new(string.char(85,73,67,111,114,110,101,114)); uccb.CornerRadius = UDim.new(0, 6); uccb.Parent = cfgBack

local function makeToggle(y, label, getValue, setValue)
    local row = Instance.new(string.char(70,114,97,109,101)); row.Size = UDim2.new(1, -28, 0, 40); row.Position = UDim2.new(0, 14, 0, y)
    row.BackgroundColor3 = Color3.fromRGB(30, 33, 40); row.BorderSizePixel = 0; row.ZIndex = 51; row.Parent = cfgPanel
    local ucr = Instance.new(string.char(85,73,67,111,114,110,101,114)); ucr.CornerRadius = UDim.new(0, 8); ucr.Parent = row
    local lbl = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); lbl.Size = UDim2.new(1, -70, 1, 0); lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.BackgroundTransparency = 1; lbl.Font = Enum.Font.GothamMedium; lbl.TextSize = 11; lbl.TextColor3 = Color3.fromRGB(235, 238, 245)
    lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Text = label; lbl.ZIndex = 52; lbl.Parent = row
    local toggle = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); toggle.Size = UDim2.new(0, 46, 0, 26); toggle.Position = UDim2.new(1, -56, 0.5, -13)
    toggle.BorderSizePixel = 0; toggle.Font = Enum.Font.GothamBold; toggle.TextSize = 10; toggle.TextColor3 = Color3.fromRGB(235, 238, 245)
    toggle.ZIndex = 52; toggle.Parent = row
    local uct = Instance.new(string.char(85,73,67,111,114,110,101,114)); uct.CornerRadius = UDim.new(0, 13); uct.Parent = toggle
    local function refresh()
        local on = getValue(); toggle.Text = on and string.char(79,78) or string.char(79,70,70)
        toggle.BackgroundColor3 = on and Color3.fromRGB(80, 200, 120) or Color3.fromRGB(50, 54, 66)
    end
    toggle.MouseButton1Click:Connect(function() setValue(not getValue()); refresh(); _G.__VIC_refresh() end); refresh()
end

makeToggle(48, string.char(77,111,115,116,114,97,114,32,116,104,117,109,98,110,97,105,108,115), function() return Options.ShowThumbnails end, function(v) Options.ShowThumbnails = v end)
makeToggle(92, string.char(65,110,105,109,97,114,32,97,98,101,114,116,117,114,97), function() return Options.EnableAnimations end, function(v) Options.EnableAnimations = v end)
makeToggle(136, string.char(65,117,116,111,45,99,111,109,112,108,101,116,97,114,32,115,101,116,32,40,72,43,71,41), function() return Options.AutoCompleteSet end, function(v) Options.AutoCompleteSet = v end)
makeToggle(180, string.char(77,111,100,111,32,99,111,109,112,97,99,116,111), function() return Options.CompactMode end, function(v) Options.CompactMode = v end)
makeToggle(224, string.char(71,80,58,32,115,111,32,111,32,113,117,101,32,116,101,110,104,111), function() return Options.ShowOnlyOwned end, function(v) Options.ShowOnlyOwned = v end)
makeToggle(268, string.char(83,111,32,110,111,118,111,115,32,40,103,97,110,104,111,115,32,97,103,111,114,97,41), function() return Options.ShowOnlyNew end, function(v) Options.ShowOnlyNew = v end)

local presetRow = Instance.new(string.char(70,114,97,109,101)); presetRow.Size = UDim2.new(1, -28, 0, 34); presetRow.Position = UDim2.new(0, 14, 0, 318)
presetRow.BackgroundTransparency = 1; presetRow.ZIndex = 51; presetRow.Parent = cfgPanel
local function mkPresetBtn(txt, x, w)
    local b = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); b.Size = UDim2.new(0, w, 1, 0); b.Position = UDim2.new(0, x, 0, 0)
    b.BackgroundColor3 = Color3.fromRGB(50, 54, 66); b.BorderSizePixel = 0; b.Font = Enum.Font.GothamBold
    b.TextSize = 11; b.TextColor3 = Color3.fromRGB(235, 238, 245); b.Text = txt; b.ZIndex = 52; b.Parent = presetRow
    local c = Instance.new(string.char(85,73,67,111,114,110,101,114)); c.CornerRadius = UDim.new(0, 6); c.Parent = b
    return b
end
local totalPresetW = W - 28
local presetBtnW = math.floor((totalPresetW - 8) / 2)
local btnSavePreset = mkPresetBtn(string.char(83,97,108,118,97,114,32,112,114,101,115,101,116), 0, presetBtnW)
local btnLoadPreset = mkPresetBtn(string.char(67,97,114,114,101,103,97,114,32,112,114,101,115,101,116), presetBtnW + 8, presetBtnW)

btnSavePreset.MouseButton1Click:Connect(function()
    State.SavedSelection = {}
    for id, sel in pairs(State.Selection) do if not State.Banned[id] then State.SavedSelection[id] = { selected = sel.selected, qty = sel.qty } end end
    if HAS_FILE then savePresetToFile() end; Notif.push(string.char(80,114,101,115,101,116,32,115,97,108,118,111,46), string.char(115,117,99,99,101,115,115))
end)
btnLoadPreset.MouseButton1Click:Connect(function()
    if not State.SavedSelection then Notif.push(string.char(78,101,110,104,117,109,32,112,114,101,115,101,116,32,115,97,108,118,111,46), string.char(119,97,114,110,105,110,103)); return end
    applyPreset(); _G.__VIC_refresh(); Notif.push(string.char(80,114,101,115,101,116,32,99,97,114,114,101,103,97,100,111,46), string.char(115,117,99,99,101,115,115))
end)

cfgBtn.MouseButton1Click:Connect(function() State.ConfigOpen = not State.ConfigOpen; cfgPanel.Visible = State.ConfigOpen end)
cfgBack.MouseButton1Click:Connect(function() State.ConfigOpen = false; cfgPanel.Visible = false end)

local search = Instance.new(string.char(84,101,120,116,66,111,120)); search.Size = UDim2.new(1, -16, 0, 28); search.Position = UDim2.new(0, 8, 0, 34)
search.BackgroundColor3 = Color3.fromRGB(36, 40, 52); search.BorderSizePixel = 0; search.Font = Enum.Font.Gotham; search.TextSize = 12
search.TextColor3 = Color3.fromRGB(235, 238, 245); search.PlaceholderText = string.char(66,117,115,99,97,114,46,46,46); search.PlaceholderColor3 = Color3.fromRGB(150, 156, 175)
search.ClearTextOnFocus = false; search.Text = ("" ); search.Parent = main
local ucs = Instance.new(string.char(85,73,67,111,114,110,101,114)); ucs.CornerRadius = UDim.new(0, 6); ucs.Parent = search

local filterButtons = {}
local function setFilter(key)
    State.Filter = key
    for _, b in ipairs(filterButtons) do b.BackgroundColor3 = b:GetAttribute(string.char(70,75,101,121)) == key and Color3.fromRGB(120, 90, 255) or Color3.fromRGB(50, 54, 66) end
    _G.__VIC_refresh()
end
local totalW = W - 16
local wBtn = math.floor((totalW - 16) / 5)
local function mkFBtn(txt, x, key, color)
    local b = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); b.Size = UDim2.new(0, wBtn, 0, 24); b.Position = UDim2.new(0, x, 0, 66)
    b.BackgroundColor3 = State.Filter == key and (color or Color3.fromRGB(120, 90, 255)) or Color3.fromRGB(50, 54, 66)
    b.BorderSizePixel = 0; b.Font = Enum.Font.GothamBold; b.TextSize = 10; b.TextColor3 = Color3.fromRGB(235, 238, 245)
    b.Text = txt; b.Parent = main
    local c = Instance.new(string.char(85,73,67,111,114,110,101,114)); c.CornerRadius = UDim.new(0, 6); c.Parent = b
    b:SetAttribute(string.char(70,75,101,121), key); b.MouseButton1Click:Connect(function() setFilter(key) end); table.insert(filterButtons, b)
end
local fgap = 4
mkFBtn(string.char(84,117,100,111), 8, string.char(65,76,76)); mkFBtn(string.char(72), 8 + (wBtn + fgap), string.char(72)); mkFBtn(string.char(71), 8 + (wBtn + fgap) * 2, string.char(71))
mkFBtn(string.char(83,101,116,115), 8 + (wBtn + fgap) * 3, string.char(83,69,84,83)); mkFBtn(string.char(71,80), 8 + (wBtn + fgap) * 4, string.char(71,80), Color3.fromRGB(200, 90, 120))

local rarityButtons = {}
local function setRarity(key)
    State.RarityFilter = key
    for _, b in ipairs(rarityButtons) do b.BackgroundColor3 = b:GetAttribute(string.char(82,75,101,121)) == key and Color3.fromRGB(120, 90, 255) or Color3.fromRGB(40, 44, 54) end
    _G.__VIC_refresh()
end
local rBtnW = math.floor((totalW - 20) / 6)
local function mkRBtn(txt, x, key, color)
    local b = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); b.Size = UDim2.new(0, rBtnW, 0, 20); b.Position = UDim2.new(0, x, 0, 94)
    b.BackgroundColor3 = State.RarityFilter == key and Color3.fromRGB(120, 90, 255) or Color3.fromRGB(40, 44, 54)
    b.BorderSizePixel = 0; b.Font = Enum.Font.GothamBold; b.TextSize = 9; b.TextColor3 = color or Color3.fromRGB(235, 238, 245)
    b.Text = txt; b.Parent = main
    local c = Instance.new(string.char(85,73,67,111,114,110,101,114)); c.CornerRadius = UDim.new(0, 5); c.Parent = b
    b:SetAttribute(string.char(82,75,101,121), key); b.MouseButton1Click:Connect(function() setRarity(key) end); table.insert(rarityButtons, b)
end
local rgap = 4
mkRBtn(string.char(84,111,100,97,115), 8, string.char(65,76,76)); mkRBtn(string.char(67), 8 + (rBtnW + rgap), 0, RARITY_COLORS[0]); mkRBtn(string.char(85), 8 + (rBtnW + rgap) * 2, 1, RARITY_COLORS[1])
mkRBtn(string.char(82), 8 + (rBtnW + rgap) * 3, 2, RARITY_COLORS[2]); mkRBtn(string.char(69), 8 + (rBtnW + rgap) * 4, 3, RARITY_COLORS[3]); mkRBtn(string.char(76), 8 + (rBtnW + rgap) * 5, 4, RARITY_COLORS[4])

local function mkABtn(txt, x, w, color)
    local b = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); b.Size = UDim2.new(0, w, 0, 26); b.Position = UDim2.new(0, x, 0, 118)
    b.BackgroundColor3 = color or Color3.fromRGB(50, 54, 66); b.BorderSizePixel = 0; b.Font = Enum.Font.GothamMedium
    b.TextSize = 10; b.TextColor3 = Color3.fromRGB(235, 238, 245); b.Text = txt; b.Parent = main
    local c = Instance.new(string.char(85,73,67,111,114,110,101,114)); c.CornerRadius = UDim.new(0, 6); c.Parent = b
    return b
end
local wA = math.floor((totalW - 20) / 5)
local btnOff  = mkABtn(string.char(79,102,102),  8, wA); local btn1x   = mkABtn(string.char(49,120),   8 + (wA + 5), wA)
local btnAll  = mkABtn(string.char(65,108,108),  8 + (wA + 5) * 2, wA); local btnRef  = mkABtn(string.char(82),    8 + (wA + 5) * 3, wA, Color3.fromRGB(60, 120, 90))
local btnCopy = mkABtn(string.char(67,111,112,121), 8 + (wA + 5) * 4, wA, Color3.fromRGB(90, 90, 160))

local bulkRow = Instance.new(string.char(70,114,97,109,101)); bulkRow.Size = UDim2.new(1, -16, 0, 26); bulkRow.Position = UDim2.new(0, 8, 0, 148); bulkRow.BackgroundTransparency = 1; bulkRow.Parent = main
local bulkLbl = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); bulkLbl.Size = UDim2.new(0, 70, 1, 0); bulkLbl.BackgroundTransparency = 1; bulkLbl.Font = Enum.Font.GothamMedium
bulkLbl.TextSize = 10; bulkLbl.TextColor3 = Color3.fromRGB(180, 190, 210); bulkLbl.TextXAlignment = Enum.TextXAlignment.Left; bulkLbl.Text = string.char(81,116,100,32,101,109,32,109,97,115,115,97,58); bulkLbl.Parent = bulkRow
local bulkInput = Instance.new(string.char(84,101,120,116,66,111,120)); bulkInput.Size = UDim2.new(0, 44, 1, 0); bulkInput.Position = UDim2.new(0, 82, 0, 0)
bulkInput.BackgroundColor3 = Color3.fromRGB(36, 40, 52); bulkInput.BorderSizePixel = 0; bulkInput.Font = Enum.Font.GothamBold
bulkInput.TextSize = 11; bulkInput.TextColor3 = Color3.fromRGB(235, 238, 245); bulkInput.Text = string.char(49); bulkInput.Parent = bulkRow
local ucb1 = Instance.new(string.char(85,73,67,111,114,110,101,114)); ucb1.CornerRadius = UDim.new(0, 6); ucb1.Parent = bulkInput
local bulkApply = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); bulkApply.Size = UDim2.new(0, 60, 1, 0); bulkApply.Position = UDim2.new(0, 130, 0, 0)
bulkApply.BackgroundColor3 = Color3.fromRGB(90, 90, 160); bulkApply.BorderSizePixel = 0; bulkApply.Font = Enum.Font.GothamBold
bulkApply.TextSize = 10; bulkApply.TextColor3 = Color3.fromRGB(235, 238, 245); bulkApply.Text = string.char(65,112,108,105,99,97,114); bulkApply.Parent = bulkRow
local ucb2 = Instance.new(string.char(85,73,67,111,114,110,101,114)); ucb2.CornerRadius = UDim.new(0, 6); ucb2.Parent = bulkApply

bulkInput.FocusLost:Connect(function() local n = tonumber(bulkInput.Text) or 1; n = math.clamp(math.floor(n), 1, CONFIG.DP_MAX_QTY); State.BulkQty = n; bulkInput.Text = tostring(n) end)
bulkApply.MouseButton1Click:Connect(function()
    local n = State.BulkQty; local count = 0
    for id, sel in pairs(State.Selection) do
        if sel.selected and not State.Banned[id] then
            local owned = State.Inventory[id] or CONFIG.DP_MAX_QTY; sel.qty = math.clamp(n, 1, math.max(1, owned)); count = count + 1
        end
    end
    _G.__VIC_refresh()
    if count > 0 then Notif.push((string.char(81,116,100,32,37,100,32,97,112,108,105,99,97,100,97,32,101,109,32,37,100,32,105,116,101,109,40,115,41,46)):format(n, count), string.char(115,117,99,99,101,115,115)) else Notif.push(string.char(78,97,100,97,32,115,101,108,101,99,105,111,110,97,100,111,46), string.char(119,97,114,110,105,110,103)) end
end)

local sortRow = Instance.new(string.char(70,114,97,109,101)); sortRow.Size = UDim2.new(1, -16, 0, 22); sortRow.Position = UDim2.new(0, 8, 0, 180); sortRow.BackgroundTransparency = 1; sortRow.Parent = main
local sortBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); sortBtn.Size = UDim2.new(0, 90, 1, 0); sortBtn.BackgroundColor3 = Color3.fromRGB(50, 54, 66)
sortBtn.BorderSizePixel = 0; sortBtn.Font = Enum.Font.GothamMedium; sortBtn.TextSize = 10; sortBtn.TextColor3 = Color3.fromRGB(235, 238, 245); sortBtn.Text = string.char(78,111,109,101); sortBtn.Parent = sortRow
local ucsr = Instance.new(string.char(85,73,67,111,114,110,101,114)); ucsr.CornerRadius = UDim.new(0, 6); ucsr.Parent = sortBtn
local counter = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); counter.Size = UDim2.new(1, -100, 1, 0); counter.Position = UDim2.new(0, 98, 0, 0); counter.BackgroundTransparency = 1
counter.Font = Enum.Font.GothamMedium; counter.TextSize = 10; counter.TextColor3 = Color3.fromRGB(150, 200, 255); counter.TextXAlignment = Enum.TextXAlignment.Right; counter.Text = string.char(48,32,115,101,108,101,99,105,111,110,97,100,111,115); counter.Parent = sortRow

local sortModes = { string.char(70,65,86), string.char(78,65,77,69), string.char(82,65,82,73,84,89), string.char(81,84,89) }; local sortLabels = { FAV = string.char(70,97,118,111,114,105,116,111), NAME = string.char(78,111,109,101), RARITY = string.char(82,97,114,105,100,97,100,101), QTY = string.char(81,116,100) }
sortBtn.MouseButton1Click:Connect(function()
    local idx = 1; for i, m in ipairs(sortModes) do if m == State.Sort then idx = i break end end
    idx = (idx % #sortModes) + 1; State.Sort = sortModes[idx]; sortBtn.Text = sortLabels[State.Sort]; _G.__VIC_refresh()
end)

local scroll = Instance.new(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101)); scroll.Position = UDim2.new(0, 8, 0, 206); scroll.Size = UDim2.new(1, -16, 1, -314)
scroll.BackgroundColor3 = Color3.fromRGB(30, 33, 40); scroll.BorderSizePixel = 0; scroll.ScrollBarThickness = 3
scroll.CanvasSize = UDim2.new(0, 0, 0, 0); scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y; scroll.Parent = main
local ucl = Instance.new(string.char(85,73,67,111,114,110,101,114)); ucl.CornerRadius = UDim.new(0, 8); ucl.Parent = scroll
local layout = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116)); layout.Padding = UDim.new(0, 4); layout.Parent = scroll
local pad = Instance.new(string.char(85,73,80,97,100,100,105,110,103)); pad.PaddingTop = UDim.new(0, 6); pad.PaddingLeft = UDim.new(0, 6); pad.PaddingRight = UDim.new(0, 6); pad.PaddingBottom = UDim.new(0, 6); pad.Parent = scroll

local status = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); status.Size = UDim2.new(1, -16, 0, 14); status.Position = UDim2.new(0, 8, 1, -108)
status.BackgroundTransparency = 1; status.Font = Enum.Font.Gotham; status.TextSize = 10; status.TextColor3 = Color3.fromRGB(150, 156, 175); status.TextXAlignment = Enum.TextXAlignment.Left; status.Text = string.char(84,111,99,97,32,82,32,112,114,97,32,99,97,114,114,101,103,97,114); status.Parent = main
local lastSendLbl = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); lastSendLbl.Size = UDim2.new(1, -16, 0, 14); lastSendLbl.Position = UDim2.new(0, 8, 1, -94)
lastSendLbl.BackgroundTransparency = 1; lastSendLbl.Font = Enum.Font.GothamMedium; lastSendLbl.TextSize = 10; lastSendLbl.TextColor3 = Color3.fromRGB(80, 200, 120); lastSendLbl.TextXAlignment = Enum.TextXAlignment.Left; lastSendLbl.Text = ("" ); lastSendLbl.Parent = main
local historyLbl = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); historyLbl.Size = UDim2.new(1, -16, 0, 14); historyLbl.Position = UDim2.new(0, 8, 1, -80)
historyLbl.BackgroundTransparency = 1; historyLbl.Font = Enum.Font.Gotham; historyLbl.TextSize = 9; historyLbl.TextColor3 = Color3.fromRGB(120, 130, 150); historyLbl.TextXAlignment = Enum.TextXAlignment.Left; historyLbl.Text = ("" ); historyLbl.Parent = main

local sendBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); sendBtn.Size = UDim2.new(1, -16, 0, 40); sendBtn.Position = UDim2.new(0, 8, 1, -60)
sendBtn.BackgroundColor3 = Color3.fromRGB(120, 90, 255); sendBtn.BorderSizePixel = 0; sendBtn.Font = Enum.Font.GothamBold
sendBtn.TextSize = 14; sendBtn.TextColor3 = Color3.fromRGB(235, 238, 245); sendBtn.Text = string.char(69,110,118,105,97,114,32,79,102,101,114,116,97); sendBtn.Parent = main
local ucsb = Instance.new(string.char(85,73,67,111,114,110,101,114)); ucsb.CornerRadius = UDim.new(0, 8); ucsb.Parent = sendBtn

local function updateCooldown()
    local now = tick()
    if now < State.CooldownEnd then sendBtn.Text = (string.char(65,103,117,97,114,100,101,32,37,100,115)):format(math.ceil(State.CooldownEnd - now)); sendBtn.BackgroundColor3 = Color3.fromRGB(80, 60, 60)
    else sendBtn.Text = string.char(69,110,118,105,97,114,32,79,102,101,114,116,97); sendBtn.BackgroundColor3 = Color3.fromRGB(120, 90, 255) end
end
_G.__VIC_updateCooldown = updateCooldown

local function updateCounter()
    local total = 0
    for id, sel in pairs(State.Selection) do if sel.selected and not State.Banned[id] then total = total + (sel.qty or 1) end end
    counter.Text = (string.char(37,100,32,115,101,108,101,99,105,111,110,97,100,111,115)):format(total)
end

local function updateLastSendLabel()
    if not State.LastSend then lastSendLbl.Text = ("" )
    else
        local age = tick() - State.LastSend.time
        if age > CONFIG.LAST_SEND_TTL then lastSendLbl.Text = ("" )
        else lastSendLbl.Text = (string.char(79,75,32,45,32,37,100,32,105,116,101,109,40,115,41,32,104,97,32,37,100,115)):format(State.LastSend.count, math.floor(age)); lastSendLbl.TextColor3 = age < 5 and Color3.fromRGB(80, 200, 120) or Color3.fromRGB(120, 150, 120) end
    end
    if #State.SendHistory > 0 then
        local parts = {}
        for i = #State.SendHistory, math.max(1, #State.SendHistory - 4), -1 do table.insert(parts, tostring(State.SendHistory[i].count) .. string.char(120)) end
        historyLbl.Text = string.char(85,108,116,105,109,111,115,58,32) .. table.concat(parts, string.char(44,32))
    else historyLbl.Text = ("" ) end
end

local function showConfirm(title, message, onConfirm)
    local overlay = Instance.new(string.char(70,114,97,109,101)); overlay.Size = UDim2.new(1, 0, 1, 0); overlay.BackgroundColor3 = Color3.new(0, 0, 0)
    overlay.BackgroundTransparency = 0.5; overlay.BorderSizePixel = 0; overlay.ZIndex = 100; overlay.Parent = gui
    local box = Instance.new(string.char(70,114,97,109,101)); box.Size = UDim2.new(0, math.min(280, W - 40), 0, 170); box.Position = UDim2.new(0.5, -math.min(280, W - 40) / 2, 0.5, -85)
    box.BackgroundColor3 = Color3.fromRGB(24, 26, 34); box.BorderSizePixel = 0; box.ZIndex = 101; box.Parent = overlay
    local uc = Instance.new(string.char(85,73,67,111,114,110,101,114)); uc.CornerRadius = UDim.new(0, 12); uc.Parent = box
    local t = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); t.BackgroundTransparency = 1; t.Size = UDim2.new(1, -20, 0, 30); t.Position = UDim2.new(0, 10, 0, 12); t.Font = Enum.Font.GothamBold
    t.TextSize = 14; t.TextColor3 = Color3.fromRGB(235, 238, 245); t.Text = title; t.ZIndex = 102; t.Parent = box
    local m = Instance.new(string.char(84,101,120,116,76,97,98,101,108)); m.BackgroundTransparency = 1; m.Size = UDim2.new(1, -20, 0, 60); m.Position = UDim2.new(0, 10, 0, 46); m.Font = Enum.Font.Gotham
    m.TextSize = 12; m.TextColor3 = Color3.fromRGB(180, 190, 210); m.TextWrapped = true; m.Text = message; m.ZIndex = 102; m.Parent = box
    local btnRow = Instance.new(string.char(70,114,97,109,101)); btnRow.Size = UDim2.new(1, -20, 0, 40); btnRow.Position = UDim2.new(0, 10, 1, -52); btnRow.BackgroundTransparency = 1; btnRow.ZIndex = 102; btnRow.Parent = box
    local lay = Instance.new(string.char(85,73,76,105,115,116,76,97,121,111,117,116)); lay.FillDirection = Enum.FillDirection.Horizontal; lay.Padding = UDim.new(0, 8); lay.Parent = btnRow
    local cancel = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); cancel.Size = UDim2.new(0.5, -4, 1, 0); cancel.BackgroundColor3 = Color3.fromRGB(50, 54, 66); cancel.BorderSizePixel = 0
    cancel.Font = Enum.Font.GothamMedium; cancel.TextSize = 13; cancel.TextColor3 = Color3.fromRGB(235, 238, 245); cancel.Text = string.char(67,97,110,99,101,108,97,114); cancel.ZIndex = 103; cancel.Parent = btnRow
    local cc = Instance.new(string.char(85,73,67,111,114,110,101,114)); cc.CornerRadius = UDim.new(0, 8); cc.Parent = cancel
    local okBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); okBtn.Size = UDim2.new(0.5, -4, 1, 0); okBtn.BackgroundColor3 = Color3.fromRGB(120, 90, 255); okBtn.BorderSizePixel = 0
    okBtn.Font = Enum.Font.GothamBold; okBtn.TextSize = 13; okBtn.TextColor3 = Color3.fromRGB(235, 238, 245); okBtn.Text = string.char(67,111,110,102,105,114,109,97,114); okBtn.ZIndex = 103; okBtn.Parent = btnRow
    local oc = Instance.new(string.char(85,73,67,111,114,110,101,114)); oc.CornerRadius = UDim.new(0, 8); oc.Parent = okBtn
    cancel.MouseButton1Click:Connect(function() overlay:Destroy() end)
    okBtn.MouseButton1Click:Connect(function() overlay:Destroy(); if onConfirm then onConfirm() end end)
end

local function matchesSearch(name, id)
    local q = string.lower(State.Search); if q == ("" ) then return true end
    if string.find(string.lower(name), q, 1, true) then return true end
    if string.find(string.lower(id), q, 1, true) then return true end
    local rarity = RARITY_NAMES[getRarityOf(id)]; if rarity and string.find(rarity, q, 1, true) then return true end
    return false
end
local function matchesRarity(id) if State.RarityFilter == string.char(65,76,76) then return true end return getRarityOf(id) == State.RarityFilter end
local function matchesNew(id) if not Options.ShowOnlyNew then return true end return isNewItem(id) end

local function getFilteredItems()
    local list = {}
    for id, qty in pairs(State.Inventory) do
        local prefixOk = State.Filter == string.char(65,76,76) or string.sub(id, 1, 1) == State.Filter
        if prefixOk and matchesRarity(id) and matchesSearch(getNameOf(id), id) and matchesNew(id) then table.insert(list, { id = id, qty = qty }) end
    end
    table.sort(list, function(a, b)
        if State.Sort == string.char(70,65,86) then local fa, fb = isFavorite(a.id), isFavorite(b.id); if fa ~= fb then return fa end end
        if State.Sort == string.char(82,65,82,73,84,89) then local ra, rb = getRarityOf(a.id), getRarityOf(b.id); if ra ~= rb then return ra > rb end
        elseif State.Sort == string.char(81,84,89) then if a.qty ~= b.qty then return a.qty > b.qty end end
        return getNameOf(a.id) < getNameOf(b.id)
    end)
    return list
end

local function getFilteredSets()
    local all = buildSets(); local list = {}
    for _, s in pairs(all) do local id = s.hId or s.gId; if id and matchesRarity(id) and matchesSearch(s.label, id) and matchesNew(id) then table.insert(list, s) end end
    table.sort(list, function(a, b)
        if State.Sort == string.char(70,65,86) then local fa = (a.hId and isFavorite(a.hId)) or (a.gId and isFavorite(a.gId)); local fb = (b.hId and isFavorite(b.hId)) or (b.gId and isFavorite(b.gId)); if fa ~= fb then return fa end end
        if State.Sort == string.char(82,65,82,73,84,89) then if a.maxRarity ~= b.maxRarity then return a.maxRarity > b.maxRarity end
        elseif State.Sort == string.char(81,84,89) then if a.totalQty ~= b.totalQty then return a.totalQty > b.totalQty end end
        return a.label < b.label
    end)
    return list
end

local function getFilteredGP()
    local list = {}
    for id, entry in pairs(State.ItemDatabase) do
        if string.sub(id, 1, 1) == string.char(72) and matchesRarity(id) and matchesSearch(entry.name, id) then
            local owned = State.Inventory[id] or 0; local ownedOk = (not Options.ShowOnlyOwned) or owned > 0; local newOk = (not Options.ShowOnlyNew) or isNewItem(id)
            if ownedOk and newOk then table.insert(list, { id = id, name = entry.name, rarity = entry.rarity, owned = owned }) end
        end
    end
    table.sort(list, function(a, b)
        if State.Sort == string.char(70,65,86) then local fa, fb = isFavorite(a.id), isFavorite(b.id); if fa ~= fb then return fa end end
        if State.Sort == string.char(82,65,82,73,84,89) then if a.rarity ~= b.rarity then return a.rarity > b.rarity end
        elseif State.Sort == string.char(81,84,89) then if a.owned ~= b.owned then return a.owned > b.owned end end
        return a.name < b.name
    end)
    return list
end

local rows = {}
local function clearRows() for _, r in ipairs(rows) do r:Destroy() end table.clear(rows) end
local function getRowHeight() if Options.CompactMode then return 34 end return Options.ShowThumbnails and 52 or 44 end

local function makeStar(parent, id, refresh)
    local star = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); star.Size = UDim2.new(0, 20, 0, 20); star.Position = UDim2.new(0, 6, 0.5, -10); star.BackgroundTransparency = 1
    star.Font = Enum.Font.GothamBold; star.TextSize = 14; star.TextColor3 = isFavorite(id) and Color3.fromRGB(255, 200, 60) or Color3.fromRGB(80, 84, 96); star.Text = string.char(42); star.Parent = parent
    star.MouseButton1Click:Connect(function() toggleFavorite(id); star.TextColor3 = isFavorite(id) and Color3.fromRGB(255, 200, 60) or Color3.fromRGB(80, 84, 96); if refresh then refresh() end end)
end

local function renderItems(list)
    local max = math.min(#list, CONFIG.MAX_ROWS); local rowH = getRowHeight()
    for i = 1, max do
        local data = list[i]; local sel = safeSel(data.id); local banned = State.Banned[data.id] or false
        local label = getDisplayLabel(data.id); local rarity = getRarityOf(data.id); local isNew = isNewItem(data.id)
        local row = Instance.new(string.char(70,114,97,109,101)); row.Size = UDim2.new(1, 0, 0, rowH); row.BackgroundColor3 = banned and Color3.fromRGB(50, 30, 30) or (sel.selected and Color3.fromRGB(60, 50, 100) or Color3.fromRGB(42, 46, 58))
        row.BorderSizePixel = 0; row.Parent = scroll; local c = Instance.new(string.char(85,73,67,111,114,110,101,114)); c.CornerRadius = UDim.new(0, 6); c.Parent = row
        local dot = Instance.new(string.char(70,114,97,109,101)); dot.Size = UDim2.new(0, 4, 1, -10); dot.Position = UDim2.new(0, 2, 0, 5); dot.BackgroundColor3 = RARITY_COLORS[rarity] or Color3.fromRGB(150, 150, 150); dot.BorderSizePixel = 0; dot.Parent = row
        local cdot = Instance.new(string.char(85,73,67,111,114,110,101,114)); cdot.CornerRadius = UDim.new(0, 2); cdot.Parent = dot
        makeStar(row, data.id, _G.__VIC_refresh)
        local textX = 28
        if Options.ShowThumbnails and not Options.CompactMode then
            local thumb = Instance.new(string.char(73,109,97,103,101,76,97,98,101,108)); thumb.Size = UDim2.new(0, 40, 0, 40); thumb.Position = UDim2.new(0, textX, 0.5, -20); thumb.BackgroundColor3 = Color3.fromRGB(28, 30, 38); thumb.BorderSizePixel = 0
            thumb.Image = getThumbnailOf(data.id); thumb.ImageTransparency = banned and 0.6 or 0; thumb.Parent = row
            local ct = Instance.new(string.char(85,73,67,111,114,110,101,114)); ct.CornerRadius = UDim.new(0, 6); ct.Parent = thumb; textX = textX + 46
        end
        local nameBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); nameBtn.Size = UDim2.new(1, -74 - textX, 1, 0); nameBtn.Position = UDim2.new(0, textX, 0, 0); nameBtn.BackgroundTransparency = 1
        nameBtn.Font = Enum.Font.GothamMedium; nameBtn.TextSize = Options.CompactMode and 10 or 11
        nameBtn.TextColor3 = banned and Color3.fromRGB(230, 80, 90) or (sel.selected and Color3.fromRGB(200, 220, 255) or Color3.fromRGB(235, 238, 245))
        nameBtn.TextXAlignment = Enum.TextXAlignment.Left; nameBtn.TextTruncate = Enum.TextTruncate.AtEnd; nameBtn.TextWrapped = true
        local newTag = isNew and string.char(32,32,78,69,87) or ("" ); local banTag = banned and string.char(32,32,91,66,65,78,93) or ("" ); local okTag = (not banned) and sel.selected and string.char(32,32,79,75) or ("" )
        nameBtn.Text = (string.char(37,115,32,32,120,37,100,37,115,37,115,37,115)):format(label, data.qty, banTag, okTag, newTag); nameBtn.Parent = row
        nameBtn.MouseButton1Click:Connect(function() if banned then Notif.push(string.char(73,116,101,109,32,98,97,110,105,100,111,46), string.char(119,97,114,110,105,110,103)); return end; local s = safeSel(data.id); s.selected = not s.selected; _G.__VIC_refresh() end)
        local qty = Instance.new(string.char(84,101,120,116,66,111,120)); qty.Size = UDim2.new(0, 48, 0, Options.CompactMode and 24 or 30); qty.Position = UDim2.new(1, -56, 0.5, Options.CompactMode and -12 or -15); qty.BackgroundColor3 = Color3.fromRGB(28, 30, 38)
        qty.BorderSizePixel = 0; qty.Font = Enum.Font.GothamBold; qty.TextSize = 12; qty.TextColor3 = Color3.fromRGB(235, 238, 245); qty.Text = tostring(sel.qty); qty.Parent = row
        local cq = Instance.new(string.char(85,73,67,111,114,110,101,114)); cq.CornerRadius = UDim.new(0, 6); cq.Parent = qty
        qty.FocusLost:Connect(function() if banned then qty.Text = tostring(sel.qty); return end; local n = tonumber(qty.Text) or 1; n = math.clamp(math.floor(n), 1, data.qty); safeSel(data.id).qty = n; qty.Text = tostring(n); updateCounter() end)
        table.insert(rows, row)
    end
    return max
end

local function renderSets(list)
    local max = math.min(#list, CONFIG.MAX_ROWS); local rowH = getRowHeight()
    for i = 1, max do
        local set = list[i]
        local hSelObj = set.hId and State.Selection[set.hId]; local gSelObj = set.gId and State.Selection[set.gId]
        local hSelQty = (hSelObj and hSelObj.selected) and (hSelObj.qty or 1) or 0; local gSelQty = (gSelObj and gSelObj.selected) and (gSelObj.qty or 1) or 0
        local anySel = hSelQty > 0 or gSelQty > 0; local rarity = set.maxRarity
        local row = Instance.new(string.char(70,114,97,109,101)); row.Size = UDim2.new(1, 0, 0, rowH); row.BackgroundColor3 = anySel and Color3.fromRGB(60, 50, 100) or Color3.fromRGB(42, 46, 58)
        row.BorderSizePixel = 0; row.Parent = scroll; local c = Instance.new(string.char(85,73,67,111,114,110,101,114)); c.CornerRadius = UDim.new(0, 6); c.Parent = row
        local dot = Instance.new(string.char(70,114,97,109,101)); dot.Size = UDim2.new(0, 4, 1, -10); dot.Position = UDim2.new(0, 2, 0, 5); dot.BackgroundColor3 = RARITY_COLORS[rarity] or Color3.fromRGB(150, 150, 150); dot.BorderSizePixel = 0; dot.Parent = row
        local cdot = Instance.new(string.char(85,73,67,111,114,110,101,114)); cdot.CornerRadius = UDim.new(0, 2); cdot.Parent = dot
        local favId = set.hId or set.gId; if favId then makeStar(row, favId, _G.__VIC_refresh) end
        local textX = 28
        if Options.ShowThumbnails and not Options.CompactMode then
            local srcId = set.hId or set.gId; local thumb = Instance.new(string.char(73,109,97,103,101,76,97,98,101,108)); thumb.Size = UDim2.new(0, 40, 0, 40); thumb.Position = UDim2.new(0, textX, 0.5, -20)
            thumb.BackgroundColor3 = Color3.fromRGB(28, 30, 38); thumb.BorderSizePixel = 0; thumb.Image = srcId and getThumbnailOf(srcId) or ("" ); thumb.Parent = row
            local ct = Instance.new(string.char(85,73,67,111,114,110,101,114)); ct.CornerRadius = UDim.new(0, 6); ct.Parent = thumb; textX = textX + 46
        end
        local nameBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); nameBtn.Size = UDim2.new(1, -136 - (textX - 28), 1, 0); nameBtn.Position = UDim2.new(0, textX, 0, 0)
        nameBtn.BackgroundTransparency = 1; nameBtn.Font = Enum.Font.GothamMedium; nameBtn.TextSize = Options.CompactMode and 10 or 11
        nameBtn.TextColor3 = anySel and Color3.fromRGB(200, 220, 255) or Color3.fromRGB(235, 238, 245); nameBtn.TextXAlignment = Enum.TextXAlignment.Left; nameBtn.TextTruncate = Enum.TextTruncate.AtEnd; nameBtn.TextWrapped = true
        local newTag = set.isNew and string.char(32,32,78,69,87) or ("" ); nameBtn.Text = (string.char(37,115,32,32,37,115,37,115)):format(set.label, set.countLabel, newTag); nameBtn.Parent = row
        nameBtn.MouseButton1Click:Connect(function()
            local newQty = anySel and 0 or 1; local marcou = false
            if set.hId and not set.hBanned then local s = safeSel(set.hId); s.selected = newQty > 0; s.qty = newQty > 0 and newQty or 1; marcou = true end
            if set.gId and not set.gBanned then local s = safeSel(set.gId); s.selected = newQty > 0; s.qty = newQty > 0 and newQty or 1; marcou = true end
            if not marcou then Notif.push(string.char(83,101,116,32,105,110,116,101,105,114,111,32,98,97,110,105,100,111,46), string.char(119,97,114,110,105,110,103)) end; _G.__VIC_refresh()
        end)
        local hBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); hBtn.Size = UDim2.new(0, 58, 0, Options.CompactMode and 24 or 30); hBtn.Position = UDim2.new(1, -124, 0.5, Options.CompactMode and -12 or -15)
        hBtn.BorderSizePixel = 0; hBtn.Font = Enum.Font.GothamBold; hBtn.TextSize = 11; hBtn.AutoButtonColor = false; hBtn.Parent = row
        local ch = Instance.new(string.char(85,73,67,111,114,110,101,114)); ch.CornerRadius = UDim.new(0, 6); ch.Parent = hBtn
        if set.hId then
            if set.hBanned then hBtn.Text = string.char(72,32,66,65,78); hBtn.TextColor3 = Color3.fromRGB(200, 90, 90); hBtn.BackgroundColor3 = Color3.fromRGB(40, 25, 25)
                hBtn.MouseButton1Click:Connect(function() Notif.push(string.char(77,97,114,114,101,116,97,32,98,97,110,105,100,97,46), string.char(119,97,114,110,105,110,103)) end)
            else
                hBtn.Text = hSelQty > 0 and (string.char(72,32,120,37,100)):format(hSelQty) or string.char(72); hBtn.TextColor3 = hSelQty > 0 and Color3.fromRGB(235, 238, 245) or Color3.fromRGB(180, 185, 200)
                hBtn.BackgroundColor3 = (hSelQty > 0 and hSelQty >= set.hQty) and Color3.fromRGB(80, 200, 120) or (hSelQty > 0 and Color3.fromRGB(120, 90, 255) or Color3.fromRGB(50, 54, 66))
                hBtn.MouseButton1Click:Connect(function()
                    local s = safeSel(set.hId); local cur = (s.selected and s.qty) or 0; local nxt = cur + 1
                    if nxt > set.hQty then nxt = 0 end
                    if nxt == 0 then s.selected = false; s.qty = 1 else s.selected = true; s.qty = nxt end
                    if Options.AutoCompleteSet and set.gId and not set.gBanned then local gs = safeSel(set.gId); if nxt > 0 and not gs.selected then gs.selected = true; gs.qty = 1 elseif nxt == 0 then gs.selected = false; gs.qty = 1 end end
                    _G.__VIC_refresh()
                end)
            end
        else hBtn.Text = string.char(72); hBtn.TextColor3 = Color3.fromRGB(100, 105, 120); hBtn.BackgroundColor3 = Color3.fromRGB(30, 33, 40) end
        local gBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); gBtn.Size = UDim2.new(0, 58, 0, Options.CompactMode and 24 or 30); gBtn.Position = UDim2.new(1, -62, 0.5, Options.CompactMode and -12 or -15)
        gBtn.BorderSizePixel = 0; gBtn.Font = Enum.Font.GothamBold; gBtn.TextSize = 11; gBtn.AutoButtonColor = false; gBtn.Parent = row
        local cg = Instance.new(string.char(85,73,67,111,114,110,101,114)); cg.CornerRadius = UDim.new(0, 6); cg.Parent = gBtn
        if set.gId then
            if set.gBanned then gBtn.Text = string.char(71,32,66,65,78); gBtn.TextColor3 = Color3.fromRGB(200, 90, 90); gBtn.BackgroundColor3 = Color3.fromRGB(40, 25, 25)
                gBtn.MouseButton1Click:Connect(function() Notif.push(string.char(71,101,109,97,32,98,97,110,105,100,97,46), string.char(119,97,114,110,105,110,103)) end)
            else
                gBtn.Text = gSelQty > 0 and (string.char(71,32,120,37,100)):format(gSelQty) or string.char(71); gBtn.TextColor3 = gSelQty > 0 and Color3.fromRGB(235, 238, 245) or Color3.fromRGB(180, 185, 200)
                gBtn.BackgroundColor3 = (gSelQty > 0 and gSelQty >= set.gQty) and Color3.fromRGB(80, 200, 120) or (gSelQty > 0 and Color3.fromRGB(120, 90, 255) or Color3.fromRGB(50, 54, 66))
                gBtn.MouseButton1Click:Connect(function()
                    local s = safeSel(set.gId); local cur = (s.selected and s.qty) or 0; local nxt = cur + 1
                    if nxt > set.gQty then nxt = 0 end
                    if nxt == 0 then s.selected = false; s.qty = 1 else s.selected = true; s.qty = nxt end
                    if Options.AutoCompleteSet and set.hId and not set.hBanned then local hs = safeSel(set.hId); if nxt > 0 and not hs.selected then hs.selected = true; hs.qty = 1 elseif nxt == 0 then hs.selected = false; hs.qty = 1 end end
                    _G.__VIC_refresh()
                end)
            end
        else gBtn.Text = string.char(71); gBtn.TextColor3 = Color3.fromRGB(100, 105, 120); gBtn.BackgroundColor3 = Color3.fromRGB(30, 33, 40) end
        table.insert(rows, row)
    end
    return max
end

local function renderGP(list)
    local max = math.min(#list, CONFIG.MAX_ROWS); local rowH = getRowHeight()
    for i = 1, max do
        local data = list[i]; local sel = safeSel(data.id); local banned = State.Banned[data.id] or false
        local has = data.owned > 0; local isNew = isNewItem(data.id)
        local row = Instance.new(string.char(70,114,97,109,101)); row.Size = UDim2.new(1, 0, 0, rowH); row.BackgroundColor3 = banned and Color3.fromRGB(50, 30, 30) or (sel.selected and Color3.fromRGB(80, 40, 60) or (has and Color3.fromRGB(42, 46, 58) or Color3.fromRGB(28, 30, 36)))
        row.BorderSizePixel = 0; row.Parent = scroll; local c = Instance.new(string.char(85,73,67,111,114,110,101,114)); c.CornerRadius = UDim.new(0, 6); c.Parent = row
        local dot = Instance.new(string.char(70,114,97,109,101)); dot.Size = UDim2.new(0, 4, 1, -10); dot.Position = UDim2.new(0, 2, 0, 5); dot.BackgroundColor3 = RARITY_COLORS[data.rarity] or Color3.fromRGB(150, 150, 150); dot.BorderSizePixel = 0; dot.Parent = row
        local cdot = Instance.new(string.char(85,73,67,111,114,110,101,114)); cdot.CornerRadius = UDim.new(0, 2); cdot.Parent = dot; makeStar(row, data.id, _G.__VIC_refresh)
        local textX = 28
        if Options.ShowThumbnails and not Options.CompactMode then
            local thumb = Instance.new(string.char(73,109,97,103,101,76,97,98,101,108)); thumb.Size = UDim2.new(0, 40, 0, 40); thumb.Position = UDim2.new(0, textX, 0.5, -20); thumb.BackgroundColor3 = Color3.fromRGB(28, 30, 38); thumb.BorderSizePixel = 0
            thumb.Image = getThumbnailOf(data.id); thumb.ImageTransparency = (banned or not has) and 0.6 or 0; thumb.Parent = row
            local ct = Instance.new(string.char(85,73,67,111,114,110,101,114)); ct.CornerRadius = UDim.new(0, 6); ct.Parent = thumb; textX = textX + 46
        end
        local nameBtn = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110)); nameBtn.Size = UDim2.new(1, -74 - textX, 1, 0); nameBtn.Position = UDim2.new(0, textX, 0, 0); nameBtn.BackgroundTransparency = 1
        nameBtn.Font = Enum.Font.GothamMedium; nameBtn.TextSize = Options.CompactMode and 10 or 11; nameBtn.TextColor3 = banned and Color3.fromRGB(230, 80, 90) or not has and Color3.fromRGB(130, 135, 150) or (sel.selected and Color3.fromRGB(255, 200, 220) or Color3.fromRGB(235, 238, 245))
        nameBtn.TextXAlignment = Enum.TextXAlignment.Left; nameBtn.TextTruncate = Enum.TextTruncate.AtEnd; nameBtn.TextWrapped = true
        local ownedTxt = has and (string.char(116,101,109,58,32,37,100)):format(data.owned) or string.char(110,97,111,32,116,101,109); local selectedTxt = (not banned) and sel.selected and (string.char(32,32,120,37,100,32,79,75)):format(sel.qty) or ("" )
        local newTag = isNew and string.char(32,32,78,69,87) or ("" ); local banTag = banned and string.char(32,32,91,66,65,78,93) or ("" )
        nameBtn.Text = (string.char(37,115,32,32,40,37,115,41,37,115,37,115,37,115)):format(data.name, ownedTxt, selectedTxt, newTag, banTag); nameBtn.Parent = row
        nameBtn.MouseButton1Click:Connect(function() if banned then Notif.push(string.char(73,116,101,109,32,98,97,110,105,100,111,46), string.char(119,97,114,110,105,110,103)); return end; local s = safeSel(data.id); s.selected = not s.selected; _G.__VIC_refresh() end)
        local qty = Instance.new(string.char(84,101,120,116,66,111,120)); qty.Size = UDim2.new(0, 48, 0, Options.CompactMode and 24 or 30); qty.Position = UDim2.new(1, -56, 0.5, Options.CompactMode and -12 or -15)
        qty.BackgroundColor3 = Color3.fromRGB(28, 30, 38); qty.BorderSizePixel = 0; qty.Font = Enum.Font.GothamBold; qty.TextSize = 12; qty.TextColor3 = Color3.fromRGB(235, 238, 245); qty.Text = tostring(sel.qty or 1); qty.Parent = row
        local cq = Instance.new(string.char(85,73,67,111,114,110,101,114)); cq.CornerRadius = UDim.new(0, 6); cq.Parent = qty
        qty.FocusLost:Connect(function() if banned then qty.Text = tostring(sel.qty); return end; local n = tonumber(qty.Text) or 1; n = math.clamp(math.floor(n), 1, CONFIG.DP_MAX_QTY); safeSel(data.id).qty = n; qty.Text = tostring(n); updateCounter() end)
        table.insert(rows, row)
    end
    return max
end

local function render()
    clearRows()
    if State.Filter == string.char(71,80) then
        local list = getFilteredGP(); local max = renderGP(list); status.Text = (string.char(37,100,47,37,100,32,71,80,32,40,99,97,112,32,37,100,120,41)):format(max, #list, CONFIG.DP_MAX_QTY); status.TextColor3 = Color3.fromRGB(220, 140, 180); updateCounter(); return
    end
    if State.Filter == string.char(83,69,84,83) then
        local list = getFilteredSets(); if #list == 0 then status.Text = string.char(83,101,109,32,115,101,116,115,32,118,105,115,105,118,101,105,115,46); status.TextColor3 = Color3.fromRGB(240, 180, 70); updateCounter(); return end
        local max = renderSets(list); local age = math.floor(tick() - State.LastRefresh); status.Text = (string.char(37,100,47,37,100,32,115,101,116,115,44,32,37,115)):format(max, #list, age < 3 and string.char(97,103,111,114,97) or (age .. string.char(115,32,97,116,114,97,115))); status.TextColor3 = Color3.fromRGB(150, 156, 175); updateCounter(); return
    end
    local list = getFilteredItems(); if #list == 0 then status.Text = string.char(83,101,109,32,105,116,101,110,115,32,118,105,115,105,118,101,105,115,46,32,84,111,99,97,32,82,46); status.TextColor3 = Color3.fromRGB(240, 180, 70); updateCounter(); return end
    local max = renderItems(list); local age = math.floor(tick() - State.LastRefresh); status.Text = (string.char(37,100,47,37,100,32,105,116,101,110,115,44,32,37,115)):format(max, #list, age < 3 and string.char(97,103,111,114,97) or (age .. string.char(115,32,97,116,114,97,115))); status.TextColor3 = Color3.fromRGB(150, 156, 175); updateCounter()
end

local function buildOffer()
    local oferta = {}; local limpos = 0
    for id, sel in pairs(State.Selection) do
        if sel.selected then
            if State.Banned[id] then sel.selected = false; limpos = limpos + 1
            else
                local owned = State.Inventory[id] or 0; local n = sel.qty or 1
                if owned <= 0 then n = math.clamp(n, 1, CONFIG.DP_MAX_QTY) else n = math.clamp(n, 1, owned) end
                for _ = 1, n do table.insert(oferta, id) end 
            end
        end
    end
    if limpos > 0 then Notif.push((string.char(37,100,32,105,116,101,109,40,115,41,32,98,97,110,105,100,111,40,115,41,32,114,101,109,111,118,105,100,111,40,115,41,46)):format(limpos), string.char(119,97,114,110,105,110,103)); task.defer(function() if _G.__VIC_refresh then _G.__VIC_refresh() end end) end
    return oferta
end

local function doSend()
    if tick() < State.CooldownEnd then Notif.push(string.char(67,111,111,108,100,111,119,110,32,97,116,105,118,111,46), string.char(119,97,114,110,105,110,103)); return end
    local oferta = buildOffer()
    if #oferta == 0 then Notif.push(string.char(79,102,101,114,116,97,32,118,97,122,105,97,46), string.char(119,97,114,110,105,110,103)); return end
    local ok, err = pcall(function() Remote:FireServer(CONFIG.SEND_EVENT, oferta) end)
    if ok then
        State.LastSend = { count = #oferta, time = tick() }; table.insert(State.SendHistory, { count = #oferta, time = tick() })
        if #State.SendHistory > 10 then table.remove(State.SendHistory, 1) end
        updateLastSendLabel(); Notif.push((string.char(69,110,118,105,97,100,111,58,32,37,100,32,105,116,101,109,40,115,41)):format(#oferta), string.char(115,117,99,99,101,115,115))
        State.CooldownEnd = tick() + CONFIG.COOLDOWN_TIME; updateCooldown()
    else Notif.push(string.char(69,114,114,111,58,32) .. tostring(err), string.char(101,114,114,111,114)) end
end

local function send()
    local oferta = buildOffer()
    if #oferta == 0 then Notif.push(string.char(78,101,110,104,117,109,32,105,116,101,109,32,115,101,108,101,99,105,111,110,97,100,111,46), string.char(119,97,114,110,105,110,103)); return end
    if #oferta > CONFIG.CONFIRM_AT then showConfirm(string.char(67,111,110,102,105,114,109,97,114,32,111,102,101,114,116,97), (string.char(86,111,99,101,32,118,97,105,32,101,110,118,105,97,114,32,37,100,32,105,116,101,110,115,46,32,84,101,109,32,99,101,114,116,101,122,97,63)):format(#oferta), doSend) else doSend() end
end

local function copyOffer()
    local oferta = buildOffer()
    if #oferta == 0 then Notif.push(string.char(78,97,100,97,32,112,114,97,32,99,111,112,105,97,114,46), string.char(119,97,114,110,105,110,103)); return end
    local count = {}
    for _, id in ipairs(oferta) do count[id] = (count[id] or 0) + 1 end
    local parts = {}
    for id, q in pairs(count) do table.insert(parts, (string.char(37,100,120,32,37,115)):format(q, id)) end
    table.sort(parts); local text = table.concat(parts, string.char(44,32))
    local ok = false; if setclipboard then ok = pcall(setclipboard, text) end; if not ok and toclipboard then ok = pcall(toclipboard, text) end
    if ok then Notif.push(string.char(79,102,101,114,116,97,32,99,111,112,105,97,100,97,46), string.char(115,117,99,99,101,115,115)) else Notif.push(string.char(83,101,109,32,99,108,105,112,98,111,97,114,100,46,32,84,101,120,116,111,58,32) .. text:sub(1, 30), string.char(119,97,114,110,105,110,103)) end
end

local function selectAllMax()
    if State.Filter == string.char(71,80) then
        for _, item in ipairs(getFilteredGP()) do if not State.Banned[item.id] then local s = safeSel(item.id); s.selected = true; s.qty = CONFIG.DP_MAX_QTY end end
    elseif State.Filter == string.char(83,69,84,83) then
        for _, set in ipairs(getFilteredSets()) do
            if set.hId and not set.hBanned then local s = safeSel(set.hId); s.selected = true; s.qty = set.hQty end
            if set.gId and not set.gBanned then local s = safeSel(set.gId); s.selected = true; s.qty = set.gQty end
        end
    else
        for _, item in ipairs(getFilteredItems()) do if not State.Banned[item.id] then safeSel(item.id).selected = true; safeSel(item.id).qty = item.qty end end
    end
end

local function incrementAll()
    local changed = false
    local function inc(id, maxQty, banned)
        if not id or banned then return end
        local s = safeSel(id); local cur = (s.selected and s.qty) or 0
        if cur < maxQty then s.selected = true; s.qty = cur + 1; changed = true end
    end
    if State.Filter == string.char(71,80) then
        for _, item in ipairs(getFilteredGP()) do if not State.Banned[item.id] then inc(item.id, CONFIG.DP_MAX_QTY, false) end end
    elseif State.Filter == string.char(83,69,84,83) then
        for _, set in ipairs(getFilteredSets()) do inc(set.hId, set.hQty, set.hBanned); inc(set.gId, set.gQty, set.gBanned) end
    else
        for _, item in ipairs(getFilteredItems()) do if not State.Banned[item.id] then inc(item.id, item.qty, false) end end
    end
    return changed
end

task.spawn(function()
    loadDatabase(); installListener()
    if HAS_FILE then loadPresetFromFile(); loadFavorites() end
    _G.__VIC_refresh = render
    search:GetPropertyChangedSignal(string.char(84,101,120,116)):Connect(function() State.Search = search.Text; render() end)
    btnRef.MouseButton1Click:Connect(function() Remote:FireServer(CONFIG.REQUEST_EVENT); Notif.push(string.char(80,101,100,105,110,100,111,32,105,110,118,101,110,116,97,114,105,111,46,46,46), string.char(105,110,102,111)) end)
    btnOff.MouseButton1Click:Connect(function() for _, s in pairs(State.Selection) do s.selected = false end render() end)
    btn1x.MouseButton1Click:Connect(function() local changed = incrementAll(); render(); if changed then Notif.push(string.char(43,49,32,101,109,32,116,111,100,111,115,32,118,105,115,105,118,101,105,115,46), string.char(105,110,102,111)) else Notif.push(string.char(84,111,100,111,115,32,110,111,32,109,97,120,105,109,111,46), string.char(119,97,114,110,105,110,103)) end end)
    btnAll.MouseButton1Click:Connect(function() selectAllMax(); render(); Notif.push(string.char(83,101,108,101,99,105,111,110,97,100,111,32,116,117,100,111,46), string.char(105,110,102,111)) end)
    btnCopy.MouseButton1Click:Connect(copyOffer); sendBtn.MouseButton1Click:Connect(send)
    UserInputService.InputBegan:Connect(function(input, gp) if gp then return end; if input.KeyCode == CONFIG.TOGGLE_KEY then if State.Minimized or not main.Visible then restore() else minimize() end end end)
    task.spawn(function() while gui.Parent do task.wait(0.5); pcall(updateCooldown); pcall(updateLastSendLabel) end end)
    main.Visible = true; task.wait(0.5); Remote:FireServer(CONFIG.REQUEST_EVENT); Notif.push(string.char(86,105,99,32,84,114,97,100,101,114,32,70,84,70,32,99,97,114,114,101,103,97,100,111,46), string.char(105,110,102,111))
end)