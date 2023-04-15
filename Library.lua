-- resolver library v1.0.0

local Resolver = {}

--[[
    calculates the custom velocity of an object based on its previous and next cfames.
    returns a vector3 representing the custom velocity of the object.
    parameters:
        lastCFrame: the previous CFrame of the object.
        nextCFrame: the next CFrame of the object.
        deltaTime: the time elapsed between the two CFrames (in seconds).
        prediction: a multiplier to adjust the velocity (e.g. for predictive purposes).
--]]
function Resolver.calculateCustomVelocity(lastCFrame, nextCFrame, deltaTime, prediction)
    if not lastCFrame or not nextCFrame or not deltaTime or not prediction then
        error("Invalid arguments provided to calculateCustomVelocity function.")
    end

    local position1 = lastCFrame.Position
    local position2 = nextCFrame.Position
    local velocity = (position2 - position1) / deltaTime

    if velocity.Magnitude > 39 or velocity.Magnitude < -39 then
        return velocity * prediction
    else
        return velocity
    end
end

--[[
    calculates the magnitude of a velocity vector.
    returns a number representing the magnitude of the velocity vector.
    parameters:
        velocity: the velocity vector to calculate the magnitude of.
--]]
function Resolver.getVelocityMagnitude(velocity)
    if not velocity then
        error("Invalid arguments provided to getVelocityMagnitude function.")
    end

    return velocity.Magnitude
end

--[[
    limits the magnitude of a velocity vector to a specified maximum value.
    returns a Vector3 representing the velocity vector with its magnitude limited to maxMagnitude.
    parameters:
        velocity: the velocity vector to limit the magnitude of.
        maxMagnitude: the maximum magnitude of the velocity vector.
--]]
function Resolver.limitVelocityMagnitude(velocity, maxMagnitude)
    if not velocity or not maxMagnitude then
        error("Invalid arguments provided to limitVelocityMagnitude function.")
    end

    local currentMagnitude = velocity.Magnitude
    if currentMagnitude > maxMagnitude then
        return velocity.Unit * maxMagnitude
    end

    return velocity
end

return Resolver
