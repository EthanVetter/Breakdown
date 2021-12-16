Bricks = Class{}

function Bricks:init(x, y , width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.dy = 0
end

function Bricks:collide(box)
    if self.x > box.x + box.width or self.x + self.width < box.x then
        return false
    end

    if self.y > box.y + box.height or self.y + self.height < box.y then
        return false
    end
    
    return true
end

function Bricks:reset()
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.dy = 0
end

function Bricks:update(dt)
    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
    elseif self.dy > 0 then
        self.y = math.min(VIRTUAL_HEIGHT - 20, self.y + self.dy * dt)
    end
end

function Bricks:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end