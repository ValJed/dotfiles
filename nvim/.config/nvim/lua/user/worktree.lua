require("git-worktree").setup()

local status_telescope, telescope = pcall(require, "telescope")
if status_telescope then
	telescope.load_extension("git_worktree")
end
