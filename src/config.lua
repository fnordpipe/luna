local io = require('io')

local config = {}
local configFile = '/etc/luna/config.lua'
local fh = io.open(configFile, 'r')

if fh then
  fh:close()
  config = dofile(configFile)
else
  config = {
    endpoints = './endpoints'
  }
end

return config
