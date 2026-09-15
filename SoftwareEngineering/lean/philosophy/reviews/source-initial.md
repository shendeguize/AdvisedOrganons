# 独立 source-first 初稿 — SoftwareEngineering 全文

记录时间：2026-09-14T16:44:03.740255+00:00。审阅者：`/root/se_source_first`。本记录在查看作者目标目录、候选 Lean 或既有 Core Lean 模型/旧评审文件之前形成。这里只写本记录和 `source-first-targets.json`，未编码、未修改源文本、未执行源示例。

## 对象、基准与实际暴露

选择基准与被形式化源均为 `SoftwareEngineering/PHILOSOPHY.md`，SoftwareEngineering 0.2.0 / Core 0.1.2；SHA256 `6c6ae78a23f2726c5c370434e808d76c206647fe7793245e88cae52c076abe34`。`derived_from` 是源的继承元数据，其 Core hash 不能替代本次实际源 hash。Core 当前 0.1.3 只约束审阅方法及 Core 维护。父任务保留调用者为本次用户任务，真实相对引用目录为 `SoftwareEngineering`。

已完整读主源，包括表格、含义、限度及关系。已读 rationale 和 cases 作为解释背景，没有访问其中外部链接，未主张重新核实其文献摘要或既有运行结果。按根规则读取 `.local/ACTIVE.md` 时，索引暴露了过去 Core 完成数和状态摘要；没有打开其链接、旧代码、旧目标目录或评审原文。这一有限暴露如实保留，不能声称完全未见任何历史状态。已见父任务和 `ACCEPTED-PLAN.md` 中的用户强证明目标；未见作者形式化方案、候选目录或预期正确结论。各实际输入路径与 SHA256 在 JSON 的 `inputs`。

## 完整性与分类方法

JSON 保留 28 个 direct-body 单元、54 个本地段落/表格行分片和 40 个建议目标，保留所有 direct-body 原文字节（含空白），每片带精确行区间与目标映射。纯标题结构和表头/分隔行有独立标记；术语表两行是约束语义，不能当纯格式丢弃。没有未追踪的实质分片。本地 `cNN` 仅供初稿定位，作者须对齐仓库 parser/run 的真实 clause ID 后冻结；这不是现成的 `targets.json`。

目录按完整语义与分支组织，重复条款共享目标。T01–T21 覆盖继承承诺及关系，T22–T37 覆盖领域主体、优先、演化、结构、修订，T38–T39 是用户明确额外的强关系证明，T40 固定非形式边界。每项在 JSON 给 statement、完整前提族、证据种类、正反案例和完成判据。specification 是义务表达，不是履行证明；theorem 是采用规则和公开前提下的推论；有限实例是所声明表示的满足性或非蕴含证据，不是现实经验或价值正确性。

## 编码前须保留的区别

