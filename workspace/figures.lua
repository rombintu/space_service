function Extended (child, parent)
    setmetatable(child,{__index = parent})
end

local Figures = {
    ["figure"] = {},
    ["circle"] = {},
    ["rectangle"] = {},
}

function Figures.figure:new(x, y, w, h, mode)
    local object = {
        ["x"] = x,
        ["y"] = y,
        ["w"] = w,
        ["h"] = h,
        ["mode"] = mode or "line",
    }
    setmetatable(object, self)
    self.__index = self
    return object
end

Extended(Figures.rectangle, Figures.figure)
Extended(Figures.circle, Figures.figure)


return Figures