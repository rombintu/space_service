local love = require("love")

Tablet = {}

local width = 400
local height = 100
local speed = 1000
local delta = 2
local toX = 300

function Tablet:new(x, y)
    local object = {
        ["x"] = x,
        ["y"] = y,
        ["width"] = width,
        ["height"] = height,
        ["color"] = {0,1,1}, -- TODO
        ["speed"] = speed,
        ["delta"] = delta,
        ["max"] = width
    }

    function object:getPos()
        return {self.x, self.y}
    end

    function object:getColor()
        return self.color
    end

    function object:draw()
        love.graphics.setColor(self.color)
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    end

    function object:moveToRight(dt)
        self.x = self.x + self.speed * dt
        self.speed = self.speed - self.delta * dt
    end

    setmetatable(object, self)
    self.__index = self
    return object
end

return Tablet