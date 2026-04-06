# Workflows

## 默认主流程

1. 主会话接任务
2. `design` 收敛 spec
3. `planning` 拆 task packet
4. `implementation` 执行低冲突任务
5. `validation` 验证
6. `review` 审查
7. 主会话做共享文件整合和最终决策

## 高风险共享文件

这些默认留在主会话：

- `project.godot`
- `autoload/*`
- 共享 `.tscn`
- 核心玩家脚本
- 共享状态和事件基础设施

## 夜间原则

夜间任务必须：

- task-file 驱动
- 明确 allowed files
- 明确 forbidden files
- 明确 validation
- 留下 handoff
