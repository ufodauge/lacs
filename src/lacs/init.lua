local path = (...):gsub("[^/.\\]+$", "lacs")

local lacs = {
    newComponent  = require(path .. ".component").new,
    newGameObject = require(path .. ".gameObject").new,
    newDirector   = require(path .. ".director").new
}

return lacs
