# Claude 平台

入口模板目录：

- `../../templates/claude-godot-project`

安装命令示例：

```powershell
./installers/powershell/install-workflow.ps1 -Platform claude -ProjectPath D:\Games\MyGodotProject
```

安装后你会得到：

- `CLAUDE.md`
- `AGENTS.md`
- `.claude/agents`
- `.claude/commands`
- `docs/claude/*`
- `docs/nightly/tasks/nightly-task.template.md`

安装后先做：

1. 打开 `docs/claude/README.zh-CN.md`
2. 运行 smoke test

smoke test 入口：

- `../../smoke-tests/claude/README.zh-CN.md`
