local love = require("love")

local config = require("utils.config")
local release = require("utils.release")
local mathematics = require("utils.mathematics")

local Tablet = require("workspace.tablet")
local Button = require("workspace.button")

function love.load()
    love.window.setTitle(config.Title)
    love.window.setMode(config.WindowWidth, config.WindowHeight)
    
    -- G
    G = {
        ["window"] = {
            ["width"] = {
                ["start"] = 0,
                ["tip"] = love.graphics.getWidth(),
                ["half"] = love.graphics.getWidth()/2
            },
            ["height"] = {
                ["start"] = 0,
                ["tip"] = love.graphics.getHeight(),
                ["half"] = love.graphics.getHeight()/2
            },
        },

    }

    -- Workspace
    Workspace = {
        ["left"] = {
            ["tablet"] = Tablet:new(
                0 - config.tablet.width/2,
                G.window.height.half - config.tablet.height/2,
                1
            ),
            ["button"] = Button:new(
                G.window.width.start, G.window.width.start+20, G.window.height.half, 0, G.window.width.tip/10
            )
        },
        -- ["right"] = {
        --     ["tablet"] = Tablet:new(50, 50, -1),
        --     ["button"] = Button:new(0, 20, G.window.height.half, 0, G.window.width.tip/10)
        -- }
    }

end

function love.update(dt)
    if Workspace.left.button.click then
        if Workspace.left.tablet.x > Workspace.left.tablet.max then
            Workspace.left.button.click = false
        end
        Workspace.left.tablet:moveTo(dt)
    end
end

function love.draw()
    release.print(config.version)
    Workspace.left.tablet:draw()

    love.graphics.setColor(1,1,1)
    love.graphics.setFont(love.graphics.newFont(40))
    love.graphics.print("BUTTON PRESSED: " .. string.format("%s", tostring(Workspace.left.button.click)), G.window.width.half, G.window.height.half)
end

function love.mousepressed(x, y, click, isTouch)
    if click == 1 then
        if mathematics.between(
            Workspace.left.button.x.start,
            Workspace.left.button.y.start,
            x, y
        ) < Workspace.left.button.range then
            Workspace.left.button.click = true
        end
    end
end