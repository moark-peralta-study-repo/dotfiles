do
  local help = require("lazy.help")
  local orig_add = help.add

  help.add = function(spec, plugin)
    local doc = plugin.dir .. "/doc"
    if vim.fn.isdirectory(doc) == 0 then
      return -- skip plugins without docs
    end
    return orig_add(spec, plugin)
  end
end
