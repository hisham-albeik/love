function love.load()
    x=0
    y=0
    speed = 5
    love.audio.setVolume(0.05)

    -- Create a canvas to render video on.
    canvas = love.graphics.newCanvas(800, 600)


    love.graphics.setCanvas(canvas)
        video = love.graphics.newVideo("bacteria.ogv")
    love.graphics.setCanvas()

end

function love.update(dt)
    x = x + (speed * dt)
    y = y + (speed * dt)
end

function love.draw()
    love.graphics.draw(canvas, 0, 0)
    video:play()
    if video:isPlaying() then
        love.graphics.draw(video, x,y, 0, 0.6)
    else
        love.event.quit() 
    end
end
