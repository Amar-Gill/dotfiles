local status, rose_pine = pcall(require, "rose-pine")
if not status then
	return
end

rose_pine.setup({
	dark_variant = "main",
	groups = {
		git_change = "gold",
		git_add = "pine",
	},
})
