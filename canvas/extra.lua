local Tile = require "tile"

Extra = Tile:extend()

function Extra:new(w, h, x, y, gap, quad)
    Extra.super.new(self, w, h, x, y, gap, quad)
end

function Extra:draw()
    love.graphics.draw(self.canvas, self.x, self.y)
end


return Extra