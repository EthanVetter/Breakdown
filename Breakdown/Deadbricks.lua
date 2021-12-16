Deadbricks = Class{}

function Deadbricks:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end

function Bricks:update(dt)
    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
    elseif self.dy > 0 then
        self.y = math.min(VIRTUAL_HEIGHT - 20, self.y + self.dy * dt)
    end
end

function Deadbricks:render()

    love.graphics.rectangle(self.x, self.y, 5, 20)

end