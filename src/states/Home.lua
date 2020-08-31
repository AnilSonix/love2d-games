Home = {}
function Home:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end
function Home:enter(enterParams)
end
function Home:update(dt)
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        gStateMachine:change("play")
    end
end
function Home:render()
    love.graphics.setFont(gFonts.large)
    love.graphics.printf("Pong", 0, 10, VIRTUAL_WIDTH, "center")

    love.graphics.setFont(gFonts.medium)
    love.graphics.printf("Press enter to play", 0, 100, VIRTUAL_WIDTH, "center")
end
function Home:exit()
end
