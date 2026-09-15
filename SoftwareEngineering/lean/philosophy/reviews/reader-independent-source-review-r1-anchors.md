# 读者 r1 四稿实际检索补记

在 r1 初判保存后，对 `before-reader-r1-revision/SoftwareEngineering` 的完整固定四稿进行了实际锚点检索。该对象 manifest SHA-256 为 `cd300f086c45afc1ff28a63ecce92c75ec06d94164eb0cd14d898a0f7eedcf6e`；四稿实际字节哈希均匹配。每一稿中全部 40 项 conclusion/premises/proof/limits 与本轮已审双语原稿精确相同，因此原 R01–R05 确实进入了 r1 正式稿，结构检查通过不消除这些语义问题。

实测定位 T09、T24、T25、T28、T33–T36、T38、T39 的目标锚点及其 source/declaration 出链；各稿均无丢失的内部链接目标或重复锚点。英文、中文详情的 T25 均在 Markdown 1135 行，T39 均在 1740 行；沿声明链接可取得完整条件类型，继续定位 Integration 的 374–396 行可恢复完整 Inherited 字段，586–606 行可恢复强反例完整前提与具体证明。查找解释结果沿用 r1 JSON 的语义回答，不把找到标记当作回答。

另外实际读取中文契约保持说明确认全称范围前提与有限样例分开，读取强反例说明及 wholeClaimGrounds 字段定位，确认并未将一般 assessed 状态当作继承履责。Adopted 692 的实际中文锚点仍显示将负例误称正例，须随 R05 修正。

Domain 是本人所作逐行稿，本次仅在该块检索位置，未给予独立语义批准。新 Engineering 各模块全部行解释由其他审查分工处理，本补记不扩大为其全稿独立审查。正式修正后仍需针对新四稿哈希作增量检索。机器结果及全部定位记录分别保存在 reader-r1-anchor-probe.json 和 reader-independent-source-review-r1-anchors.json。
