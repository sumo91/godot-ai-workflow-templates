# OpenCode 实战指南

最推荐的日常模式是：

1. 主线程做 orchestrator
2. 先用 `/feature` 或 `/bugfix` 定工作流入口
3. 需要拆角色时，调用 `@design`、`@planning`、`@implementation`、`@validation`、`@review`
4. 高风险共享 Godot 文件回到主线程

优先入口：

- `/feature`
- `/bugfix`
- `/godot-plan`
- `/godot-review`
- `/validate-feature`

原生 agent 入口：

- `@design`
- `@planning`
- `@implementation`
- `@validation`
- `@review`
- `@asset-integration`
