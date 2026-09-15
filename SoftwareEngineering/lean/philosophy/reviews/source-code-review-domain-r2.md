# Domain r2 — 对应初审finding的独立窄复核

时间：2026-09-14T17:33:57.197728+00:00。审阅者：`/root/se_source_first`。阶段：知情修复审查；未改代码、未覆盖初稿、未扩大至Root T20/T37–T39。

受审Domain.lean SHA256：`2949bc55e78de008c1b5bad067373e27ea1cac763db5a2404396d2ba66bbb96a`。原初审hash `bf1b5cb1c901de2d9c37dec58635f9b6af2ccd36c51b5bb158f39b182eaab941` 保留；作者r1/r2说明用于定位，以下判断来自实际定义、命题与证明内容。

**F02/F03/F05在披露的有限范围已解决，F04的共同对象/真实边界问题也已解决。** T32冻结 `new_boundary_same_work` 的具体实例保留另有一项待落实：当前总工作量17→18，不是原名称所指的same work。它满足源级“新增boundary不能单独证明更容易”，但不应静默把冻结的同工作量案例改成不同工作量。已将此窄差异告知root，建议保留一个实际新增边界且total work不变的变式，或在原合同确实仅把此名作为“不减轻工作”分支标识时明确记录该范围判断。其余已成立片段无需重做全文评审。

## F02 — 演化能力最大化与跨维比较

- `registeredDirections`现在有额外CSV export。maximal有真正可供successor/agent使用的migrationGuide/compiler路径；evolvable路径需要这些维护者没有的privateLayout。`transform (.other "csv export")`实际追加能力字段。不是只把abstractionComplexity命名最大。
- `credibilityLimits`实际证明采纳evolvable满足EvolutionPriority而不满足MaximumRegisteredCapability；maximal覆盖注册十项，evolvable九项。额外CSV方向不被当前credible grounds支持。这支持有限集合内不最大化所有可能性的源分支；不声称最大化宇宙中所有想象变化。
- `evolutionDimensionsLimits`固定同两个candidate及原maintainer，对designRevision有严格work优势而addition同为2；`oneDimensionDoesNotEntailEveryDimension`实际反驳每个Change都严格占优。原easy_add/hard_exit与贵migration分支保留。
- 空path被CanChange/ContinuingCapability明确拒绝，未知方向不能靠空列表all获得能力。

T24、T27、T30可从rejected改为accepted，限于这些显式能力/成本关系。T24的旧bundle依旧只列复杂度，但补充实际能力命题已存在并由author map指出；最终case绑定必须引用实际命题，不能仍只用复杂度那一项作为证据。

## F03 — 合同义务和受影响方

`ObservableContract`独立于report，含实际order函数及maxAttempts；`retry`从这个限制计算行为。旧合同attempt3为false，新合同为true，实际行为变化替代原来孤立Nat字段不等式。

`partyDependencies`独立指出consumer观察order、operator观察retry；`affectedParties`从实际old/new合同差别导出相应方。`RevisionDuties`核对report覆盖这些方并绑定old/new真实maxAttempts及记录值。`contractDistinctions`拒绝只留consumer以及联动改oldFailureLimit/recordedOldFailureLimit的变式。原通知字段及必需通知程序已移除，避免额外规定source不要求的流程。

有限preservation、明确修订、影响方缺失、替代procedure、[99]范围外历史差别都仍有实际实例；generic contractRevisionObligations有完整old/new/account/nonpreservation前提。T33/T34改为accepted；依赖它的T29相应pending解除，保留有限direction/treatment适配限度。此接受不要求保存全部历史行为，也不要求特定测试/迁移方法。

## F04 — 同设计对象及实际新增边界

`EngineeringDesign`把metadata、run、paths、components、boundaries、batchAssumptions放在同一对象。private/documented共享metadata而successor能否走designRevision路径不同；private/sorted共享signature而order输出不同；8模块变化直接读取该设计的batch assumptions。先前无关联并列字段问题已经解决。

`introduceBoundary`实际新增component8、edge8→0、forwarding run和path verification step。wrappedDesign有9个components、1条boundary，work18；不再使用wrappedWork alias。该内容确实构成“增加边界不保证减少change work”的相关反例。

剩余仅为冻结案例精度：`new_boundary_same_work`的当前author索引也明确写17→18。不能在读者稿里继续写“总工作量相同”。若原case确切要求same total，需补相同工作量的真实新增boundary变式；原counterclaim no-improvement与修复后的已真命题不受影响。T32暂保持pending，直到该目录分支的保留被明确解决；不是重新拒绝共同对象修复。

## F05 — 历史事件与当前ctx身份

`RevisionAccountAgainst history r`现在把独立history作为参数；软件身份、old snapshot、prediction与actual数字都与该history核对。固定observedHistory中的static21/size5预测3、live实际5来自真实函数计算。

`failedHistoryNotRewritten`在同history失败及account满足的完整前提下推出report=false。`historicalTamperingRejected`实际拒绝联动old/recordedOld、prediction+success、actual+success及另软件身份。当前record可以改变而历史失败不能靠修改report自身被重写，这与源scope一致。

`revisionFor`的software来自ctx.activity.software，revisionContextIdentity也检查它与observedHistory软件及当前维护期/维护者/成本/容量/选择的连接。此前报告把固定实例的真定理和泛化历史对应前提区分；现在泛化前提在类型中明示并有实际变式。T35/T36可改为accepted，限于所披露历史输入是真实原事件的模型假设；这不是cryptographic provenance或现实历史真实性的证明。

## 验证和状态界线

- 实际读取变更的path/能力集合、合同/party/behavior定义、EngineeringDesign与boundary变换、historical绑定及所需case/theorem正文，未把作者notes当证明。
- `domain-audit-r2.log` SHA256 `3e14447cd433375bb8408fe4e49f95907ee77d7686742e709bc7f57f43827566`；实际有命题类型及axiom输出，只见propext/Quot.sound，没有error/sorryAx。`failedHistoryNotRewritten`中的failed是合法前提名，不是失败日志。
- `domain-build-19.log` SHA256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`，**为空文件**。这可能是成功的静默Lean命令，但空文件本身不能证明exit=0；最终交付须保存实际命令完成状态或execution receipt。此处不虚报独立重新编译成功。
- 未重新运行Lean；Root完整集成、最终盲回译、新type-hash/源审查/四稿绑定仍未完成。所有accepted仅是本次修复对象的source-code范围判断。

作者修复没有授权改变源哲学、版本或冻结目标；本报告也不作这种更改。旧记录不更新hash或成功状态，后续新binding应指向本次新对象。
