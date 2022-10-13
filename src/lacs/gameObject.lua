local path = (...):gsub("[^/.\\]+$", "")

local Context = require((...):gsub("[^/.\\]+$", "context"))

local GameObj = {}

---comment
---@param dt number
function GameObj:update(dt)
    for index, comp in ipairs(self.componentList) do
        comp:_update(self.ctx, dt)
    end
end

---comment
function GameObj:draw()
    for index, comp in ipairs(self.componentList) do
        comp:_draw(self.ctx)
    end
end

---comment
---@param ... unknown
---@return table
function GameObj.new(...)
    local obj = {}

    obj.componentList = {}
    for i = 1, select("#", ...) do
        local comp = select(i, ...)
        
        obj.ctx = Context(obj.componentList)
        comp:_init(obj.ctx)

        obj.componentList[i] = comp
    end

    return setmetatable(obj, {
        __index = GameObj
    })
end

return GameObj
