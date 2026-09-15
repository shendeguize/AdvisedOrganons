# Adopted F01/F06 修复：独立窄复核

时间：2026-09-14T17:30:52.056693+00:00。审阅者：`/root/se_source_first`。阶段：保留source-first初读和初次源码判断之后的知情修复复核。未改代码，未覆盖原记录；只审F01/F06及直接类型变化，未展开新的全文评审。

**F01与F06均已在当前候选披露的有限范围内解决。** T09可从rejected改为accepted（明确原task的充分适配接口）；T07原先pending的grounds_on_grounds分支可接受。其他目标/Domain findings维持原状态。此结论不接受Root新task绑定、完整T38/T39、尚未完成的code-only回译或最终reader/source-fidelity证据。

受审对象：`Adopted-nature-candidate-04.lean`，SHA256 `68bb96c35553bf83d0e3a915d1cca0c72b8097670626e32046bf53af5d0bc773`。旧初审Adopted hash仍为 `9c7b2ea63fe176c490f007598563de58f6937f4b8dd09bcdbe5b15f39c395c3e`，不刷新旧判断。

## F01 — 原任务与nature适宜性

实际类型现在是 `Grounds012 claim articulations facets task`。每个supplied facet仍需同claim、articulation内容、discharge，并新增 `NatureAppropriate task facet`。task包含原records/scope/claim/uncertainty、原inferential assumptions，或原value position；并非仅检enum标签或自由成功Bool。

检查了以下实际命题及其证明内容：

- `circularSubstitutionRejected012`：新的“假定allTrue再推出allTrue”任务本身可以有支持，但同facet不能替代既定的 `[zeroRecord]` 经验allTrue任务。反证使用 `localGenerator 0` 实际兼容原记录而在1处失败，区分原premises与新allTrue assumption，未把正确条件推论说成错误。
- `sameEmpiricalTaskTwoMethods012`：同一个originalLocalTask既接受原经验facet，也接受从原Compatible(records)与scope构成的假设推论出input0结论。适宜性不是“原任务只能用同名种类”。
- `uncertaintySubstitutionRejected012`：尽管推论facet对第一坐标的结论有效，同原经验task仍必须保留第二坐标uncertainty断言。`(true,false)`满足原重复温度记录而使该断言失败，因此转换评估形式不能逃掉原uncertainty责任。
- `valueFactSubstitutionRejected012`：观察到已选择该position与其value task有理由是不同任务；实际观察facet可discharged却不能取代固定value position。
- `inferentialContextSubstitutionRejected012`：原emptyTheory不允许被替换成新增目标结论的singleton前提。新前提下的推论正确性保留，但不是原任务的完成。

`grounds012Singleton`的新结论明确只适用于 `taskOfFacet f`；它没有给定任意原task的适宜性证明。该 helper 合法地创建一个任务，不能把它用作替换另一个已由源/上下文固定的任务。Root使用时必须实际保留同一原task，这仍待Root源码审查。

**限度**：NatureAppropriate是所选表示中足够的内容匹配，不是全部哲学适宜性的必要充分条件。等式匹配会不接受某些语义等价但表现不同的ground或推论；文件已明确披露此限度。未加入013“所有实际方面自动覆盖”义务；原任务/所选facets之外的哲学全面性仍由source inventory和最终审查负责。初始task必须与源语义对应，构造task本身不证明其真实性。

## F06 — Ground自我理由连接实际许可后果

旧 `outcome = !enabled` 已改为 `groundsExperiment012 enabled`：对固定 `groundsExperimentTask012` 及相同allTrue/zeroRecord/globalFacet实际求 `groundsPermission012` 的判定。这是classical noncomputable逻辑判定，不应称为可运行的经验试验。

reasons不再包含 `enabled=true`；现在给出实际反世界 `Compatible [zeroRecord] (localGenerator 0) ∧ ¬ allTrue (localGenerator 0)`。`groundsPosition012Checked`的后果证明从传入reasons抽出这两项，证明同一原task的Grounds不足，再推出启用policy时许可判定为false。`groundsRationaleExperiment012`还检查停用policy时同一任务许可为true，以及value outcome确实就是这两个同task实验结果。因此当前理由不是把期望开关值重命名成获益。

采纳true及“拒绝这个无充分支持断言”的目标仍是明确初始价值立场，不是事实必然推出的应当。规范 `GroundsProvision012 true` 对其permission gate的形式成立，与具体反例理由解释为什么在这一目标下采用gate分开。该关系足以解决F06的局部连接问题；它不证明Grounds普遍正确、所有assertion都已被实际评估或所有价值立场必须选true。

## 实际验证与依赖界线

- 已读candidate04的AssessmentTask/NatureAppropriate/Grounds012完整定义、适配helper、五组新正负变式、F06完整定义和证明，并检查修复已进入相关bundle。
- `nature-build-04.log` SHA256 `a2829f6b71000d5b74b17d869cf5c370482a3fd5f9e2ee72645593ddb7878a96`：保存输出明确 `Build completed successfully (8 jobs)`。
- `nature-audit.log` SHA256 `c450cefaa020de9b1964d6f522262543063f6bc68c414b5dda81ef33eb560317`：读取实际审计记录，未见error/sorryAx；所报依赖只有propext/Classical.choice/Quot.sound。未在本审阅者进程重跑Lean，未把日志检查当语义证明。
- 所有新增type/代码hash均为新对象；旧source-code-review-partial-initial.md和targets-initial.json不改。新task参数改变相关type，最终登记须使用新type-hash和新review绑定，不允许拿旧type hash标新对象已审。

本阶段没有新的阻断。后续Root必须固定并使用与实际工程claim/grounds相对应的task，不能每次根据准备通过的facet重造task；且T38/T39仍需同ctx所有规范而非本helper的成功。Domain待修项及最终盲回译保持未完成。
