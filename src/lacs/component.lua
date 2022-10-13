local util = require((...):gsub("[^/.\\]+$", "util"))

local Component = {}

local registeredComponentsCount = 0

function Component:create(args)
    local comp = util.deepcopy(self.fields)

    if args then
        for key, value in pairs(args) do
            comp[key] = value
        end
    end

    comp._init   = self.init or function() end
    comp._update = self.update or function() end
    comp._draw   = self.draw or function() end

    comp._tag = self._tag

    return comp
end

function Component.new(fields)
    local obj = {}

    obj.fields = fields

    registeredComponentsCount = registeredComponentsCount + 1
    obj._tag = registeredComponentsCount

    return setmetatable(obj, {
        __index = Component,
        __call = function(t, args)
            return obj:create(args)
        end
    })
end

return Component
