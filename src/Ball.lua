Ball = {width = 25}

function Ball:new(x, y)
    local obj = {x = x, y = y, dx = 0, dy = 0}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Ball:render()
    love.graphics.setFont(gFonts.small)
    love.graphics.print(pprint.pformat(self), self.x, self.y + Ball.width)
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y, Ball.width, Ball.width)
end
