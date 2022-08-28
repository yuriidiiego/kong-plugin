local http = require "resty.http"
local cjson = require "cjson"
local _M = {}
local token
local function gerarToken(conf, usuario, senha)
  local httpc = http:new()
  local res, err =
    httpc:request_uri(
    conf.endpoint_obter_token,
    {
      method = "POST",
      ssl_verify = false,
      body = '{ "usuario":"' .. usuario .. '", "senha":"' .. senha .. '"}',
      headers = {["Content-Type"] = "application/json"}
    }
  )
  token = cjson.decode(res.body).token
  if not res then
    kong.log.err("failed to call authorization endpoint: ", err)
    return kong.response.exit(500)
  end
  if res.status ~= 200 then
    kong.log.err("authorization endpoint responded with status: ", res.status)
    return kong.response.exit(res.status)
  end
  return true
end

function _M.run(conf)
  local usuario_body = kong.request.get_headers()["usuario"]
  local senha_body = kong.request.get_headers()["senha"]
  gerarToken(conf, usuario_body, senha_body)
  kong.service.request.set_header("Authorization", "Bearer " .. token)
  kong.service.request.clear_header("usuario")
  kong.service.request.clear_header("senha")
end
return _M
