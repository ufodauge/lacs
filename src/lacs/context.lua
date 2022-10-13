local Context = {}

---return component of the instance
---@param Component any
---@return unknown
function Context:getComponent(Component)
    for i = 1, #self.compList do
        if self.compList[i]._tag == Component._tag then
            return self.compList[Component._tag]
        end
    end

    error(("there's no component of tag '%d'"):format(Component._tag))
end

---@param compList table
---@return table
function Context.new(compList)
    local obj = {}

    obj.compList = compList

    return setmetatable(obj, { __index = Context })
end

return setmetatable(Context, {
    __call = function (t, compList)
        return Context.new(compList)
    end
})
