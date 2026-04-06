# Godot AI 工作流模板

[English README](./README.md) | [快速开始](./docs/quickstart/README.zh-CN.md)

一套面向 Godot 开发的、多 Agent 协作工作流模板，支持 Claude Code、Codex、Cursor 和 Trae。

这个仓库的目标不是替你维护某台机器上的个人配置，而是把 AI 工作流安装到你自己的 Godot 项目里，让它能被分享、迁移和长期复用。

仓库地址：

- `https://github.com/sumo91/godot-ai-workflow-templates`

## 这个仓库解决什么问题

- 为新的或已有的 Godot 项目快速铺设多 Agent 开发流程
- 把工作流文件放进项目目录，而不是锁死在个人本机环境
- 通过共享核心和平台适配层，同时支持多种 AI 编码工具
- 提供夜间任务、会话分工、评审校验、安装后冒烟测试等基础能力

## 仓库包含什么

- 共享工作流核心
- 各平台项目 starter 模板
- Prompt 与交接模板
- PowerShell 与 bash 安装脚本
- 冒烟测试说明
- 夜间自动化工作流说明
- session / thread 组织说明

## 支持的平台

| 平台 | Starter 目录 | 主要说明文档 |
| --- | --- | --- |
| Claude Code | `templates/claude-godot-project` | `docs/platforms/claude.zh-CN.md` |
| Codex | `templates/codex-godot-project` | `docs/platforms/codex.zh-CN.md` |
| Cursor | `templates/cursor-godot-project` | `docs/platforms/cursor.zh-CN.md` |
| Trae | `templates/trae-godot-project` | `docs/platforms/trae.zh-CN.md` |

## 3 步快速开始

1. 选择平台：`claude`、`codex`、`cursor` 或 `trae`
2. 运行安装脚本，把对应 starter 安装到你的 Godot 项目目录
3. 用对应工具打开项目，并先执行匹配的 smoke test

Windows 双击安装入口：

```text
installers\powershell\install-workflow.cmd
```

macOS 双击安装入口：

```text
installers/bash/install-workflow.command
```

Linux 或终端友好入口：

```text
./installers/bash/launch-install-workflow.sh
```

PowerShell 示例：

```powershell
./installers/powershell/install-workflow.ps1 -Platform codex -ProjectPath D:\Games\MyGodotProject
```

Bash 示例：

```bash
./installers/bash/install-workflow.sh codex /path/to/MyGodotProject
```

详细安装说明：

- 英文：`docs/quickstart/README.en.md`
- 中文：`docs/quickstart/README.zh-CN.md`

## 仓库结构

- `core/` 共享角色定义、工作流规则与核心说明
- `templates/` 各平台的项目内模板
- `installers/` 把模板安装进项目的脚本
- `docs/` 快速开始、概念说明与平台指南
- `smoke-tests/` 安装后验证清单

## 设计原则

- 共享核心，平台适配尽量保持轻量
- 优先项目内工作流文件，而不是依赖本机私有配置
- 夜间开发以任务文件驱动
- 高风险 Godot 集成操作尽量保留在主会话执行

## 边界与非目标

这个仓库不包含：

- 私有 API 地址
- 认证文件或 token
- 机器绑定的 Godot 路径
- 个人 `.codex`、`.claude` 或其他工具 home 配置
- 可直接运行的完整游戏项目模板

这些内容应保留在每位用户自己的本机环境或具体游戏仓库中。

## 文档入口

- 快速开始：`docs/quickstart/`
- 平台文档：`docs/platforms/`
- 核心概念：`docs/concepts/`
- 冒烟测试：`smoke-tests/`

## 参与贡献

提交 PR 之前请先阅读 `CONTRIBUTING.md`。

## 社区与规范

- `CODE_OF_CONDUCT.md`
- `SECURITY.md`
- `LICENSE`
