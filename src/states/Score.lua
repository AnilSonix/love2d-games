Score = {}
function Score:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end
function Score:enter(enterParams)
end
function Score:update(dt)
    if love.keyboard.wasPressed("enter") or love.keyboard.wasPressed("return") then
        gStateMachine:change("home")
    end
end
function Score:render()
    love.graphics.setColor(0, 255, 255)
    love.graphics.setFont(gFonts.large)
    love.graphics.printf("Game ended", 0, 10, VIRTUAL_WIDTH, "center")

    love.graphics.setFont(gFonts.medium)
    local message = ""
    if score1 == score2 then
        message = "Match draw"
    elseif score1 > score2 then
        message = "Player 1 wins"
    else
        message = "Player 2 wins"
    end
    love.graphics.printf(message, 0, 100, VIRTUAL_WIDTH, "center")

    love.graphics.setColor(255, 255, 255)
    love.graphics.setFont(gFonts.large)
    love.graphics.printf(tostring(score1), 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH / 2, "center")
    love.graphics.printf(tostring(score2), VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH / 2, "center")
end
function Score:exit()
end
