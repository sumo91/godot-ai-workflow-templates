# OpenCode 项目内 Smoke Test

1. 确认根目录存在 `AGENTS.md`
2. 确认项目内存在 `.opencode/agents/` 与 `.opencode/commands/`
3. 在 OpenCode 中打开项目目录
4. 先让它总结当前项目工作流
5. 再执行一次 `/feature`，只要求输出 spec 和 task packets
6. 再执行一次 `/validate-feature`，看它是否强调“先验证再宣称完成”
