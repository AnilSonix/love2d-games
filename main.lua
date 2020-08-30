function love.load()
    love.keyboard.keysPressed = {}
end

function love.update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
end

function love.keyPressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end
