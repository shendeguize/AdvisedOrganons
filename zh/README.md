![AdvisedOrganons](../assets/banner.svg)

[English](../README.md) · [简体中文](README.md) · [Website](https://shendeguize.github.io/AdvisedOrganons/zh/) · [Releases](https://github.com/shendeguize/AdvisedOrganons/releases)

# AdvisedOrganons

具有明确边界的领域哲学。

## Design Aim · 设计目标

让 agent 的判断与改进有依据。Organon 让承诺、理由和适用边界可读、可审查、可修订。它提供哲学和方法，不保证判断正确或自动改进；哲学采纳保留明确的人类决定。

当前领域为 **SoftwareEngineering**。哲学 **0.2.1** 增加允许有根据地退让的软件演进优先承诺，保留已考虑的 Core **0.1.2** 检查点。该优先性是额外承诺，不是从 Core 推导出的结论；使用时仍需显式选择领域。

## 开始使用

```sh
npx --yes @shendeguize/agent-organon@1.0.0-rc.1 install --product advised --agent codex --scope project --project /path/to/workspace --version 1.0.0-rc.1 --domain SoftwareEngineering
```

候选发行版 **1.0.0-rc.1** 等待审核。公开包可用后执行上述命令；发行前使用本地候选包。需要 Node.js 22+。支持项目或全局安装；六种 agent 适配的真实验证状态见发行矩阵。

[完整快速开始：安装 → 检查 → 选择哲学 → 只读评估](https://shendeguize.github.io/AdvisedOrganons/zh/quick-start)

## 阅读与仓库结构

| 入口 | 内容 |
| --- | --- |
| [AgentOrganon](https://github.com/shendeguize/AgentOrganon) | 工作区技能及已采纳副本的管理。 |
| [OrganonCore](https://github.com/shendeguize/OrganonCore) | 核心哲学、审查方法与 Lean 证据。 |
| [AdvisedOrganons](https://github.com/shendeguize/AdvisedOrganons) | 领域哲学集合；明确选择领域后使用。 |
| [Docs](https://shendeguize.github.io/AdvisedOrganons/zh/understand) | 帮助读者理解概念、操作及能力边界。 |
| [Philosophy](https://shendeguize.github.io/AdvisedOrganons/zh/philosophy) | 已采纳承诺及其含义与条件。 |
| [Lean](https://shendeguize.github.io/AdvisedOrganons/zh/lean) | 主张速览及代码与解释的左右对照。 |

发布包仅包含哲学、非 Lean skills 及运行所需文件。网站、教程、Lean 工程与证据仍在源码中维护。Rationale 独立于人读 docs，不增加哲学义务；维护协议位于 maintenance。


## 选择方法

| 可发现入口 | 用途 |
| --- | --- |
| `organon-software-engineering` | 对已选哲学的评估进行路由；也支持仅限措辞的审查。 |

评估前先明确选择要采用的领域及其哲学路径，再通过这个领域入口调用包内的工作区与 Core 审查方法。该包包含所需实现，但不会把四个 Core 方法名分别注册为可发现技能。安装领域入口本身不采纳领域哲学；仅审查措辞的请求不需要哲学选择。

## 星标历史

![当前仓库真实星标总数历史](https://shendeguize.github.io/AdvisedOrganons/assets/stars.svg)

从启用日起每日记录真实总数。零值、取消星标和缺失采样如实保留；图中注明更新时间。

## 参与维护

维护前阅读仓库的 agent 指导与维护协议。机械检查、独立审查和人类采纳决定具有不同职责。

MIT · [License](../LICENSE)
