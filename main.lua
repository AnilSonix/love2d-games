require("src.StateMachine")
require("src.states.Home")
require("src.states.Play")

local push = require("libs.push")
pprint = require("libs.pprint")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    WINDOW_WIDTH = 1280
    WINDOW_HEIGHT = 720

    VIRTUAL_WIDTH = 512
    VIRTUAL_HEIGHT = 288

    gStateMachine =
        StateMachine:new(
        {
            ["home"] = function()
                return Home:new()
            end,
            ["play"] = function()
                return Play:new()
            end
        }
    )
    gStateMachine:change("home")

    gFonts = {
        ["large"] = love.graphics.newFont("assets/fonts/font.ttf", 32),
        ["medium"] = love.graphics.newFont("assets/fonts/font.ttf", 16),
        ["small"] = love.graphics.newFont("assets/fonts/font.ttf", 8)
    }

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

    displayFPS()

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

function displayFPS()
    -- simple FPS display across all states
    love.graphics.setFont(gFonts.small)
    love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 10)
end
