local count = 0

for _, d in ipairs(vim.diagnostic.get(nil)) do
  count = count + 1
end

print('Count: ' .. count)
