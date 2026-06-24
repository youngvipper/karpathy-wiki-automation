---
title: 双均线策略示例
type: wiki
stage: compiled
entity_type: concept
domain: quant
confidence: high
tags:
  - quant
  - wiki
  - 策略
  - 均线
  - 趋势跟踪
created: 2026-06-24
updated: 2026-06-24
sources:
  - "[[raw/quant/2026-06-24_double-ma-strategy.md]]"
has_counter_arguments: false
---

# 双均线策略示例

这是一个量化投资领域的 Wiki 文章示例。

## 核心概念

双均线策略是一种经典的趋势跟踪策略，通过短期均线和长期均线的交叉来判断买卖时机。

## 策略逻辑

### 入场条件
- **买入信号**：短期均线上穿长期均线（金叉）
- **卖出信号**：短期均线下穿长期均线（死叉）

### 参数设置
- 短期均线：5日
- 长期均线：20日
- 止损：5%
- 止盈：10%

## 回测结果

| 指标 | 数值 | 评价 |
|------|------|------|
| 年化收益 | 15% | 中等 |
| 最大回撤 | 8% | 较低 |
| 夏普比率 | 1.2 | 良好 |
| 胜率 | 55% | 中等 |

## 适用场景

### 适合
- 趋势明显的市场
- 波动较大的品种
- 中长期交易

### 不适合
- 震荡市
- 低波动品种
- 高频交易

## 相关概念

- [[macd-strategy]] - MACD 策略
- [[rsi-strategy]] - RSI 策略
- [[bollinger-bands]] - 布林带
