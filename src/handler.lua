local access = require "kong.plugins.plugin-token.access"
local plugin = {
  PRIORITY = 1000,
  VERSION = "0.1"
}

function plugin:access(plugin_conf)
  kong.log.inspect(plugin_conf)
  access.run(plugin_conf)
end

function plugin:header_filter(plugin_conf)
  kong.header[plugin_conf.response_header] = "Por Yuri | Jonathan"
end
return plugin
