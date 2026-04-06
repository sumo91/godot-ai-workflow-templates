# OpenCode Smoke Test

1. 打开已安装 starter 的项目目录
2. 让 OpenCode 总结当前项目工作流
3. 执行一次 `/feature`，只要求 spec 和 task packet
4. 再调用 `@validation` 或 `/validate-feature`
5. 确认它会把高风险共享文件留在主线程
