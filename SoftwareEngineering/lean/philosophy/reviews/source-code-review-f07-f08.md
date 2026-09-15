# F07/F08 独立修复复核

审查者 `/root/se_source_first`。本记录是保存 source-first 和 full-initial 后的知情修复审查；已读作者 response，但尚未看到另一代理的盲译或源文对照意见。结论：**F07/F08 在当前有限表示中解决**。T20/T37/T38/T39 从 pending-correspondence 改为 accepted-bounded。此结论不代替后续三方比较、读者稿和最终交付检查。

## 对象与实际证据

- Integration.lean：`a2b88062148b3f7ebea7da02d88cb29cb04d8f1b2e9e6b97bb2420ac2c006328`
- SelfApplication.lean：`d69c0d369bd4fd8db4c21ce3b65abb5e9efd07ed5ab9a68d56b4db39bb9d2a21`
- Reflection.lean：`c290d8472884d00bedbf945f0fc1866524e758740f40d42088c4ff9678a93fa2`

逐文件比较 `before-f07-f08/leanified` 与当前项目：只有这三个 Lean 文件改变。其余已审源码精确字节不变，保留既有局部接受及限度。T38 `jointWitness` 与 T39 `inheritedDoesNotEntailPriority` 的完整公开 statement（截至 `:= by`）与前稿逐字相等；它们引用的 Inherited 和 ownTheory 已补足，不能因外层 statement 未改而只复用旧组合判断。

实际读取 `f07-f08-build-05-receipt.json`、对应非空日志，以及 `evidence/checks/2026-09-14T17-57-36.138Z-30664-f57092` 下独立全构建和 audit 原始输出。两次实际构建及 audit 返回 0；全构建 15 jobs。59 声明有真实类型输出，已核新 T20/T37 结论及 T38/T39 完整强分支，依赖限于 propext、Classical.choice、Quot.sound，无 sorry 或项目公理。证据目录 inputs-sha256 中14项项目输入与当前对象相等。源码与每项证据 hash 绑定在同名 JSON。

## F07：完整内容进入同一理论

Integration:229–258 的 OwnNorm/ownNormClaim 不再停在 coreAdoption：逐分支展开到真实 generation、reflection、原 empirical task、capacity inference、各原则价值责任、选择价值及实际采纳、scope、capability、implementation choice、各 ownFact 的推论根据，以及领域采用者的完整 DomainSatisfied 和实际 priority 价值根据。旧 coreAdoption 仍是事实标记，但不再代替这些规范内容。

Integration:285–329 将事实理论与当前适用规范内容并入同一个 ownTheory。allNormativeContentHeld 提供逐项实际成员关系；currentAdmissible 对两个并集分支分别调用 actualOwnFact/actualOwnNorm，构造同一个 chosen 模型。currentConsistency 的 snapshot 持有这个并集，因此其后果关系约束的是完整内容与事实，而非每条原则单独自洽。T20 现在明确返回完整内容成员、整理论的根据和这个 consistency。

一致性作为约束完整理论的谓词在定义之外表示，未把 Consistent theory 自引用塞入该 theory。此选择已明确披露；它没有免除一致性，而是由 currentConsistency 直接证明其对精确同一完整理论成立。没有理由为了形式上的成员枚举要求不良自引用。

Integration:351–369 的实际变式保留同一采纳标记，同时把同 candidate/question/scope 的相反要求放在同一理论并证明不一致；不是只翻转“consistent”标签。另证明 evolvable 持有实际 domain 内容，而 presentSimple 不持有且不能满足该内容。该变式不是所有可能 normative encoding 的保真元定理，但结合 OwnNorm 的逐分支原谓词定义，足以回答本次缺口。

领域 normApplies 由 domain adoption 控制，不能与 PriorityConditions 混同：T39 的规范未采纳，但实际领域优先适用条件仍全部成立。此区分恰是用户强非蕴含目标；没有使用 temporary/cost exception 回避。

