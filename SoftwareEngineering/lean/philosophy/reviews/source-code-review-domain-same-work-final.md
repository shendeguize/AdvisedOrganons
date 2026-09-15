# Domain same-work 补充实例窄复核

时间：2026-09-14T17:34:49.029932+00:00。审阅者：`/root/se_source_first`。本记录保留 `source-code-review-domain-r2.md` 及全部初稿，不回写其hash或状态。

**T32剩余pending已解决，可以在披露的有限范围内accepted。** 新Domain SHA256 `0ed052c3692d8c91a41eed60bb0cba6ca033a7c9d1163aac66b32e4291927377`；r2原对象单独保留。其余F02/F03/F05及F04共同对象判断沿用r2窄复核，未新增全文审查或预判Root。

实际读取 `relocateVerification`、`sameWorkDesign` 及更新后的 `structureNotCapability`。新变式确实沿 `introduceBoundary` 新增component8和edge8→0；把原有contractRunner步骤移到component8而保留其units及其他step内容。因此path不同、组件/边界确实新增、原output相同，且totalwork仍17。successor依旧缺privateLayout，实际change能力没有因新增边界获得。该新实例满足冻结 `new_boundary_same_work` 的精确同工作量内容；原17→18例仍保留为补充，而不是被改名冒充same work。

`integration-build-07-receipt.json` 实际记录 `lake build CoreReader`、正确项目cwd、exit_code=0、Domain及Root依赖成功构建，且receipt.domain_sha256与本次代码一致。receipt SHA256 `412f975863cd2f3d803673776807a0205cd5e4b5ac7d37328d69f332abab7323`；日志SHA256 `caa96c28e36877314eab947d5dc98f8caf032327f1fdece9b88018527e1e807d`。这为新对象提供真实构建完成证据。旧空 `domain-build-19.log` 不因此被追溯改成成功收据。

尚未完成最终新type-hash/axiom审计对象绑定、全代码独立code-only回译及Root完整source comparison；本次acceptance只解除旧F04剩余case精度，不等于整体完成。未改代码。
