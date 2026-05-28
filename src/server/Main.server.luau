local mainGame = game.Workspace:WaitForChild("MainGame")
local gates = mainGame:WaitForChild("Gates")
local buttons = mainGame:WaitForChild("Buttons")

local function activateButton(button, touched)
	touched.Value = true

	local gate = gates:FindFirstChild("Gate1")

	if gate then
		gate.Transparency = 0.5
		gate.CanCollide = false
	end

	local duration = button:FindFirstChild("Duration")
	local timer = duration.Value

	while timer > 0 do
		print(timer)
		task.wait(1)
		timer -= 1
	end

	-- task.wait(duration.Value)

	if gate then
		gate.Transparency = 0
		gate.CanCollide = true
	end

	touched.Value = false
end

for _, button in pairs(buttons:GetChildren()) do
	button.Touched:Connect(function(otherPart)
		local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
		local touched = button:FindFirstChild("Touched")

		if humanoid and touched and touched.Value == false then
			activateButton(button, touched)
		end
	end)
end
