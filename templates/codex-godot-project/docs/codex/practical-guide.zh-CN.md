# Codex Practical Guide

## 第一次进入项目

建议先让 Codex：

1. 总结当前项目的工作流
2. 标出高风险共享文件
3. 解释角色模型

如果你想系统地做第一轮验证，再看 `smoke-test.zh-CN.md`。

## 日常模式

最推荐：

1. 主会话先收敛 spec
2. 再拆 task packet
3. 再执行
4. 再 validation
5. 再 review

## 推荐 prompt 入口

最常用的是：

- `prompts/feature.prompt.md`
- `prompts/bugfix.prompt.md`
- `prompts/plan-feature.prompt.md`
- `prompts/validate-feature.prompt.md`
- `prompts/review-feature.prompt.md`
- `prompts/nightly-prepare.prompt.md`
- `prompts/nightly-review.prompt.md`

## 常见坑

- 没有 spec 就开做
- 没有 allowed / forbidden files
- 共享高风险文件直接被下放
- 没验证就说完成
