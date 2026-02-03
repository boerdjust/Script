-- 加強版：同時保護 PrimaryPart 與所有肢體
local function antiFling()
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CustomPhysicalProperties = PhysicalProperties.new(9999, 0, 0.5, 9999, 1)  -- 超高密度+高摩擦
            part.CanCollide = true
            if part ~= root then
                part.Anchored = false
            end
        end
    end
    
    -- 持續把所有非必要的力清掉
    RunService.Stepped:Connect(function()
        if root then
            root.Velocity = Vector3.new(math.clamp(root.Velocity.X, -80, 80), root.Velocity.Y, math.clamp(root.Velocity.Z, -80, 80))
            root.RotVelocity = Vector3.new(0, math.clamp(root.RotVelocity.Y, -20, 20), 0)  -- 只允許少量Y軸轉
        end
    end)
end

antiFling()
