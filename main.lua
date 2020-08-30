require("src.StateMachine")

function love.load()
    gStateMachine = StateMachine:new({})

    gStateMachine:change("")

    love.keyboard.keysPressed = {}
end

function love.update(dt)
    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    gStateMachine:render()
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end
