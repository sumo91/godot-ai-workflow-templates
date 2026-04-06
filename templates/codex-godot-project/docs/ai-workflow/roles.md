# Roles

## `design`

用于新功能、行为变化、需求还不清楚的时候。  
目标是收敛最小 spec，不直接跳进实现。

## `planning`

用于把已批准的 spec 拆成 task packet。  
每个 task packet 都应明确 files、validation、done criteria。

## `implementation`

用于执行文件边界明确、风险清楚的小任务。  
如果中途进入共享高风险文件，回到主会话。

## `validation`

用于验证证据，而不是凭感觉判断“应该好了”。

## `review`

用于检查回归风险、spec 漂移、维护性和缺失验证。

## `asset-integration`

用于资源接线、UI 接线、动画和音频接线，但不负责改核心玩法逻辑。
