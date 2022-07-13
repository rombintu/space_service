local love = require("love")
local config = require("../utils.config")

Tablet = {}

function Tablet:new(x, y, side)
    local object = {
        ["x"] = x,
        ["y"] = y,
        ["width"] = config.tablet.width,
        ["height"] = config.tablet.height,
        ["color"] = {0,1,1}, -- TODO
        ["speed"] = config.tablet.speed,
        ["delta"] = config.tablet.delta,
        ["max"] = config.tablet.width,
        ["active"] = false,
        ["side"] = side,
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

    function object:moveTo(dt)
        self.x = self.x + (self.speed*side) * dt
    end

    setmetatable(object, self)
    self.__index = self
    return object
end

return Tablet