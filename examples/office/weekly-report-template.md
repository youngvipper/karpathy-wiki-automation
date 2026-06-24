---
title: 周报模板示例
type: wiki
stage: compiled
entity_type: concept
domain: office
confidence: high
tags:
  - office
  - wiki
  - 模板
  - 周报
  - 效率
created: 2026-06-24
updated: 2026-06-24
sources:
  - "[[raw/office/2026-06-24_weekly-report.md]]"
has_counter_arguments: false
---

# 周报模板示例

这是一个日常办公领域的 Wiki 文章示例。

## 核心概念

周报是职场中常见的工作汇报形式，用于总结一周的工作内容、成果和计划。

## 周报模板

### 基本信息
- **姓名**：[你的名字]
- **部门**：[你的部门]
- **日期**：[本周日期范围]

### 本周工作内容

#### 1. 主要工作
- [ ] 任务 1：[描述]
- [ ] 任务 2：[描述]
- [ ] 任务 3：[描述]

#### 2. 工作成果
- 成果 1：[描述]
- 成果 2：[描述]
- 成果 3：[描述]

#### 3. 遇到的问题
- 问题 1：[描述] - [解决方案]
- 问题 2：[描述] - [解决方案]

### 下周计划

#### 1. 重点任务
- [ ] 任务 1：[描述]
- [ ] 任务 2：[描述]

#### 2. 需要的支持
- 支持 1：[描述]
- 支持 2：[描述]

### 其他事项
- [备注]

## 使用场景

### 适合
- 每周工作总结
- 向上级汇报
- 团队内部分享

### 不适合
- 日报
- 月报
- 项目报告

## 自动化技巧

### Excel 自动化
```python
import pandas as pd

def generate_weekly_report(data):
    """
    自动生成周报
    """
    df = pd.DataFrame(data)
    
    # 统计工作量
    total_tasks = len(df)
    completed_tasks = len(df[df['status'] == '完成'])
    
    # 生成报告
    report = f"""
    本周工作总结：
    - 总任务数：{total_tasks}
    - 完成任务数：{completed_tasks}
    - 完成率：{completed_tasks/total_tasks*100:.1f}%
    """
    
    return report
```

## 相关概念

- [[daily-report]] - 日报模板
- [[monthly-report]] - 月报模板
- [[project-report]] - 项目报告模板
