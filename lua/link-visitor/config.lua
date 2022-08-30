local M = {}

local uname = vim.loop.os_uname()
local os = uname.sysname
local open_cmd
if os == "Darwin" then
	open_cmd = "open"
elseif os:find("Windows") or (os == "Linux" and uname.release:lower():find("microsoft")) then
	open_cmd = 'cmd.exe /c start ""'
else
	open_cmd = "xdg-open"
end

local config = {
	ask_for_confirmation = true,
	open_cmd = open_cmd,
	silent = false,
}

function M.set(opts)
	config = vim.tbl_extend("force", config, opts or {})
end

return setmetatable(M, {
	__index = function(_, k)
		return config[k]
	end,
})
