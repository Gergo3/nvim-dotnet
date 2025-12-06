--debugger setup
require('dap-cs').setup(
    dap_configurations = {
        {
            preLaunchTask = function()
                print("Building project before debugging...")
                local result = vim.fn.system("dotnet build -c Debug")
                print(result)
            end,
        },
    }
)
