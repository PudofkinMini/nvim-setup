local neotest = require 'neotest'

local function init()
  neotest.setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
    require("neotest-go"),
  },
  })
end

return {
  init = init,
}
