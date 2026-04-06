# Cursor 平台

入口模板目录：

- `../../templates/cursor-godot-project`

安装命令示例：

```powershell
./installers/powershell/install-workflow.ps1 -Platform cursor -ProjectPath D:\Games\MyGodotProject
```

安装后你会得到：

- `AGENTS.md`
- `.cursor/rules`
- `.cursor/commands`
- `.cursor/environment.json`
- `docs/cursor/*`
- `docs/nightly/tasks/nightly-task.template.md`

安装后先做：

1. 打开 `docs/cursor/README.zh-CN.md`
2. 运行 smoke test

smoke test 入口：

- `../../smoke-tests/cursor/README.zh-CN.md`
