# Trae Practical Guide

最推荐的日常模式是：

1. 主线程做 orchestrator
2. 复杂任务切 role thread
3. 高风险共享文件回到主线程

优先入口：

- `prompts/main-orchestrator.prompt.md`
- `prompts/role-thread.prompt.md`
- `prompts/nightly-handoff.prompt.md`
