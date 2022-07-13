local Button = {}

function Button:new(startX, endX, startY, endY, range)
    local object = {
        ["click"] = false,
        ["x"] = {["Start"] = startX, ["End"] = endX},
        ["y"] = {["Start"] = startY, ["End"] = endY},
        ["range"] = range
    }

    setmetatable(object, self)
    self.__index = self
    return object
end

return Button