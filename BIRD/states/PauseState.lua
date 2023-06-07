-- PauseState created by Zack Watters


PauseState = Class{__includes = BaseState}

function PauseState:enter(Bird, Pipes, Score)
    scrolling = false
    self.bird = Bird
    self.pipePairs = Pipes
    self.score = Score
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
        gStateMachine:stateUnPause()
    end
end

function PauseState:render()
    -- render current pipes
    for k, pair in pairs(self.pipePairs) do
        pair:render()
    end

    -- render current bird position
    self.bird:render()

    -- render current score and pause messages
    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)
    love.graphics.printf('Game Paused', 0, 50, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press p to continue', 0, 100, VIRTUAL_WIDTH, 'center')

end