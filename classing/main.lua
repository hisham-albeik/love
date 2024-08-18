--! file: main.lua

function love.load()
    Object = require "classic"
    --Don't forget to load the file
    require "shape"

    require "rectangle"

    --Don't forget to load the file
    require "circle"

    r1 = Rectangle(100, 100, 200, 50)

    --We make r2 a Circle instead of a Rectangle
    r2 = Circle(350, 80, 40)
end

function love.update(dt)
    r1:update(dt)
    r2:update(dt)
end

function love.draw()
    r1:draw()
    r2:draw()
end