local Tile = require "tile"

Cli = Tile:extend()

function Cli:new(w, h, x, y, gap, quad)
    Cli.super.new(self, w, h, x, y, gap, quad)
end

function Cli:draw()
    love.graphics.draw(self.canvas, self.x, self.y)
end


return Cli