keypress = 0

function love.load()
    Object = require "classic"
    require "tile"
    require "media"
    require "dialogue"
    require "cli"
    require "extra"

    screenHeight = love.graphics.getHeight()
    screenWidth  = love.graphics.getWidth()
    tileGap = 2

    -- dialogue
    dialogueWidth = screenWidth * (3/4)
    dialogueHeight = screenHeight / 4
    dialoguePosX = 2
    dialoguePosY = 2

    dialogue = Dialogue(dialogueWidth, dialogueHeight, dialoguePosX, dialoguePosY, tileGap, 0)

    -- media
    mediaWidth  = (screenWidth / 4) - tileGap * 4
    mediaHeight = dialogueHeight
    mediaPosX   = dialogueWidth + dialoguePosX + tileGap
    mediaPosY   = dialoguePosY

    media    = Media(mediaWidth, mediaHeight, mediaPosX, mediaPosY, tileGap, 0, "cake.jpg")

    -- cli
    cliWidth  = dialogueWidth
    cliHeight = screenHeight - dialogueHeight - (tileGap * 2)
    cliPosX   = dialoguePosX
    cliPosY   = dialoguePosY + dialogueHeight

    cli      = Cli(cliWidth, cliHeight, cliPosX, cliPosY, tileGap, 0)

    -- extra
    extraWidth  = mediaWidth
    extraHeight = cliHeight
    extraPosX   = mediaPosX
    extraPosY   = cliPosY

    extra    = Extra(extraWidth, extraHeight, extraPosX, extraPosY, tileGap, 0)
    
end

function love.update()
    if love.keyboard.isDown('a') == true then
        kepress = 1
        media    = Media(mediaWidth, mediaHeight, mediaPosX, mediaPosY, tileGap, 0, "cake2.jpg")
    else
        keypress = 0
        media    = Media(mediaWidth, mediaHeight, mediaPosX, mediaPosY, tileGap, 0, "cake.jpg")
    end
end

function love.draw()
    dialogue:draw()
    media:draw()
    cli:draw()
    extra:draw()
end
