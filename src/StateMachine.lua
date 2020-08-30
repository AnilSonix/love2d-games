StateMachine = {
    empty = {
        enter = function()
        end,
        update = function()
        end,
        render = function()
        end,
        exit = function()
        end
    }
}

function StateMachine:new(states)
    local obj = {states = states or {}, current = StateMachine.empty}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function StateMachine:change(stateName, enterParams)
    assert(self.states[stateName])

    self.current:exit()
    self.current = self.states[stateName]()
    self.current:enter(enterParams)
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:render()
    self.current:render()
end
