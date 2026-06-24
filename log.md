# Log

按时间顺序、仅追加的知识库操作记录。不可修改历史条目。

**条目格式：**

```markdown
## [YYYY-MM-DD] <操作> | <简短描述>

（可选）一段简短上下文、发现或决策
```

**操作类型：** `ingest` · `compile` · `query` · `promote` · `research` · `delete` · `split` · `lint`

**快速查询：**

```bash
grep "^## \[" log.md | tail -10                # 最近 10 条
grep "^## \[.*compile" log.md | wc -l          # 编译总次数
grep "^## \[.*research" log.md | wc -l         # 研究总次数
grep "^## \[2026-06" log.md                    # 某月所有操作
```

---

## [2026-06-24] bootstrap | 知识库初始化

Wiki 目录结构已创建，准备开始 ingest。

- 使用 research 模板初始化
- 创建三个领域目录：quant、gis、office
- 配置 purpose.md 定义三个领域

## [2026-06-24] ingest | 采集双均线策略资料

采集第一个量化投资领域的资料。

- 来源：测试数据
- 文件：raw/quant/2026-06-24_double-ma-strategy.md
- 分类：concept（策略类）
- 状态：resolved

## [2026-06-24] compile | 编译双均线策略文章

将采集的资料编译成 Wiki 文章。

- 目标：wiki/quant/double-ma-strategy.md
- 实体类型：concept
- 领域：quant
- 来源：raw/quant/2026-06-24_double-ma-strategy.md

## [2026-06-24] index | 更新索引文件

更新 Dashboard、Concept Index、Source Index。

- Dashboard：添加概览和领域分布
- Concept Index：添加双均线策略条目
- Source Index：添加原始资料引用

## [2026-06-24] ingest | 采集 DOM 精度检验资料

采集 GIS 测绘质检领域的资料。

- 来源：测试数据
- 文件：raw/gis/2026-06-24_dom-accuracy-check.md
- 分类：concept（检验方法类）
- 状态：resolved

## [2026-06-24] compile | 编译 DOM 精度检验文章

将采集的资料编译成 Wiki 文章。

- 目标：wiki/gis/dom-accuracy-check.md
- 实体类型：concept
- 领域：gis
- 来源：raw/gis/2026-06-24_dom-accuracy-check.md

## [2026-06-24] index | 更新索引文件（GIS 领域）

更新 Dashboard、Concept Index、Source Index，添加 GIS 领域内容。

- Dashboard：更新文章数和重点文章
- Concept Index：添加 DOM 精度检验条目
- Source Index：添加 GIS 原始资料引用

## [2026-06-24] query | 量化策略查询示例

演示查询功能，查询双均线策略的优缺点。

- 查询问题：双均线策略的优缺点是什么？
- 参考文章：quant/double-ma-strategy
- 输出文件：outputs/queries/2026-06-24_quant-strategy-query.md

## [2026-06-24] lint | 健康检查

运行知识库健康检查，发现 2 个问题。

- 检查时间：2026-06-24 12:55
- 问题数量：2
- 主要问题：缺少交叉引用、缺少反论段落
- 输出文件：outputs/reports/2026-06-24-lint.md
