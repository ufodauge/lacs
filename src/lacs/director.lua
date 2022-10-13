local Director = {}

---comment
---@param gameObj any
function Director:add(gameObj)
    self.instanceList[#self.instanceList + 1] = gameObj
end

---comment
---@param dt any
function Director:update(dt)
    for i = 1, #self.instanceList do
        self.instanceList[i]:update(dt)
    end
end

---comment
function Director:draw()
    for i = 1, #self.instanceList do
        self.instanceList[i]:draw()
    end
end

---comment
---@return table
function Director.new()
    local obj = {}

    obj.instanceList = {}

    return setmetatable(obj, {
        __index = Director
    })
end

return Director
