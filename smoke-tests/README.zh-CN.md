# 冒烟测试总览

安装任一平台 starter 后，建议马上执行对应平台的第一轮 smoke test。

入口：

- `claude/README.zh-CN.md`
- `codex/README.zh-CN.md`
- `cursor/README.zh-CN.md`
- `trae/README.zh-CN.md`

第一轮 smoke test 的目标不是测“能不能写完整功能”，而是测：

1. 平台是否真的读懂项目级工作流
2. 是否会主动识别高风险共享文件
3. 是否会先给 spec / task packet
4. 是否会回到 validation / review
