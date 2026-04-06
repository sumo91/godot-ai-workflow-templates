# OpenCode 平台

入口模板目录：

- `../../templates/opencode-godot-project`

安装命令示例：

```powershell
./installers/powershell/install-workflow.ps1 -Platform opencode -ProjectPath D:\Games\MyGodotProject
```

```bash
./installers/bash/install-workflow.sh opencode /path/to/MyGodotProject
```

安装后你会得到：

- `AGENTS.md`
- `.opencode/agents/*`
- `.opencode/commands/*`
- `docs/opencode/*`
- `docs/nightly/tasks/nightly-task.template.md`

安装后先做：

1. 打开 `docs/opencode/README.zh-CN.md`
2. 运行 smoke test

smoke test 入口：

- `../../smoke-tests/opencode/README.zh-CN.md`
