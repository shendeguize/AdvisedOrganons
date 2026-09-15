# 完整源码对照初判

审查者：`/root/se_source_first`。阶段：保存独立 source-first 后的知情源码对照；尚未接触新鲜 code-only 盲译或其具体 concerns。当前完整组合暂不接受，T20/T37/T38/T39 有以下两项对应阻断。不是 Lean 类型错误，也没有证明源文或强目标不可满足。

## F07：完整已持规范与 whole held theory 的对应缺口

`Integration.lean:148–204` 的 `ownTheory` 仅枚举 `OwnFact`。generation/reflection 已有实际 specification 命题，但 `coreAdoption` 的解释是 `governancePosition.commitment`，最终为恒真采纳标记。完整 empirical/inferential/value/scope/capability/implementationChoice，以及 adopter 的 DomainSatisfied/priority 等实际规范字段，没有各自对应的 held norm 内容或完整内容理论到此 theory 的保真关系。`currentConsistency` 只证明这个枚举理论。

`Integration.lean:240` 的 Inherited 各字段有真实满足证明，绝非只有标记。本 finding 不断言那些字段为假，也不声称遗漏规范与此有限模型冲突：固定 candidate 甚至可以支持许多未显式枚举的真命题。阻断是源码注释所称“every represented current fact and adopted commitment”的完整内容对应没有展示；采用事实不能自动取代所采用规范的内容。

修复边界：显式连接全部被表示且当前适用的已持规范内容、条件与判断到受一致性约束的理论，或提供完整内容理论与当前理论的保真关系。保留真实规范满足字段和 T39 简单选择；无需新增 Core 0.1.3 的全方面 Grounds 义务。

实际检查：逐一展开 OwnFact/ownFactClaim/ownTheory；coreAdoption 归约为 true，generation/reflection 的规范已经单列。建议后续探针（本轮未执行 Lean 探针）：相同采纳标签下内容要求不相容的规范应进入同一内容理论并触发冲突；适用范围变化应改变被持有内容，不能仅靠 marker 名称确认。

## F08：系统自己的 generation/assessment 规则缺少明确自评对象

`Reflection.lean:70–96` 实际采用的两条规则是 `Model.rule generation/assessment`，其 meaning 为 `interpret activity`。`SelfApplication.lean:8–24` 的 ReviewObject 列表只有 activity、五种 commitment、priority、evolutionMethod；后者实际内容是 staticBatch/liveBatch 预测。commitment 的 test 是 safeguardExperiment，basis 为对应 ReasonRelevant，是具体理由与后果试验。没有一个对象的实际内容/输入明确绑定当前 generation/assessment rule 的 meaning、适用条件及评估方法。

Model.follows 正确检查这些规则用于已有对象列表，但列表未包括这两个实际规则。reviewIdentity 绑定了枚举对象与其理由试验，不能单独证明对象就是当前使用的评估规则。源码已把这些规则用作系统自己的 generation/assessment；其 formation/revision 的适用性需要明确处理，不能以 staticBatch 的反例替代。这不是要求所有原则无条件自应用或无限回归。

领域方法在 21/10 正确、21/5 失败，是有效批评；priority 对象也确实测试实际 EvolutionPriority，绝非 assessed flag。F08 不否定这些局部案例。修复边界是让所采用规则的实际内容和条件在自身 formation/application/revision 的对象关系中可追踪，并提供相关适用性和实际执行/批评证据。不适用须由具体条件说明，不能将新增自规则对象全部设为不适用。

实际检查：核对全部 ReviewObject 构造子、objectTest 分支及 Model.rule meaning。建议后续探针（未执行）：改变实际评估规则或适用范围而保持枚举名/理由文本不变，对应对象内容和输入应随之改变；用实际方法的一项有限批评核对对象，不能只重放领域预测反例。

## 已成立的具体内容

Inherited 真实包含 generation、consistency、reflection、own principle values、choice value、empirical/inferential/scope/capability/implementation choice 与 own claims。共同 ctx 绑定 sharedContext，不能任意替换。Root 经验任务保留实际 present-budget record；推论保留真实 capacity assumptions；value/capability 分别履责。OwnFact 的固定模型身份推论没有替换原经验任务，未重现 F01 的新循环假设替代旧任务问题。

Values 的理由与具体原则内容相关：计划/designRevision、相反顺序合同、static/live 的 21/5 反例、测量范围 10/5、实际 complexity/work 与预算。safeguard enabled/disabled 改变实际许可变更、冲突许可、自测集合、许可范围或选择实现，后果不是自由获益 Bool。初始采纳仍为承诺，事实不被声称必然推出采纳。部分 consequence 证明不再消费已固定且真实的 reason premise，本身不构成 F06 复发。

T38 实际选 evolvable，T39 实际选 presentSimple；两者处在共同 continuing 情境，双方满足必要需求，具有 credible designRevision，evolvable 的 successor/agent 有真实变更路径。T39 明确排除 bounded lifecycle、cost threat 和 justified departure，简单选择的价值承诺有实际复杂度理由。T38 接受额外复杂度并有较少的真实变更工作量。不得通过削弱这些分支解决 F07/F08。

engineeringCapability 是明确的输出/报告契约，不等于所有维护者均能修改；更强 successor/agent 断言由独立 CanChange 实际路径证明。Grounds012 保留有限的显式原任务/内容适配，而非声称覆盖所有 claim nature，也未增加 Core013 全方面义务。

## 对象复用和形式证据

`encoding-v2-before-mappings` 全部 15 个文件与当前对象逐项比较：当前仅删除新增 `/-- organon-map ... -/` 注释后，与快照字节相等。Adopted 快照 hash 为 `68bb96c35553bf83d0e3a915d1cca0c72b8097670626e32046bf53af5d0bc773`；Domain 为 `0ed052c3692d8c91a41eed60bb0cba6ca033a7c9d1163aac66b32e4291927377`。据此披露地复用此前修复判断，不改签旧批准 hash。

实际读取 `evidence/checks/2026-09-14T17-35-30.437Z-29702-09a03c` 的 lake-build、lean-audit 原始日志/收据及 ConstantInfo 类型。完整隔离构建和实际 audit status 0；59 声明有完整类型及公理输出，限于 propext、Classical.choice、Quot.sound，没有 sorry 或项目公理。inputs-sha256 的 14 项项目输入与当前对象逐项相等。运行身份是执行记录，不是工具批准；checker semantic_status 未评估且 proof_targets incomplete。旧空 domain-build-19.log 没有被回写为 PASS。

## 逐目标与源段判断

同名 JSON 记录全部 40 目标、47 parser 源段、175 semantic cases 和59声明真实 type hash。T01/T21/T40 的非形式边界接受；T02–T19/T22–T36 在此前初审、修复及本次精确字节复用范围内接受。T04/T07 的一般接口与案例接受不等于 Root 的完整组合已经对应。T20/T37/T38/T39 为 pending-correspondence，理由是 F07/F08，而不是其真实有限分支未证明。

T37 的 priority 自评和 staticBatch 方法批评局部有效，但整体 inherited consistency 与系统自身采用规则的对象覆盖仍待修复。T38/T39 的强实际分支已经有效，完整源义组合仍不能仅凭 Inherited/DomainSatisfied 名称宣布覆盖。

全部旧记录保持原样。本轮未改生产代码，没有 Lean 探针编译；独立代码盲译、四本读者稿及最终绑定未审，不能据本记录宣布最终交付完成。
