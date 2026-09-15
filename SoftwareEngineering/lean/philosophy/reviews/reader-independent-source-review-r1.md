# 独立读者源码对照初判 r1

本轮结论：需要修正五项读稿问题；未发现需要修改冻结目标或 Lean 的新阻断。四十项双语目标说明均已读；T24、T29、T35、T36 的说明需要修正。Adopted 全部双语行解释需要修正重复出现的一处正负分支误述。正式四稿的锚点与最终执行证据尚待生成后核验。

## 身份与暴露

这是基于先前 source-first 初读及实际第三版代码审查的知情独立读者 QA，不是盲回译。我编写过 Domain 双语逐行稿，本轮不自审该稿。初稿落盘前 Root 已转告作者关于 T24 的条件量词观察；该项由实际源码独立核对，但不宣称是我的独立发现。其余作者读者 QA 结论未作为本初判输入。所有实际对象 SHA-256、逐目标判断与查找结果见同名 JSON；输入原稿保存在 reader-r1-inputs/，不覆盖作者稿。

## 必要修正

1. **R01 — T24 前提遗漏实际量词。** Domain 49–54、107–113、307–313 要求参与者、软件身份与工具非空，每位参与者有知识；持续能力是每位列出参与者拥有同一非空演化设计修订路径所需的全部知识与工具。仅写 nonempty scope / continuing-maintainer path 无法恢复这些完整条件。应展开这两项，保留持续发布维护、双方 Meets、可信设计修订、工作量优势与复杂度代价。T25 则已正确把规则、全部适用条件及无让步列为定理前提。

2. **R02 — T29 错把状态变换归入 EvolutionClaim 谓词。** Domain 556–563 实际连接 CanChange、对应契约账户、contractRunner 路径和指定样本的 preserve/revise 处理；SoftwareState 的 transform 在 570–575 的独立案例合取中。请分别表述，不能说该谓词自身绑定实际软件变换。保留有限观察条件。

3. **R03 — T35 夸大变式隔离且指错字段。** Domain 894–895 的同一前后状态同时改变 forecast、maintenance、maintainers、migrationCost、objectiveCapacity；951–957 分别列出这个同一对象对的差异，不是每次只改变一个因素。967–969 同步篡改的是 old 与 recordedOld，不是 current 与报告旧字段。双语都应按这些实际对象修正。

4. **R04 — T36 把稳定记录说成实际可修订性证明。** Domain 993–1005 给出有效 RevisionAccount、稳定记录选择等于旧选择和具体 unsupported alternative 的 RetentionJustified；没有证明该保留设计的实际 revisability。可改为历史账户与批评方向覆盖保持有效、选择未变、指定替代方向无获支持贡献。若要提完整集成的反思可修订性，应明确另引该结果，不能称为本案例所证。

5. **R05 — Adopted 行 692、1314 的双语解释把负例叫正例。** 两行都位于 `¬ choiceSpecification ... [.status .standing]` 分支；真正输出理由正例在 695、1317。请将 positive case／正例改为 status-only negative branch／仅地位负例，或使用不标正负的同实现措辞。

## 实际内容检查

Adopted 的 1225 条非空行解释在英文、中文中均已核对，包含 T16 的新机制应用：两对象共享 explainedProcess，固定翻倍回答在 multiplier=3/input=1 失败，正确回答满足任意 multiplier/input，身份范围不等于假设契约为真；实际契约证明和 same-task Grounds 才履行支持。别名、字段、全称量词、单元素模型身份定理及证明投影保持了这些区别。R05 之外未见新的实质误译。

六个旧 helper 的代码及双语解释复用身份已实际核验。去掉原 organon-map 注释后，每个非空源码行逐一相等，对应原 Core details 的每条解释也逐一相等，两语言各 2178 对，没有失配。记录在 reader-helper-reuse-probe-r1.json 和 reader-helper-caption-reuse-probe-r1.json。这个比对证明复用身份，不自动转移 Core 的哲学来源批准。

新做的 helper 内容 QA 包括 Logic、Choice、Agency、Reflexivity、Integration 的全部声明及证明步骤，Evidence 的 Grounds/ValueProcedure/Facet、canonical、achievement/support/scope/duty 部分 1–231，以及过程、能力、身份和外部证书部分 606–725。Evidence 233–605 的次级例子仅做了完整代码和解释身份复用核验，没有在本次有界检查中重新逐行作语义审查。所检查关键内容准确区分：理论模型与实际世界真；许可与赋值；范围覆盖与完整有效应用；非空表述与匹配支持；预设前提与实际构造；负面评估与未履行评估。旧 Integration 的有限四世界承诺例与新 Engineering 集成有不同对象范围，未将旧 Grounds 的所有适用面覆盖引入 Core 0.1.2。

## 读者检索实测

已用目标说明与固定源码实际找出并解释：默认优先的全部条件和三条定理前提；让步的具体成本威胁；T39 的完整 Inherited、持续且非临时生命周期、双方必要要求、可信设计修订、继任者/代理路径、真实演化优势、无成本逃逸、已支持且实际采纳的简单性选择；契约变化的独立受影响方及固定历史；规范定义与满足规范的证明区别。精确文件行号和回答见 JSON。T38/T39 没有被 adopter/assessed 标记替代。正式四稿的可点击锚点检索仍是后续检查，不在此冒报通过。

## 交付说明

新建五份交付说明全文及 README、中文 README、AGENTS 的新增 Lean 段落已检查。它们保留 SoftwareEngineering 0.2.0/Core 0.1.2、英文权威、独立 Core 运行时、有界表示、源文与代码审查、定义与履行、检查器不判断语义、历史失败不改写及精确复用限制；未发现增加子哲学义务。

有一处建议收紧：reviews/README.md 的 “strong joint-witness and non-entailment statements remain unchanged” 最好写成冻结证明目标／要求保持不变，避免读者以为修复前后实际谓词或展开类型字节相同。最终 kernel/manuscript-check、四稿和独立复制复跑尚未以最终对象交付；此时的路径文字与预期交付描述不算实际执行证据。本轮不批准这些尚未执行的阶段。
