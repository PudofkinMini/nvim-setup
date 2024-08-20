local gen = require 'gen'

local function set_keymap()
    vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')
end

local function init()
	set_keymap()
	gen.setup(
        {
                "David-Kunz/gen.nvim",
        model = "pxlksr/opencodeinterpreter-ds", -- The default model to use.
        host = "192.168.1.41", -- The host running the Ollama service.
        port = "11434", -- The port on which the Ollama service is listening.
        quit_map = "q", -- set keymap for close the response window
        retry_map = "<c-r>", -- set keymap to re-send the current prompt
        init = function(options) end,
        -- Function to initialize Ollama
        command = function(options)
            local body = {model = options.model, stream = true}
            return "curl --silent --no-buffer -X POST http://192.168.1.43:11434/api/chat -d $body"
        end,
        -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
        -- This can also be a command string.
        -- The executed command must return a JSON object with { response, context }
        -- (context property is optional).
        -- list_models = '<omitted lua function>', -- Retrieves a list of model names
        display_mode = "float", -- The display mode. Can be "float" or "split".
        show_prompt = false, -- Shows the prompt submitted to Ollama.
        show_model = true, -- Displays which model you are using at the beginning of your chat session.
        no_auto_close = false, -- Never closes the window automatically.
        debug = false -- Prints errors and the command which is run.
	})
  gen.prompts['Elaborate_Text'] = {
    prompt = "Elaborate the following text:\n$text",
    replace = true
  }
  gen.prompts['Explain_Code'] = {
    prompt = "Explain the following code. The filetype is $filetype and I am certian of this, the code is ```$text```",
  }
  gen.prompts['Fix_Code'] = {
    prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    replace = true,
    extract = "```$filetype\n(.-)```"
  }
end

return {
	init = init,
}
