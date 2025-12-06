--debugger setup
require('dap-cs').setup()

-- Automatically build before debugging
dap.listeners.before['event_initialized']['build_before_debug'] = function(session, body)
    print("Building project before debugging...")
    local result = vim.fn.system("dotnet build -c Debug")
    print(result)
end
