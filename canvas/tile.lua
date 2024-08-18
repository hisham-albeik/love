local Tile = Object:extend()

function Tile:new(width, height, x, y, gap, quad)
    self.x = x
    self.y = y
    self.gap = gap
    self.canvas = love.graphics.newCanvas(width, height)
    love.graphics.setCanvas(self.canvas)
        love.graphics.rectangle("line", self.gap, self.gap , width - (self.gap * 2), height - (self.gap * 2))
    love.graphics.setCanvas()
end

function Tile:draw()
    love.graphics.draw(self.canvas, self.x, self.y)
end

return Tile