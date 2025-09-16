-- Function to reverse the order of paragraphs in the selected lines
function ReverseParagraphs(opts)

  local start_line, end_line
  print("Range opts", opts.line1, opts.line2, opts.range)
  if opts.range == 2 then
      start_line = opts.line1
      end_line = opts.line2
  else
      start_line = 1
      end_line = vim.fn.line("$")
  end

  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local paragraphs = {}
  local current_paragraph = {}

  -- Parse lines into paragraphs
  for _, line in ipairs(lines) do
    if line:match("^%s*$") then
      if #current_paragraph > 0 then
        table.insert(paragraphs, current_paragraph)
        current_paragraph = {}
      end
    else
      table.insert(current_paragraph, line)
    end
  end

  -- Add the last paragraph if there's no empty line below it
  if #current_paragraph > 0 then
    table.insert(paragraphs, current_paragraph)
  end

 -- Reverse the order of paragraphs
  for i = 1, math.floor(#paragraphs / 2) do
    paragraphs[i], paragraphs[#paragraphs - i + 1] = paragraphs[#paragraphs - i + 1], paragraphs[i]
  end

  -- Flatten paragraphs back into lines with empty lines between them
  local result = {}
  for _, paragraph in ipairs(paragraphs) do
    for _, line in ipairs(paragraph) do
      table.insert(result, line)
    end

    table.insert(result, "")
  end

  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, result)
end

vim.api.nvim_create_user_command('ReverseParagraphs', ReverseParagraphs, {range = true})

