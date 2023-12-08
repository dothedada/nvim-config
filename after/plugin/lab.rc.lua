local status, lab = pcall(require, 'lab')
if (not status) then return end

lab.setup {
  code_runner = {
    enabled = true,
  },
  quick_data = {
    enabled = true,
  }
}
