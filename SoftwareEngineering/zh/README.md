# Software Engineering Organon

本目录包含已采用的软件工程 Organon、配套论证及案例。受管理的哲学保留已审议的 Core 0.1.2 来源。格式检查通过本身不构成哲学采用授权。

[哲学正文](PHILOSOPHY.md)保留 Core 承诺，并增加有可信根据的软件演进应当优先这一可让步的附加立场。[配套论证](rationale/README.md)考察理由、来源、替代方案及反对意见。[构造案例](docs/cases.md)提供可执行示例；[AgentOrganon 架构案例](rationale/architecture-case.md)另行考察真实仓库职责。本中文文本对应[英文权威文本](../README.md)。

哲学版本为 **0.2.0**：增加领域承诺，同时保持已有 Core 承诺的含义、强度与适用范围。`core_version` 保持 **0.1.2**，标识已完整审议的 Core 工作树文本；`format_version` 保持 **0.1.0**。该版本记录已采用的整体；后续改变其含义或适用范围，需要具体决定。

领域优先级是一项附加价值承诺，不是自超越的推论。其主体是持续的人类与 agent 维护活动，范围遵循有可信根据的生命周期条件，并同时包括撤除、迁移与扩展。它不自动优先任何技术范式。

## 阅读与使用

先阅读哲学的承诺与限度，再通过论证考察根据，通过案例查看有边界的可执行示例。论证与案例不增加哲学义务。4.2 优先级以相关必要要求、有可信根据的变更方向和实际生命周期预期为条件；模式名称不能决定设计选择。

操作选用本 Organon 作为已采用基线时，应显式传入本目录对应英文 `PHILOSOPHY.md`，并在委托时保持其真实目录。审查拟议替换时，保持调用方选定的已采用基线，将提案单独作为审查对象传入。集合根目录不能代替领域选择。拟议替换在获得具体采用决定前，仍是审查对象。assess 判断与选定哲学的关系，principled-review 进行结构分析，absorb 审议拟议哲学采用，wording-review 只审查措辞。哲学管理负责文档与 lock 操作。

以 AgentOrganon checkout 为当前目录，可以检查受管理的目标：

```sh
rtk proxy node scripts/check.js AdvisedOrganons/SoftwareEngineering/PHILOSOPHY.md
```

此命令检查受管理的英文哲学及其 lock，不确立哲学正确性，也不授予采用权限。对独立候选作来源检查，应向 `scripts/check.js --source` 传入候选的实际路径。相邻 lock 属于受管理的英文文档；译文遵循英文元数据和 ID，不具有独立采用状态。

从包含 `examples/` 的领域目录运行隔离示例：

```sh
rtk proxy node examples/run.mjs
```

这需要[案例](docs/cases.md)所述的 Node.js 与 C++20 编译器。运行器检查已声明的示例行为与预期反例；它不验证哲学，也不确立生产维护收益。生成文件与执行证据留在被忽略的 `examples/.local/` 中。

## Lean 实现与对照稿

[Lean 交付说明](../lean/README.md)提供维护中的 Lean 工程、冻结目标、来源审查、选定证据，以及[中文速览](lean/philosophy/overview.md)与[逐行详解](lean/philosophy/details.md)和对应英文稿。采用基准仍保留本 Organon 的 Core 0.1.2。检查显式使用独立 OrganonCore 运行环境，子哲学不复制维护检查器。
