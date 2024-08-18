local Tile = require "tile"

Media = Tile:extend()

function Media:new(w, h, x, y, gap, quad, imageF)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.gap = gap
    self.imageF = imageF

    Media.super.new(self, self.w, self.h, self.x, self.y, gap, quad)
    image = love.graphics.newImage(self.imageF)
end

function Media:draw()
    love.graphics.draw(self.canvas, self.x, self.y)
    love.graphics.draw(image, self.x, self.y,0,0.5,0.5,-8,-8)
end

return Media