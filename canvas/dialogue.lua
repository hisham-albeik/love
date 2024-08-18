local Tile = require "tile"

Dialogue = Tile:extend()

function Dialogue:new(w, h, x, y, gap, quad)
    Dialogue.super.new(self, w, h, x, y, gap, quad)
end

function Dialogue:draw()
    love.graphics.draw(self.canvas, self.x, self.y)
end


return Dialogue