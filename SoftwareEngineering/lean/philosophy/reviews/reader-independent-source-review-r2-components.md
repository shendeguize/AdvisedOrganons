# 读稿 R01–R05 组件窄复核

五项修正均通过对应源码的窄复核：T24 完整量词及条件已展开；T29 将真实状态变换与 EvolutionClaim 的独立条件分开，proof 也正确说明独立合取；T35 改为同一对象对五项同时变化并准确指出 old/recordedOld；T36 只陈述有效历史与批评覆盖、选择保持和指定替代方向，不再误称实际可修订性；Adopted 692/1314 双语均准确标为仅地位负例。

实际差分只涉及指定四项 narrative 字段与 Adopted 两处重复解释。三份实际文件哈希与作者响应一致；当前 Adopted 与 Domain 源码逐字节匹配第三版固定快照。哈希与逐项判断见同名 JSON，复核输入原样另存 reader-r2-component-inputs/。

reviews/README 已正确区分冻结证明目标保持不变与修复后的新代码对象。尚有一项小措辞：第20行插入 corrected predicates / expanded types 句后，The latter 的指代不清；请改为 The strong countermodel satisfies，使后续 It 也有明确先行词。此项已交 Root，不影响 R01–R05 关闭。

这是组件阶段复核。正式四稿尚未重建，不在此声明新四稿或最终检查通过。Domain 逐行稿是我的作者贡献；后续只会根据另一位审查者已保存的独立发现作作者修正，不独立审查自己的文字。
