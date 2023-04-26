local status_ok, git = pcall(require, "git")
if not status_ok then
	return
end

git.setup()
