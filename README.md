# Resolver Library

# NOTE: MY CODE WAS MESSY AS HELL I GOT CHATGPT TO REWRITE MY CODE(ORGANIZE, OPTIMIZE IT)

The Resolver library provides utility functions for calculating and manipulating custom velocity vectors based on an object's CFrames.

## Functions

### `calculateCustomVelocity(lastCFrame: CFrame, nextCFrame: CFrame, deltaTime: number, prediction: number): Vector3`

Calculates the custom velocity of an object based on its previous and next CFrames.

- `lastCFrame`: The previous CFrame of the object.
- `nextCFrame`: The next CFrame of the object.
- `deltaTime`: The time elapsed between the two CFrames (in seconds).
- `prediction`: A multiplier to adjust the velocity (e.g. for predictive purposes).

Returns a `Vector3` representing the custom velocity of the object.

### `getVelocityMagnitude(velocity: Vector3): number`

Calculates the magnitude of a velocity vector.

- `velocity`: The velocity vector to calculate the magnitude of.

Returns a `number` representing the magnitude of the velocity vector.

### `limitVelocityMagnitude(velocity: Vector3, maxMagnitude: number): Vector3`

Limits the magnitude of a velocity vector to a specified maximum value.

- `velocity`: The velocity vector to limit the magnitude of.
- `maxMagnitude`: The maximum magnitude of the velocity vector.

Returns a `Vector3` representing the velocity vector with its magnitude limited to `maxMagnitude`.
