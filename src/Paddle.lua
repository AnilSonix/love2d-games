Paddle = {width = 10, height = 30, speed = 100}
function Paddle:new(x, y)
    local obj = {x = x, y = y}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Paddle:update(dt)
end
function Paddle:render()
    love.graphics.setColor(255, 255, 255)
    love.graphics.setFont(gFonts.small)
    love.graphics.print(
        pprint.pformat(self),
        self.x > VIRTUAL_WIDTH / 2 and self.x - 50 or self.x,
        self.y + Paddle.height
    )
    love.graphics.setColor(0, 255, 0)
    love.graphics.rectangle("fill", self.x, self.y, Paddle.width, Paddle.height)
end
