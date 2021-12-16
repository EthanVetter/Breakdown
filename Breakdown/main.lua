WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 225

Class = require 'class'
push = require 'push'

require 'Ball'
require 'Paddle'
require 'Bricks'

function love.load()
    math.randomseed(os.time())

    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Breakdown')

    smallFont = love.graphics.newFont('font.TTF', 8)
    victoryFont = love.graphics.newFont('font.TTF', 24)

    sounds = {
        ['paddlehit'] = love.audio.newSource('paddlehit.wav', 'static'),
        ['brickhit'] = love.audio.newSource('brickhit.wav', 'static'),
        ['wallhit'] = love.audio.newSource('wallhit.wav', 'static'),
        ['loselife'] = love.audio.newSource('loselife.wav', 'static'),
        ['victory'] = love.audio.newSource('victory.wav', 'static'),
        ['failure'] = love.audio.newSource('failure.wav', 'static')
    }

    player1Lives = 5

    servingPlayer = 1

    player1Score = 0

    player1 = Paddle(5, 20, 5, 30)
    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 5, 5)
    brick1 = Bricks(VIRTUAL_WIDTH - 10, 10, 5, 20)
    brick2 = Bricks(VIRTUAL_WIDTH - 10, 35, 5, 20)
    brick3 = Bricks(VIRTUAL_WIDTH - 10, 60, 5, 20)
    brick4 = Bricks(VIRTUAL_WIDTH - 10, 85, 5, 20)
    brick5 = Bricks(VIRTUAL_WIDTH - 10, 110, 5, 20)
    brick6 = Bricks(VIRTUAL_WIDTH - 10, 135, 5, 20)
    brick7 = Bricks(VIRTUAL_WIDTH - 10, 160, 5, 20)
    brick8 = Bricks(VIRTUAL_WIDTH - 10, 185, 5, 20)
    brick9 = Bricks(VIRTUAL_WIDTH - 10, 210, 5, 20)
    brickA1 = Bricks(VIRTUAL_WIDTH - 25, 10, 5, 20)
    brickA2 = Bricks(VIRTUAL_WIDTH - 25, 35, 5, 20)
    brickA3 = Bricks(VIRTUAL_WIDTH - 25, 60, 5, 20)
    brickA4 = Bricks(VIRTUAL_WIDTH - 25, 85, 5, 20)
    brickA5 = Bricks(VIRTUAL_WIDTH - 25, 110, 5, 20)
    brickA6 = Bricks(VIRTUAL_WIDTH - 25, 135, 5, 20)
    brickA7 = Bricks(VIRTUAL_WIDTH - 25, 160, 5, 20)
    brickA8 = Bricks(VIRTUAL_WIDTH - 25, 185, 5, 20)
    brickA9 = Bricks(VIRTUAL_WIDTH - 25, 210, 5, 20)
    brickB1 = Bricks(VIRTUAL_WIDTH - 40, 10, 5, 20)
    brickB2 = Bricks(VIRTUAL_WIDTH - 40, 35, 5, 20)
    brickB3 = Bricks(VIRTUAL_WIDTH - 40, 60, 5, 20)
    brickB4 = Bricks(VIRTUAL_WIDTH - 40, 85, 5, 20)
    brickB5 = Bricks(VIRTUAL_WIDTH - 40, 110, 5, 20)
    brickB6 = Bricks(VIRTUAL_WIDTH - 40, 135, 5, 20)
    brickB7 = Bricks(VIRTUAL_WIDTH - 40, 160, 5, 20)
    brickB8 = Bricks(VIRTUAL_WIDTH - 40, 185, 5, 20)
    brickB9 = Bricks(VIRTUAL_WIDTH - 40, 210, 5, 20)
    brickC1 = Bricks(VIRTUAL_WIDTH - 55, 10, 5, 20)
    brickC2 = Bricks(VIRTUAL_WIDTH - 55, 35, 5, 20)
    brickC3 = Bricks(VIRTUAL_WIDTH - 55, 60, 5, 20)
    brickC4 = Bricks(VIRTUAL_WIDTH - 55, 85, 5, 20)
    brickC5 = Bricks(VIRTUAL_WIDTH - 55, 110, 5, 20)
    brickC6 = Bricks(VIRTUAL_WIDTH - 55, 135, 5, 20)
    brickC7 = Bricks(VIRTUAL_WIDTH - 55, 160, 5, 20)
    brickC8 = Bricks(VIRTUAL_WIDTH - 55, 185, 5, 20)
    brickC9 = Bricks(VIRTUAL_WIDTH - 55, 210, 5, 20)
    brickD1 = Bricks(VIRTUAL_WIDTH - 70, 10, 5, 20)
    brickD2 = Bricks(VIRTUAL_WIDTH - 70, 35, 5, 20)
    brickD3 = Bricks(VIRTUAL_WIDTH - 70, 60, 5, 20)
    brickD4 = Bricks(VIRTUAL_WIDTH - 70, 85, 5, 20)
    brickD5 = Bricks(VIRTUAL_WIDTH - 70, 110, 5, 20)
    brickD6 = Bricks(VIRTUAL_WIDTH - 70, 135, 5, 20)
    brickD7 = Bricks(VIRTUAL_WIDTH - 70, 160, 5, 20)
    brickD8 = Bricks(VIRTUAL_WIDTH - 70, 185, 5, 20)
    brickD9 = Bricks(VIRTUAL_WIDTH - 70, 210, 5, 20)

    if servingPlayer == 1 then
        ball.dx = -200
    end

    gameState = 'start'

    Bricks:reset()

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = false
    })
