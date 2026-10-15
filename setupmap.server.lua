local RS = game:GetService("ReplicatedStorage")
local StarterPack = game:GetService("StarterPack")

local remotes = RS:FindFirstChild("Remotes") or Instance.new("Folder")
remotes.Name = "Remotes"
remotes.Parent = RS

local function makeRemote(name)
    local existing = remotes:FindFirstChild(name)
    if existing then return existing end
    local r = Instance.new("RemoteEvent")
    r.Name = name
    r.Parent = remotes
    return r
end

makeRemote("PlantCrop")
makeRemote("HarvestCrop")
makeRemote("BuyWeapon")
makeRemote("OpenShop")
makeRemote("UpdateUI")

if not workspace:FindFirstChild("SafeZone") then
    local sz = Instance.new("Part")
    sz.Name = "SafeZone"
    sz.Size = Vector3.new(60, 30, 60)
    sz.Position = Vector3.new(0, 15, 0)
    sz.Transparency = 0.85
    sz.CanCollide = false
    sz.Anchored = true
    sz.BrickColor = BrickColor.new("Bright green")
    sz.Material = Enum.Material.ForceField
    sz.Parent = workspace
end

if not workspace:FindFirstChild("FarmGround") then
    local g = Instance.new("Part")
    g.Name = "FarmGround"
    g.Size = Vector3.new(120, 1, 80)
    g.Position = Vector3.new(30, 0, 30)
    g.Anchored = true
    g.BrickColor = BrickColor.new("Bright green")
    g.Material = Enum.Material.Grass
    g.Parent = workspace
end

for i = 1, 10 do
    local name = "Plot" .. i
    if not workspace:FindFirstChild(name) then
        local p = Instance.new("Part")
        p.Name = name
        p.Size = Vector3.new(4, 0.6, 4)
        p.Position = Vector3.new(10 + ((i - 1) % 5) * 6, 1, 20 + math.floor((i - 1) / 5) * 6)
        p.Anchored = true
        p.BrickColor = BrickColor.new("Reddish brown")
        p.Material = Enum.Material.Ground
        p.Parent = workspace

        local frame = Instance.new("SelectionBox")
        frame.Adornee = p
        frame.LineThickness = 0.05
        frame.Color3 = Color3.fromRGB(200, 150, 90)
        frame.Parent = p
    end
end

if not workspace:FindFirstChild("ShopPart") then
    local s = Instance.new("Part")
    s.Name = "ShopPart"
    s.Size = Vector3.new(6, 8, 6)
    s.Position = Vector3.new(-20, 4, 30)
    s.Anchored = true
    s.BrickColor = BrickColor.new("Bright yellow")
    s.Material = Enum.Material.Neon
    s.Parent = workspace

    local sg = Instance.new("SurfaceGui")
    sg.Face = Enum.NormalId.Front
    sg.Parent = s

    local tl = Instance.new("TextLabel")
    tl.Size = UDim2.new(1, 0, 1, 0)
    tl.BackgroundTransparency = 1
    tl.Text = "🛒 SHOP"
    tl.TextScaled = true
    tl.TextColor3 = Color3.fromRGB(30, 30, 30)
    tl.Font = Enum.Font.GothamBold
    tl.Parent = sg
end

local templates = RS:FindFirstChild("WeaponTemplates") or Instance.new("Folder")
templates.Name = "WeaponTemplates"
templates.Parent = RS

local function makeTool(name, sizeVec, color, damage)
    local t = Instance.new("Tool")
    t.Name = name
    t.RequiresHandle = true
    t.CanBeDropped = false
    t:SetAttribute("Damage", damage)

    local h = Instance.new("Part")
    h.Name = "Handle"
    h.Size = sizeVec
    h.BrickColor = BrickColor.new(color)
    h.Material = Enum.Material.Metal
    h.TopSurface = Enum.SurfaceType.Smooth
    h.BottomSurface = Enum.SurfaceType.Smooth
    h.Parent = t
    return t
end

if not templates:FindFirstChild("Sword") then
    makeTool("Sword", Vector3.new(0.4, 0.4, 4), "Medium stone grey", 15).Parent = templates
end
if not templates:FindFirstChild("Sword2") then
    makeTool("Sword2", Vector3.new(0.6, 0.6, 6), "Bright red", 30).Parent = templates
end
if not templates:FindFirstChild("Axe") then
    makeTool("Axe", Vector3.new(1.6, 1.6, 3), "Dark orange", 45).Parent = templates
end
if not templates:FindFirstChild("Bow") then
    makeTool("Bow", Vector3.new(0.8, 3, 0.8), "Brown", 60).Parent = templates
end

if not StarterPack:FindFirstChild("Sword") then
    templates.Sword:Clone().Parent = StarterPack
end

print("[SetupMap] done")