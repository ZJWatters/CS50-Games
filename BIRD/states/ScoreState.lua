--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]

local gold = love.graphics.newImage('gold.png')
local silver = love.graphics.newImage('silver.png')
local bronze = love.graphics.newImage('bronze.png')

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    -- awarded medals based on players score
    love.graphics.setFont(smallFont)
    if self.score >= 30 then
        love.graphics.draw(gold, VIRTUAL_WIDTH/2 - 25, 130)
        love.graphics.printf('You earned a Gold medal!', 0, 195, VIRTUAL_WIDTH, 'center') 
    elseif self.score >= 20 then
        love.graphics.draw(silver, VIRTUAL_WIDTH/2 - 25, 130)
        love.graphics.printf('You earned a Silver medal!', 0, 195, VIRTUAL_WIDTH, 'center') 
    elseif self.score >= 10 then
        love.graphics.draw(bronze, VIRTUAL_WIDTH/2 - 25, 130)
        love.graphics.printf('You earned a Bronze medal!', 0, 195, VIRTUAL_WIDTH, 'center') 
    else 
        love.graphics.printf('You are TRASH!', 0, 140, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter to Play Again!', 0, 220, VIRTUAL_WIDTH, 'center')


end