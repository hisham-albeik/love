require 'intro'
function love.load()
		intro = intro.init("resources/videos/intro.ogv")
        love.audio.setVolume(0.1)
		intro.play()
end
 
function love.draw()
	love.graphics.setBackgroundColor( 0,0,0) --not very useful,just set the default color and the background color
	love.graphics.setColor(255, 255, 255)
    if intro.video:isPlaying() then
        love.graphics.draw(intro.video, intro.x,intro.y, 0, intro.scale)
    else
        love.event.quit() 
    end
end
