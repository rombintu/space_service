local love = require("love")

local config = require("utils.config")
local mathematics = require("utils.mathematics")

local Tablet = require("workspace.tablet")
local Button = require("workspace.button")

function love.load()
    love.window.setTitle(config.Title)
    love.window.setMode(config.WindowWidth, config.WindowHeight)
    
    -- GLOBALS
    Globals = {
        ["window"] = {
            ["width"] = love.graphics.getWidth(),
            ["height"] = love.graphics.getHeight(),
        },

    }

    Workspace = {
        ["tabletLeft"] = Tablet:new(50, 50),
        ["buttonLeft"] = Button:new(0, 20, Globals.window.height/2, 0, Globals.window.width/10)
        
    }

end

function love.update(dt)
    if Workspace.buttonLeft.click then
        if Workspace.tabletLeft.x > Workspace.tabletLeft.max then
            Workspace.buttonLeft.click = false
        end
        Workspace.tabletLeft.x = Workspace.tabletLeft.x + Workspace.tabletLeft.speed * dt
        Workspace.tabletLeft.speed = Workspace.tabletLeft.speed - Workspace.tabletLeft.delta
    end
end

function love.draw()
    Workspace.tabletLeft:draw()

    love.graphics.setColor(1,1,1)
    love.graphics.setFont(love.graphics.newFont(40))
    love.graphics.print("BUTTON PRESSED: " .. string.format("%s", tostring(Workspace.buttonLeft.click)), Globals.window.width/2, Globals.window.height/2)
end

function love.mousepressed(x, y, click, isTouch)
    if click == 1 then
        if mathematics.between(
            Workspace.buttonLeft.x.Start,
            Workspace.buttonLeft.y.Start,
            x, y
        ) < Workspace.buttonLeft.range then
            Workspace.buttonLeft.click = true
        end
    end
end