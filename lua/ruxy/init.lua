local function init()
  require 'ruxy.set'.init()
  require 'ruxy.languages'.init()
  require 'ruxy.colors'.init()
  require 'ruxy.remap'.init()
  require 'ruxy.telescope'.init()
  require 'ruxy.neotest'.init()
  --    require 'ruxy.latex'.init()
  --    require 'ruxy.harpoon'.init()
  require 'ruxy.ollama'.init()
end
return {
  init = init,
}
