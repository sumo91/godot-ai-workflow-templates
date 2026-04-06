# 快速开始

这个仓库的目标是：

**把 Godot 多 Agent 工作流安装到你自己的项目里，而不是绑定某一台机器。**

## 3 步开始

1. 选择平台：
   `Claude` / `Codex` / `Cursor` / `Trae`
2. 运行安装脚本，把对应 starter 铺到你的项目目录
3. 打开项目并执行对应平台的 smoke test

PowerShell 示例：

```powershell
./installers/powershell/install-workflow.ps1 -Platform codex -ProjectPath D:\Games\MyGodotProject
```

Bash 示例：

```bash
./installers/bash/install-workflow.sh codex /path/to/MyGodotProject
```

## 目录入口

- 共享核心：`../../core`
- 平台模板：`../../templates`
- 安装脚本：`../../installers`
- 平台说明：`../platforms`
- 冒烟测试：`../../smoke-tests`

如果你刚安装完，优先打开：

- `../platforms/<platform>.zh-CN.md`
- `../../smoke-tests/<platform>/README.zh-CN.md`

## 重要边界

这个仓库不包含：

- 你的私有 API
- 你的认证文件
- 你的本机 Godot 路径
- 你的个人工具 home 目录配置

这些都应留在你的本机环境里。
