local lacs = require("src.lacs")

local Position = lacs.newComponent({
    x = 0, y = 0
})

function Position:init(ctx)
    print(self.x, self.y)
end

function Position:update()
end

local Velocity = lacs.newComponent({
    x = 0, y = 0
})

function Velocity:init(ctx)
    local pos = ctx:getComponent(Position)

    print(pos.x, pos.y)

    pos.x, pos.y = 100, 200
end

function Velocity:update(ctx, dt)

end

function Velocity:draw(ctx)

end

local Ball = lacs.newGameObject(
    Position({ x = 10, y = 20 }),
    Velocity()
)

local Director = lacs.newDirector()
Director:add(Ball)

function love.update(dt)
    Director:update(dt)
end
