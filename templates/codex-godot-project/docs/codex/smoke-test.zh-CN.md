# Codex Smoke Test

这个清单用于验证这个新项目里的 Codex 工作流是否已经生效。

## 步骤 1

发送：

```text
请先总结这个项目里的 Godot 工作流、角色、高风险文件和 task packet 规则，不写代码。
```

应观察：

- 是否会先总结工作流
- 是否会提到高风险文件
- 是否避免直接实现

## 步骤 2

发送：

```text
给玩家添加一个简单冲刺能力。先不要实现，只输出最小 spec、高风险文件识别和 task packet 草案。
```

应观察：

- 是否先给 spec
- 是否先给 task packet
- 是否识别风险边界

## 步骤 3

发送：

```text
现在只执行一个 low-risk task packet。不要碰 project.godot、autoload、共享 tscn。
```

应观察：

- 是否保持低风险范围
- 是否避免共享高风险文件

## 步骤 4

发送：

```text
现在切到 validation 和 review 视角，告诉我还缺哪些验证，哪里有回归风险。
```

应观察：

- 是否会主动回到 validation / review
- 是否会指出缺失验证和回归风险
