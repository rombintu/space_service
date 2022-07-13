local love = require("love")

local release = {}

function release.print(version)
    love.graphics.setFont(love.graphics.newFont(12))
    love.graphics.print(
        "version: " .. version,
        love.graphics.getWidth()-100,
        love.graphics.getHeight()-20
    )
end

return release