# 线程与会话

推荐模式：

- 主会话负责 orchestrator
- 子线程负责 design / planning / implementation / validation / review
- 高风险共享文件回到主会话