1. **旧 Core 0.1.2 不得偷增。** 子哲学 §2.1 止于 articulation/support 区别，没有当前 Core 0.1.3 的 “more than one applicable aspect” 和 “Omitting a classification” 两句。可以为诚实对应而不强迫互斥/穷尽分类，可以在应用中表达混合内容，但不能把“全部实际 aspect 无遗漏分类义务”作为子哲学明文新增公理。任何强化须标为额外表示/应用假设，不能说继承而来。不要直接复制当前 Core 满足接口再声称是旧基准。
2. **支持不是完成评估。** Assessment 要检查对应 grounds 是否支持 claim；完成检查不保证被检查主张受支持。反例应有可解释的支持失败（反赋值、遗漏相关观测、维度超范围、可见契约违例），不能用 `supported := false` 或“无记录”冒充不足依据。
3. **一致性是联合后果。** 全体同时持有判断的 consequence relation 须能检测由组合前提才推出的冲突；单个原则分别无冲突不足。条件、词义、问题、范围相同才构成要求中的冲突。修订可撤回，不能把历史并集作当前义务，也不能靠静默换 scope 消失冲突。
4. **领域主体是 continuing activity。** 维护者包括接任者与 agent，软件本身不是自动拥有 intrinsic orientation 的主体。作者能编辑与继任者有可理解/修改/验证路径是不同主张。credibility 应有 plan/knowledge/history 等内容，但这些例示不穷尽全部合法依据。
5. **适用与例外。** §4.2 以必要 requirements 满足为条件，并承接可信 lifecycle/maintenance。priority 是可让步的默认价值承诺；威胁具体目标的 added costs 才能在模型里形成相应例外，须有目标与成本关联说明。不要把每种 cost 都变成每案必需，也不要把 “may have little reason” 变成所有 temporary 类型绝对豁免。
6. **优先与行动的读法。** “give priority / Accept additional complexity” 至少是理由/偏好与接受负担的规范，不能仅表示“评估已执行”；建模为实际选择需公开 candidate 比较、可行性、可信演化优势与相关成本的条件。若证明只覆盖二选一严格优势场景，报告为该场景的表示，而非任意真实决策的完备理论。
7. **evolution 不只是 add。** addition/replacement/deletion/withdrawal/redrawing/migration 六类，以及 independent/coordinated、preserve/revise obligations 的不同维度均要追踪。它们是 “includes / can require”，不应变成穷尽本体或要求每案实现全部变化且均廉价。
8. **整体后果与可选考察。** contract、component relation、understanding/verification work 不可被接口形状取代。propagation/knowledge/obligation/fixed assumptions/withdrawal 的 “may examine” 不能升级成每次必做 scorecard。
9. **契约修订和历史真实。** preserved identified observable contract 与 deliberately revised contract 区别明确；后者需要 changed obligations/affected parties 说明，但不要求保存一切历史行为或特定测试/迁移法。新证据可改变新判断，不能使旧预测倒转成功。
10. **规范角色不冒充不可能性。** 原文 “does not claim ... follows” 明确不提出推导与层级，不单靠该措辞就证明任何逻辑表示下都不蕴含。用户明确要求的强非蕴含目标另列 T39；其数学范围和适配前提要逐项审查。

## 强关系目标的独立建议

**T38 联合满足见证。** 采用一个真实含内容的有限工程场景：继续维护的软件，接任维护者和 agent 有明确可用工具/知识，已满足行为、安全、性能及其他必要约束；一项有计划依据的设计修订在候选 A 中可实现且可验证，在更简单候选 B 中负担更高；A 的现有抽象更复杂但不威胁具体目标。系统重视扩展、保持方法/原则可修订、联合判断一致，对相关 empirical/inferential/value 主张给出限定依据，允许原则和评估法自适用且保持适用条件；据此采用 A。证明必须是同一个 ctx 同时满足整个 represented inherited interface 和整个 domain interface，不能分别给互不相关实例。至少一个相关 principle/self-target、非空 claim、有效推论、实质演化比较应真实活跃，避免全空/default-True。

**T39 强反例。** 保留 continuing lifecycle、可信设计演化优势、全部必要 requirements 满足且无具体成本威胁；不允许 temporary、成本例外或“做过评估”借口。一个价值选择者认可演化值得追求并保持一切现有形式开放，也满足 inherited Grounds、选择理由与自省义务，但在当前可行 tradeoff 中以另一公开且限定的价值理由采用现有抽象简单候选 B，未采纳领域默认优先。其理由不能只有名称/传统/地位，也不能谎报 A 不可行或构成 objective threat。这里说明 Core 的 intrinsic orientation 不等同于每个决策都把未来演化放在 present simplicity 之前；持有不同优先次序仍须自行说明理由与一致性。若模型把 self-transcendence 直接定义为领域 priority，则反例被定义排除，属于偷增基准。该目标若无法形成忠实反例，必须保留失败/未解，而非换弱条件。

这两个目标来自用户额外证明契约；源 §4 开头与 rationale 的附加价值说明提供解释背景。联合满足证明不建立采纳充分理由，强反例不反驳领域承诺价值，也不证明其现实错误。

## 当前自检与交接

已以脚本检查所有 substantive direct-body 分片都有目标映射；JSON 可解析并记录源/基准实际 hash。没有运行 Lean 或源码案例，没有用文件检查宣称语义正确。此初稿是在作者比较前独立产生，后续发现应另追加 dated comparison，而不覆盖本次原判断。目标可以在不丢义务/分支的前提下重新归组；任何实质范围或读法差异应保留并由主任务按用户契约处理。
