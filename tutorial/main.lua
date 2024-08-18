function love.load()
    image = love.graphics.newImage("cake.jpg")
    love.graphics.setNewFont(12)
    love.graphics.setBackgroundColor(0,0,0)
end

function love.draw()
    screen_width = love.graphics.getWidth()
    screen_height = love.graphics.getHeight()
    love.graphics.draw(image, imgx, imgy)
    love.graphics.print("Click and drag the cake around or use the arrow keys", 10, 10)
    love.graphics.rectangle("line", 200, 30, 120, 100)
    love.graphics.rectangle("line",5,5, screen_width-10, screen_height-10)
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
       imgx = x -- move image to where mouse clicked
       imgy = y
    end
end
