# Trae 平台

入口模板目录：

- `../../templates/trae-godot-project`

安装命令示例：

```powershell
./installers/powershell/install-workflow.ps1 -Platform trae -ProjectPath D:\Games\MyGodotProject
```

安装后你会得到：

- `AGENTS.md`
- `docs/trae/prompts/*`
- `docs/trae/*`
- `docs/nightly/tasks/nightly-task.template.md`

安装后先做：

1. 打开 `docs/trae/README.zh-CN.md`
2. 运行 smoke test

smoke test 入口：

- `../../smoke-tests/trae/README.zh-CN.md`