end

function love.update(dt)

    if ball:collides(player1) then
        sounds['paddlehit']:play()
        ball.dx = -ball.dx + 5
        if ball.dy > 0 then
            ball.dy = math.random(0, 100) * 1.5
        elseif ball.dy < 0 then
            ball.dy = math.random(-100, 0) * 1.5
        end
    end


    --Brick Craziness--

    if ball:collides(brick1) then
        ball.dx = -ball.dx - 10 * 1.10
        sounds['brickhit']:play()
        brick1 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brick2) then
        ball.dx = -ball.dx - 10 * 1.10
        sounds['brickhit']:play()
        brick2 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brick3) then
        ball.dx = -ball.dx - 10 * 1.10
        sounds['brickhit']:play()
        brick3 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brick4) then
        ball.dx = -ball.dx - 10 * 1.10
        sounds['brickhit']:play()
        brick4 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brick5) then
        ball.dx = -ball.dx - 10 * 1.10
        sounds['brickhit']:play()
        brick5 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brick6) then
        ball.dx = -ball.dx - 10 * 1.10
        sounds['brickhit']:play()
        brick6 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brick7) then
        ball.dx = -ball.dx - 10 * 1.10
        sounds['brickhit']:play()
        brick7 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brick8) then
        ball.dx = -ball.dx - 10 * 1.10
        sounds['brickhit']:play()
        brick8 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brick9) then
        ball.dx = -ball.dx - 10 * 1.10
        sounds['brickhit']:play()
        brick9 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickA1) then
        ball.dx = -ball.dx - 10 * 1.08
        sounds['brickhit']:play()
        brickA1 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brickA2) then
        ball.dx = -ball.dx - 10 * 1.08
        sounds['brickhit']:play()
        brickA2 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brickA3) then
        ball.dx = -ball.dx - 10 * 1.08
        sounds['brickhit']:play()
        brickA3 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brickA4) then
        ball.dx = -ball.dx - 10 * 1.08
        sounds['brickhit']:play()
        brickA4 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brickA5) then
        ball.dx = -ball.dx - 10 * 1.08
        sounds['brickhit']:play()
        brickA5 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickA6) then
        ball.dx = -ball.dx - 10 * 1.08
        sounds['brickhit']:play()
        brickA6 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brickA7) then
        ball.dx = -ball.dx - 10 * 1.08
        sounds['brickhit']:play()
        brickA7 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brickA8) then
        ball.dx = -ball.dx - 10 * 1.08
        sounds['brickhit']:play()
        brickA8 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brickA9) then
        ball.dx = -ball.dx - 10 * 1.08
        sounds['brickhit']:play()
        brickA9 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickB1) then
        ball.dx = -ball.dx - 10 * 1.06
        sounds['brickhit']:play()
        brickB1 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickB2) then
        ball.dx = -ball.dx - 10 * 1.06
        sounds['brickhit']:play()
        brickB2 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickB3) then
        ball.dx = -ball.dx - 10 * 1.06
        sounds['brickhit']:play()
        brickB3 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickB4) then
        ball.dx = -ball.dx - 10 * 1.06
        sounds['brickhit']:play()
        brickB4 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickB5) then
        ball.dx = -ball.dx - 10 * 1.06
        sounds['brickhit']:play()
        brickB5 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickB6) then
        ball.dx = -ball.dx - 10 * 1.06
        sounds['brickhit']:play()
        brickB6 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickB7) then
        ball.dx = -ball.dx - 10 * 1.06
        sounds['brickhit']:play()
        brickB7 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickB8) then
        ball.dx = -ball.dx - 10 * 1.06
        sounds['brickhit']:play()
        brickB8 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickB9) then
        ball.dx = -ball.dx - 10 * 1.06
        sounds['brickhit']:play()
        brickB9 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickC1) then
        ball.dx = -ball.dx - 10 * 1.04
        sounds['brickhit']:play()
        brickC1 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end
    
    if ball:collides(brickC2) then
        ball.dx = -ball.dx - 10 * 1.04
        sounds['brickhit']:play()
        brickC2 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickC3) then
        ball.dx = -ball.dx - 10 * 1.04
        sounds['brickhit']:play()
        brickC3 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickC4) then
        ball.dx = -ball.dx - 10 * 1.04
        sounds['brickhit']:play()
        brickC4 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickC5) then
        ball.dx = -ball.dx - 10 * 1.04
        sounds['brickhit']:play()
        brickC5 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickC6) then
        ball.dx = -ball.dx - 10 * 1.04
        sounds['brickhit']:play()
        brickC6 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickC7) then
        ball.dx = -ball.dx - 10 * 1.04
        sounds['brickhit']:play()
        brickC7 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickC8) then
        ball.dx = -ball.dx - 10 * 1.04
        sounds['brickhit']:play()
        brickC8 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickC9) then
        ball.dx = -ball.dx - 10 * 1.04
        sounds['brickhit']:play()
        brickC9 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickD1) then
        ball.dx = -ball.dx - 10 * 1.02
        sounds['brickhit']:play()
        brickD1 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickD2) then
        ball.dx = -ball.dx - 10 * 1.02
        sounds['brickhit']:play()
        brickD2 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickD3) then
        ball.dx = -ball.dx - 10 * 1.02
        sounds['brickhit']:play()
        brickD3 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickD4) then
        ball.dx = -ball.dx - 10 * 1.02
        sounds['brickhit']:play()
        brickD4 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickD5) then
        ball.dx = -ball.dx - 10 * 1.02
        sounds['brickhit']:play()
        brickD5 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickD6) then
        ball.dx = -ball.dx - 10 * 1.02
        sounds['brickhit']:play()
        brickD6 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickD7) then
        ball.dx = -ball.dx - 10 * 1.02
        sounds['brickhit']:play()
        brickD7 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickD8) then
        ball.dx = -ball.dx - 10 * 1.02
        sounds['brickhit']:play()
        brickD8 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    if ball:collides(brickD9) then
        ball.dx = -ball.dx - 10 * 1.02
        sounds['brickhit']:play()
        brickD9 = Bricks (0, 0, 0, 0)
        player1Score = player1Score + 1
    end

    --No more brick craziness for now...--

    if ball.y <= 0 then
        ball.dy = -ball.dy + 10
        ball.y = 0
        sounds['wallhit']:play()
    end

    if ball.y >= VIRTUAL_HEIGHT - 5 then
        ball.dy = -ball.dy
        ball.y = VIRTUAL_HEIGHT - 5
        sounds['wallhit']:play()
    end

    if ball.x >= VIRTUAL_WIDTH - 5 then
        ball.dx = -ball.dx
        ball.x = VIRTUAL_WIDTH - 5
        sounds['wallhit']:play()
    end

    player1:update(dt)

    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        player1.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        player1.dy = PADDLE_SPEED
    else
        player1.dy = 0
    end

    if gameState == 'start' then
        ball:reset()

        brick1 = Bricks (VIRTUAL_WIDTH - 10, 10, 5, 20)
        brick2 = Bricks(VIRTUAL_WIDTH - 10, 35, 5, 20)
        brick3 = Bricks(VIRTUAL_WIDTH - 10, 60, 5, 20)
        brick4 = Bricks(VIRTUAL_WIDTH - 10, 85, 5, 20)
        brick5 = Bricks(VIRTUAL_WIDTH - 10, 110, 5, 20)
        brick6 = Bricks(VIRTUAL_WIDTH - 10, 135, 5, 20)
        brick7 = Bricks(VIRTUAL_WIDTH - 10, 160, 5, 20)
        brick8 = Bricks(VIRTUAL_WIDTH - 10, 185, 5, 20)
        brick9 = Bricks(VIRTUAL_WIDTH - 10, 210, 5, 20)
        brickA1 = Bricks(VIRTUAL_WIDTH - 25, 10, 5, 20)
        brickA2 = Bricks(VIRTUAL_WIDTH - 25, 35, 5, 20)
        brickA3 = Bricks(VIRTUAL_WIDTH - 25, 60, 5, 20)
        brickA4 = Bricks(VIRTUAL_WIDTH - 25, 85, 5, 20)
        brickA5 = Bricks(VIRTUAL_WIDTH - 25, 110, 5, 20)
        brickA6 = Bricks(VIRTUAL_WIDTH - 25, 135, 5, 20)
        brickA7 = Bricks(VIRTUAL_WIDTH - 25, 160, 5, 20)
        brickA8 = Bricks(VIRTUAL_WIDTH - 25, 185, 5, 20)
        brickA9 = Bricks(VIRTUAL_WIDTH - 25, 210, 5, 20)
        brickB1 = Bricks(VIRTUAL_WIDTH - 40, 10, 5, 20)
        brickB2 = Bricks(VIRTUAL_WIDTH - 40, 35, 5, 20)
        brickB3 = Bricks(VIRTUAL_WIDTH - 40, 60, 5, 20)
        brickB4 = Bricks(VIRTUAL_WIDTH - 40, 85, 5, 20)
        brickB5 = Bricks(VIRTUAL_WIDTH - 40, 110, 5, 20)
        brickB6 = Bricks(VIRTUAL_WIDTH - 40, 135, 5, 20)
        brickB7 = Bricks(VIRTUAL_WIDTH - 40, 160, 5, 20)
        brickB8 = Bricks(VIRTUAL_WIDTH - 40, 185, 5, 20)
        brickB9 = Bricks(VIRTUAL_WIDTH - 40, 210, 5, 20)
        brickC1 = Bricks(VIRTUAL_WIDTH - 55, 10, 5, 20)
        brickC2 = Bricks(VIRTUAL_WIDTH - 55, 35, 5, 20)
        brickC3 = Bricks(VIRTUAL_WIDTH - 55, 60, 5, 20)
        brickC4 = Bricks(VIRTUAL_WIDTH - 55, 85, 5, 20)
        brickC5 = Bricks(VIRTUAL_WIDTH - 55, 110, 5, 20)
        brickC6 = Bricks(VIRTUAL_WIDTH - 55, 135, 5, 20)
        brickC7 = Bricks(VIRTUAL_WIDTH - 55, 160, 5, 20)
        brickC8 = Bricks(VIRTUAL_WIDTH - 55, 185, 5, 20)
        brickC9 = Bricks(VIRTUAL_WIDTH - 55, 210, 5, 20)
        brickD1 = Bricks(VIRTUAL_WIDTH - 70, 10, 5, 20)
        brickD2 = Bricks(VIRTUAL_WIDTH - 70, 35, 5, 20)
        brickD3 = Bricks(VIRTUAL_WIDTH - 70, 60, 5, 20)
        brickD4 = Bricks(VIRTUAL_WIDTH - 70, 85, 5, 20)
        brickD5 = Bricks(VIRTUAL_WIDTH - 70, 110, 5, 20)
        brickD6 = Bricks(VIRTUAL_WIDTH - 70, 135, 5, 20)
        brickD7 = Bricks(VIRTUAL_WIDTH - 70, 160, 5, 20)
        brickD8 = Bricks(VIRTUAL_WIDTH - 70, 185, 5, 20)
        brickD9 = Bricks(VIRTUAL_WIDTH - 70, 210, 5, 20)
    end

    if gameState == 'play' then
        ball:update(dt)
    end

    if player1Score > 44 then
        gameState = 'victory'
   end

    if ball.x <= 0 then
        player1Lives = player1Lives - 1
        servingPlayer = 1
        sounds['loselife']:play()
        ball:reset()
        ball.dx = -200

       gameState = 'serve'

        if player1Lives < 0 then
            gameState = 'failure'
        else
            gameState = 'serve'
        end
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'serve'
        elseif gameState == 'victory' then
            sounds['victory']:play()
            gameState = 'start'
            player1Lives = 5
            player1Score = 0
        elseif gameState == 'failure' then
            sounds['failure']:play()
            gameState = 'start'
            player1Lives = 5
            player1Score = 0
        elseif gameState == 'serve' then
            gameState = 'play'
        end
    end

        --Madi Code--
    if key == 'm' then
        player1Lives = player1Lives + 1
    end
