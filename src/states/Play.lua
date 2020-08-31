require("src.Ball")
require("src.Paddle")
require("src.AABB")

Play = {}
function Play:new()
    local obj = {
        ball = Ball:new(VIRTUAL_WIDTH / 2 - Ball.width, VIRTUAL_HEIGHT / 2 - Ball.width),
        paddle1 = Paddle:new(0, VIRTUAL_HEIGHT / 2 - Paddle.height),
        paddle2 = Paddle:new(VIRTUAL_WIDTH - Paddle.width, VIRTUAL_HEIGHT / 2 - Paddle.height)
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end
function Play:enter(enterParams)
    self.ball.dx = math.random(2) == 1 and math.random(50, 80) or -math.random(50, 80)
    self.ball.dy = math.random(2) == 1 and math.random(50, 80) or -math.random(50, 80)
end
function Play:update(dt)
    -- move up and down
    if love.keyboard.isDown("up") then
        self.paddle1.y = math.max(0, self.paddle1.y - Paddle.speed * dt)
    end

    if love.keyboard.isDown("down") then
        self.paddle1.y = math.min(VIRTUAL_HEIGHT - Paddle.height, self.paddle1.y + Paddle.speed * dt)
    end

    if love.keyboard.isDown("w") then
        self.paddle2.y = math.max(0, self.paddle2.y - Paddle.speed * dt)
    end

    if love.keyboard.isDown("s") then
        self.paddle2.y = math.min(VIRTUAL_HEIGHT - Paddle.height, self.paddle2.y + Paddle.speed * dt)
    end

    -- ball and paddle collisions
    local ball = {
        x = self.ball.x,
        y = self.ball.y,
        width = Ball.width,
        height = Ball.width
    }

    local paddle1 = {
        x = self.paddle1.x,
        y = self.paddle1.y,
        width = Paddle.width,
        height = Paddle.height
    }

    local paddle2 = {
        x = self.paddle2.x,
        y = self.paddle2.y,
        width = Paddle.width,
        height = Paddle.height
    }
    if AABB(ball, paddle1) then
        self.ball.dx = -self.ball.dx * 1.03
        self.ball.x = self.paddle1.x + Paddle.width

        if self.ball.dy < 0 then
            self.ball.dy = -math.random(10, 150)
        else
            self.ball.dy = math.random(10, 150)
        end
    end

    if AABB(ball, paddle2) then
        self.ball.dx = -self.ball.dx * 1.03
        self.ball.x = self.paddle2.x - Ball.width

        if self.ball.dy < 0 then
            self.ball.dy = -math.random(10, 150)
        else
            self.ball.dy = math.random(10, 150)
        end
    end

    -- ball and paddle dont hit
    if self.ball.x < -Ball.width then
        gStateMachine:change("play")
    end

    if self.ball.x > VIRTUAL_WIDTH then
        gStateMachine:change("play")
    end

    -- bounce ball if collides with top or bottom screen
    if self.ball.y < 0 then
        self.ball.y = 0
        self.ball.dy = -self.ball.dy
    end

    if self.ball.y + Ball.width > VIRTUAL_HEIGHT then
        self.ball.y = VIRTUAL_HEIGHT - Ball.width
        self.ball.dy = -self.ball.dy
    end

    self.ball:update(dt)
    self.paddle1:update(dt)
    self.paddle2:update(dt)
end
function Play:render()
    self.ball:render()
    self.paddle1:render()
    self.paddle2:render()
end
function Play:exit()
end
