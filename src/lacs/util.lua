---mainly return a copied table
---@param orig any
---@return any
local function deepcopy(orig)
    local origType = type(orig)
    local copy = nil

    if origType == 'table' then
        copy = {}
        
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end

        setmetatable(copy, deepcopy(getmetatable(orig)))
    else
        -- number, string, boolean, etc
        copy = orig
    end

    return copy
end


local _depth = 0
---dump table structure
---@param orig any
---@return string
local function dump(orig)
    if type(orig) == "table" then

        -- local result = ("\n%s{"):format(string.rep(" ", _depth * 2))
        local result = "{"
        _depth = _depth + 1

        for key, value in pairs(orig) do
            if type(key) ~= "number" then key = "'" .. key .. "'" end
            result = result .. ("\n%s[%s] = %s,"):format(
                string.rep(" ", _depth * 2),
                key,
                dump(value))
        end

        _depth = _depth - 1
        return result .. ("\b\n%s}"):format(string.rep(" ", _depth * 2))

    else

        return tostring(orig)

    end
end

local util = {
    deepcopy = deepcopy,
    dump = dump
}

return util