end

function love.draw()
    push:apply('start')

    love.graphics.clear(4 / 255, 5 / 255, 33 / 255, 180 / 255)

    love.graphics.setFont(smallFont)

    love.graphics.setColor(168 / 255, 79 / 255, 27 / 255, 255 / 255)

    if gameState == 'start' then
        love.graphics.setFont(victoryFont)
        love.graphics.printf("Welcome to Breakdown!", 0, 10, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(smallFont)
        love.graphics.printf("Press Enter to Play!", 0, 32, VIRTUAL_WIDTH, 'center')
        love.graphics.printf("Created by Ethan Vetter", 162, VIRTUAL_HEIGHT - 9, VIRTUAL_WIDTH, 'center')
    elseif gameState == 'serve' then
        love.graphics.printf("Hold W or the Up Arrow to go up!", 0, 8, VIRTUAL_WIDTH, 'center')
        love.graphics.printf("Hold S or the Down Arrow to go down!", 0, 18, VIRTUAL_WIDTH, 'center')
        love.graphics.printf("Press Enter to Serve!", 0, 32, VIRTUAL_WIDTH, 'center')
    elseif gameState == 'victory' then
        love.graphics.setFont(victoryFont)
        love.graphics.printf("You win!", 0, 10, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(smallFont)
        love.graphics.printf("Thank You for Playing!", 0, 32, VIRTUAL_WIDTH, 'center')
    elseif gameState == 'failure' then
        love.graphics.setFont(victoryFont)
        love.graphics.printf("You lose!", 0, 10, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(smallFont)
        love.graphics.printf("Try Again!", 0, 32, VIRTUAL_WIDTH, 'center')
    elseif gameState == 'play' then

    end

    if player1Lives > -1 then
        love.graphics.print('Lives Left: ' .. tostring(player1Lives) , 15, VIRTUAL_HEIGHT - 9 )
    elseif player1Lives < -1 then
        love.graphics.print("" , 15, VIRTUAL_HEIGHT - 9 )

    end
    
    player1:render()
    ball:render()

    brick1:render()
    brick2:render()
    brick3:render()
    brick4:render()
    brick5:render()
    brick6:render()
    brick7:render()
    brick8:render()
    brick9:render()
    brickA1:render()
    brickA2:render()
    brickA3:render()
    brickA4:render()
    brickA5:render()
    brickA6:render()
    brickA7:render()
    brickA8:render()
    brickA9:render()
    brickB1:render()
    brickB2:render()
    brickB3:render()
    brickB4:render()
    brickB5:render()
    brickB6:render()
    brickB7:render()
    brickB8:render()
    brickB9:render()
    brickC1:render()
    brickC2:render()
    brickC3:render()
    brickC4:render()
    brickC5:render()
    brickC6:render()
    brickC7:render()
    brickC8:render()
    brickC9:render()
    brickD1:render()
    brickD2:render()
    brickD3:render()
    brickD4:render()
    brickD5:render()
    brickD6:render()
    brickD7:render()
    brickD8:render()
    brickD9:render()

    push:apply('end')
end