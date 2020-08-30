require("src.StateMachine")
local push = require("libs.push")

function love.load()
    WINDOW_WIDTH = 1280
    WINDOW_HEIGHT = 720

    VIRTUAL_WIDTH = 512
    VIRTUAL_HEIGHT = 288

    gStateMachine = StateMachine:new({})

    gStateMachine:change("")

    love.keyboard.keysPressed = {}
    math.randomseed(os.time())

    push:setupScreen(
        VIRTUAL_WIDTH,
        VIRTUAL_HEIGHT,
        WINDOW_WIDTH,
        WINDOW_HEIGHT,
        {
            vsync = true,
            fullscreen = false,
            resizable = true
        }
    )
end

function love.update(dt)
    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()

    gStateMachine:render()

    push:finish()
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.resize(w, h)
    push:resize(w, h)
end
