local io = require('io')

local _configFile = '/etc/luna/rc.lua'
local config = {}
local fh = io.open(_configFile, 'r')

if fh then
  fh:close()
  config = dofile(_configFile)
else
  config = {
    endpoints = '/var/lib/luna/endpoints'
  }
end

return config
