-- example script using the Resolver library

-- load Resolver library
local Resolver = loadstring(game:HttpGet("https://raw.githubusercontent.com/Queered/ResolverLibrary/main/Library.lua"))() -- loadstring

-- define constants
local MAX_VELOCITY = 30
local PREDICTION_MULTIPLIER = 0.165

-- define variables
local lastCFrame = nil
local nextCFrame = nil
local part = workspace.Part -- change it with target part or wtv u want
local lastUpdateTime = tick()

-- function to update the object's velocity on each frame
local function onUpdate()
    local deltaTime = tick() - lastUpdateTime
    lastUpdateTime = tick()

    -- update last and next CFrames
    lastCFrame = nextCFrame or part.CFrame
    nextCFrame = part.CFrame + Vector3.new(
        math.random(-5, 5),
        math.random(-5, 5),
        math.random(-5, 5)
    )

    -- calculate custom velocity of object
    local customVelocity = Resolver.calculateCustomVelocity( -- calculateCustomVelocity
        lastCFrame, -- lastcf
        nextCFrame, -- nextcf
        deltaTime, -- deltatime
        PREDICTION_MULTIPLIER -- predmultiplier such as 0.165
    )

    -- limit the magnitude of the custom velocity to MAX_VELOCITY
    customVelocity = Resolver.limitVelocityMagnitude(customVelocity, MAX_VELOCITY) -- yeah no shit

    -- apply the custom velocity to the object
    part.Velocity = customVelocity
end

-- connect onUpdate function to RenderStepped event
game:GetService("RunService").RenderStepped:Connect(onUpdate)
