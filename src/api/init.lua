-- lapis
local lapis = require('lapis')
local json_params = require('lapis.application').json_params

-- fs
local lfs = require('lfs')

local api = {
  app = lapis.Application()
}

function api.init(self)
  versionDir = './endpoints'
  package.path = package.path .. ';' .. versionDir .. '/?.lua'
  for version in lfs.dir(versionDir) do
    moduleDir = versionDir .. '/' .. version
    if version ~= '.' and version ~= '..' and lfs.attributes(moduleDir, 'mode') == 'directory' then
      for endpoint in lfs.dir(moduleDir) do
        moduleFile = moduleDir .. '/' .. endpoint
        if endpoint ~= '.' and endpoint ~= '..' and lfs.attributes(moduleFile, 'mode') == 'file' then
          blueprint = require(version .. '.' .. string.gsub(endpoint, '.lua', ''))

          for _, ctx in pairs(blueprint.get or {}) do
            api.app:get(
              '/' .. version .. '/' .. string.gsub(endpoint, '.lua', '') .. ctx.context,
              json_params(function(self) return ctx:call(self.params) end)
            )
          end

          for _, ctx in pairs(blueprint.post or {}) do
            api.app:post(
              '/' .. version .. '/' .. string.gsub(endpoint, '.lua', '') .. ctx.context,
              json_params(function(self) return ctx:call(self.params) end)
            )
          end
        end
      end
    end
  end
end

return api
