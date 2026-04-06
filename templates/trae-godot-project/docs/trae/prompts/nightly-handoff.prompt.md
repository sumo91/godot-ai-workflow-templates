请把这次夜间 / 异步执行结果整理成主线程可直接接管的 handoff。

必须包含：

- `Outcome`
- `Files Changed`
- `Validation Performed`
- `Open Risks`
- `Suggested First Step For Tomorrow`

补充要求：

- 如果触到了共享高风险文件，必须明确标出
- 如果验证不完整，必须明确写出未验证部分
- 如果建议继续做，请先说明是否需要回到主线程整合
