-- main.lua

local windowWidth, windowHeight
local font
local dialogueText = "Welcome to CyberDetective. You are a new cybercrime detective, ready to take on your first case. Type 'help' for available commands."
local cliText = ""
local cliInput = ""
local mediaText = "Media content will be displayed here."
local extraText = "Extra features will be shown here."

local cursorVisible = true
local cursorBlinkTime = 0
local cursorBlinkDuration = 0.5  -- Blink every half second

function love.load()
    love.window.setMode(1280, 1024, {resizable=false, vsync=true})
    windowWidth, windowHeight = love.graphics.getDimensions()
    font = love.graphics.newFont(14)
    love.keyboard.setKeyRepeat(true)
end

function love.draw()
    love.graphics.setFont(font)
    
    -- Draw dialogue window (top-left)
    love.graphics.setColor(128, 0, 0,255)
    love.graphics.rectangle("fill", 10, 10, windowWidth/2 - 15, windowHeight/2 - 15)
    love.graphics.printf("Dialogue", 15, 15, windowWidth/2 - 20, "left")
    love.graphics.printf(dialogueText, 15, 40, windowWidth/2 - 20, "left")

    -- Draw media window (top-right)
    love.graphics.setColor(0, 128, 0)
    love.graphics.rectangle("line", windowWidth/2 + 5, 10, windowWidth/2 - 15, windowHeight/2 - 15)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("Media", windowWidth/2 + 10, 15, windowWidth/2 - 20, "left")
    love.graphics.printf(mediaText, windowWidth/2 + 10, 40, windowWidth/2 - 20, "left")

    -- Draw CLI window (bottom-left)
    love.graphics.setColor(0, 0, 128)
    love.graphics.rectangle("line", 10, windowHeight/2 + 5, windowWidth/2 - 15, windowHeight/2 - 15)
    love.graphics.printf("CLI", 15, windowHeight/2 + 10, windowWidth/2 - 20, "left")
    love.graphics.printf(cliText, 15, windowHeight/2 + 35, windowWidth/2 - 20, "left")

    -- Draw the input text
    local inputText = "C:\\CyberDetective> " .. cliInput
    love.graphics.print(inputText, 15, windowHeight - 30)
    
    -- Draw the blinking cursor
    if cursorVisible then
        local cursorX = 15 + font:getWidth(inputText)
        love.graphics.line(cursorX, windowHeight - 30, cursorX, windowHeight - 10)
    end

    -- Draw extra features window (bottom-right)
    love.graphics.rectangle("line", windowWidth/2 + 5, windowHeight/2 + 5, windowWidth/2 - 15, windowHeight/2 - 15)
    love.graphics.printf("Extra Features", windowWidth/2 + 10, windowHeight/2 + 10, windowWidth/2 - 20, "left")
    love.graphics.printf(extraText, windowWidth/2 + 10, windowHeight/2 + 35, windowWidth/2 - 20, "left")
end

-- Add this new function to update the cursor blink state
function love.update(dt)
    cursorBlinkTime = cursorBlinkTime + dt
    if cursorBlinkTime >= cursorBlinkDuration then
        cursorVisible = not cursorVisible
        cursorBlinkTime = cursorBlinkTime - cursorBlinkDuration
    end
end

function love.textinput(t)
    cliInput = cliInput .. t
end

-- Modify the love.keypressed function to reset the cursor visibility
function love.keypressed(key)
    if key == "backspace" then
        cliInput = cliInput:sub(1, -2)
    elseif key == "return" then
        processCommand(cliInput)
        cliInput = ""
    end
    cursorVisible = true  -- Reset cursor to visible on any key press
    cursorBlinkTime = 0   -- Reset blink timer
end

function processCommand(command)
    command = command:lower()
    if command == "help" then
        cliText = "Available commands:\nhelp - Show this help message\nquit - Exit the game"
    elseif command == "quit" then
        love.event.quit()
    elseif command == "nmap" then
        cliText = do_nmap(command)
    else
        cliText = "Error: Command not recognized. Type 'help' for a list of valid commands."
    end
    dialogueText = "You entered: " .. command
end

function do_nmap(command)
    return "Hoopla!!!"
end