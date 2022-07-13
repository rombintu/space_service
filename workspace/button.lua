local Button = {}

function Button:new(startX, endX, startY, endY, range)
    local object = {
        ["click"] = false,
        ["x"] = {["start"] = startX, ["tip"] = endX},
        ["y"] = {["start"] = startY, ["tip"] = endY},
        ["range"] = range
    }

    setmetatable(object, self)
    self.__index = self
    return object
end

return Button