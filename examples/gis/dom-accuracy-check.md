---
title: DOM 数学精度检验示例
type: wiki
stage: compiled
entity_type: concept
domain: gis
confidence: high
tags:
  - gis
  - wiki
  - DOM
  - 精度检验
  - 自动化
created: 2026-06-24
updated: 2026-06-24
sources:
  - "[[raw/gis/2026-06-24_dom-accuracy-check.md]]"
has_counter_arguments: false
---

# DOM 数学精度检验示例

这是一个 GIS 测绘质检领域的 Wiki 文章示例。

## 核心概念

DOM（数字正射影像图）的数学精度检验是测绘质检的核心环节，用于验证 DOM 的平面位置精度是否符合国家规范要求。

## 检验标准

### 国家标准
- **GB/T 18316-2008**《数字测绘成果质量检查与验收》

### 精度要求

| 比例尺 | 允许中误差 | 说明 |
|--------|------------|------|
| 1:500 | ≤ 0.5mm | 图上距离 |
| 1:1000 | ≤ 0.5mm | 图上距离 |
| 1:2000 | ≤ 0.5mm | 图上距离 |

## 检验流程

### 步骤 1：检查点选取
- 数量：不少于 20 个
- 分布：均匀覆盖整个测区
- 类型：明显地物点

### 步骤 2：坐标量测
- 在 DOM 上量测检查点坐标
- 获取检查点真值
- 计算坐标差

### 步骤 3：精度计算

**中误差公式**：
```
M = sqrt(Σ(Δx² + Δy²) / n)
```

### 步骤 4：结果判定
- M ≤ 允许中误差 → 合格
- M > 允许中误差 → 不合格

## 自动化脚本

```python
import numpy as np
from osgeo import gdal

def check_dom_accuracy(dom_path, check_points, allow_error=0.5):
    """
    自动化检验 DOM 数学精度
    """
    # 读取 DOM
    ds = gdal.Open(dom_path)
    geotransform = ds.GetGeoTransform()
    
    errors = []
    for x, y, true_x, true_y in check_points:
        delta_x = x - true_x
        delta_y = y - true_y
        errors.append((delta_x, delta_y))
    
    # 计算中误差
    errors = np.array(errors)
    mse = np.sqrt(np.mean(errors[:, 0]**2 + errors[:, 1]**2))
    
    return {
        'mse': mse,
        'allow_error': allow_error,
        'is_qualified': mse <= allow_error
    }
```

## 相关概念

- [[dom-quality]] - DOM 影像质量检验
- [[3d-model-quality]] - 三维模型质量检验
- [[coordinate-system]] - 坐标系统
