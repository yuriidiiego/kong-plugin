local typedefs = require "kong.db.schema.typedefs"
local schema = {
  name = "plugin-token",
  fields = {
    {protocols = typedefs.protocols_http},
    {
      config = {
        type = "record",
        fields = {
          {endpoint_obter_token = typedefs.url({required = true})}
        }
      }
    }
  }
}
return schema