## F08：实际规则成为自身评估对象

SelfApplication:8–65 新增 generationRule/assessmentRule。其 objectTest 直接使用当前 Reflection.generate/evaluate，ruleProbe 不调用 staticBatch。ownRuleIdentity 同时连接对象成员、当前 rule.meaning=interpret、对象合同，以及实际 generation/assessment applicability。currentSelfRecords 仍对实际 interpret 检查输入理由非空、basis 与记录后果，不仅核对对象名。

generation 的 formation/revision 实际适用，application 不适用；assessment 三阶段适用。新增对象没有被统统豁免。ownRuleContentVariation 实际检查当前生成器保留 requested tests/scope，而替换为空输出的方法在同一探针失败。当前评估器在有初始样本时符合本地契约，在空初始样本时仍返回 supported；assessmentRule 的 revision 自评据实际失败结果返回 counterexample。这里检查的是实际正在用的评估函数，已不再用领域预测反例替代自身方法。

sampleAwareAssessment 是独立候选，在空/非空两种有限情况满足该样本契约；它未偷偷替换当前 evaluate。proposedRuleRevision 还让同一对象与 phase 下的实际 applicability 随候选条件改变。后一个候选将 generationApplies 设为 False，只用于实际适用性差异探针，不是当前系统的整体豁免。原当前适用性已另行证明。

## 反驳与保留限度

“空样本缺陷”是这个本地 sample-aware 期望契约下的失败，不是哲学要求所有判断都必须有观察样本。ruleProbe 的 requested 项仍由纯函数 test 检查，因此不能把它描述为“完全没有任何判断依据”。源文允许不同性质的支持，也没有通用测量链；读者稿必须保留这个范围。本限定不推翻实际方法对象绑定及自评反例。

priorityValueMeaning 是在固定 sharedContext、当前适用且无成本例外时，将 selectionPosition.evolvable 的 commitment 与实际 EvolutionPriority 逐 candidate 证明等价；priorityGrounds 保留该 value 原任务，并用明确等价连接同一 claim。此处依据既有实际 changeWork 与目的/限度，未声称采纳是经验事实或必然推论。T37 新增实际 priority Grounds、domain 内容成员及同一完整理论 consistency。不能把该有限等价推广到其他情境下所有优先规则。

wholeClaimGrounded 从固定模型身份推导整理论各项命题，是关于这个模型事实/责任完成状态的数学根据。它不取代仍在 OwnNorm 和 Inherited 中独立保留的 empirical、inferential、value、capability 原任务，没有重新引入 F01 的新假设冒充旧任务。

自评成功或产生 candidate revision 没有证明普遍正确；当前评估器的局部失败保留，未追溯改成成功。自反要求是适用原则的真实执行与可批评性，并不要求每次自评都宣布原方法正确。F08 得到解决也不意味着所有可能方法和适用情境均已覆盖。

## 目标结论

- T20：accepted-bounded；完整内容、同一理论一致性、原任务支持及实际自身规则对象已接通。
- T37：accepted-bounded；实际 priority Ground、完整理论成员/一致性和领域方法及实际评估规则的批评均保留。
- T38：accepted-bounded；同一 continuing ctx 的 evolvable 满足补足后的 Inherited 和 DomainSatisfied，接受额外复杂度且有真实 successor/agent designRevision 路径。
- T39：accepted-bounded；同一 ctx 的实际 presentSimple 选择仍满足全部已表示继承责任，领域 PriorityConditions 成立，双方必要需求满足，credible designRevision 和实际演化优势存在，无 lifecycle/cost 逃逸，而 EvolutionPriority 实际不成立。

没有发现需要继续修改这三个文件才能解除 F07/F08 的阻断。此前完整初判及本次以前所有对象、失败记录与判断保持原样。本轮未改生产代码、未运行自编 Lean 探针；结论依据实际源码、已编译探针证明和真实收据，不依据作者意见或代理同意数。
