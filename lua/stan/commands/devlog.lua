local function write(file, msg)
  local log_path = vim.fn.expand(file)
  local fd = io.open(log_path, "a")
  if fd then
    fd:write(msg)
    fd:close()
  else
    vim.notify("Unable to open " .. log_path, vim.log.levels.ERROR)
  end
end

local function edit_split(file, msg)
  local window = vim.api.nvim_get_current_win()
  local height = vim.api.nvim_win_get_height(window)
  local target_height = math.floor(height * 0.33)

  vim.cmd('belowright split')
  vim.cmd('resize ' .. target_height)
  vim.cmd('edit ' .. file)
  vim.cmd('normal! GG')

  vim.fn.setreg('z', msg)
  vim.cmd('normal! "zpGGk')
end

-- ------------------------------------------------------------------
-- :Note <message>
--   Append a formatted entry to ~/.devlog:
--      [yyyy-MM-dd hh:mm] /path/to/file@line
--      > line contents
--      <message>
-- ------------------------------------------------------------------
local function write_devlog(msg)
  local timestamp = os.date('[%Y-%m-%d %H:%M]')

  local file = vim.api.nvim_buf_get_name(0)
  if file == '' then file = '[No file]' end

  local lnum = vim.fn.line('.')
  local line_text = vim.fn.getline('.')

  local entry = string.format(
    "%s %s@%d\n> %s\n%s\n\n",
    timestamp, file, lnum, line_text, msg
  )

  local devlog = '~/.devlog'
  if #msg == 0 then
      edit_split(devlog, entry)
  else
      write(devlog, entry)
  end

end

-- Create the command
vim.api.nvim_create_user_command('Note', function(opts)
  write_devlog(opts.args)
end, { nargs = '*', desc = 'Append a devlog entry' })
