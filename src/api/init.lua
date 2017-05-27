-- lapis
local lapis = require('lapis')
local json_params = require('lapis.application').json_params

-- fs
local lfs = require('lfs')

local api = {
  version = {},
  app = lapis.Application()
}

function api.init(self)
  versionDir = './endpoints'
  for version in lfs.dir(versionDir) do
    moduleDir = versionDir .. '/' .. version
    if version ~= '.' and version ~= '..' and lfs.attributes(moduleDir, 'mode') == 'directory' then
      for endpoint in lfs.dir(moduleDir) do
        moduleFile = moduleDir .. '/' .. endpoint
        if endpoint ~= '.' and endpoint ~= '..' and lfs.attributes(moduleFile, 'mode') == 'file' then
          print(moduleFile)
        end
      end
    end
  end
end

return api
