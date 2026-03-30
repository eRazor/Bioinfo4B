# Single-Cell Differential Gene Expression

## Project scope and goals

**Objective:** Identify genes differentially expressed in response to BMP4 perturbation in `gehring_2019`.

In this notebook we will:

- compare `control` cells against `BMP4`-perturbed cells,
- account for `batch` and `dose_value` during the analysis,
- use exploratory clustering to understand the structure of the dataset,
- aggregate cells into pseudobulk profiles and test differential expression with `edgeR`,
- interpret the strongest BMP4-responsive genes in a biological context.

## Background

The `gehring_2019` dataset is a large-scale single-cell perturbation experiment in mouse neural stem cells. The study profiles cells exposed to multiple perturbagens and dose combinations. Here we focus on the BMP4 response and use it as a compact example of differential expression analysis for a complex design.

For the general workflow, see the sc-best-practices differential expression chapter:
https://www.sc-best-practices.org/conditions/differential_gene_expression.html

## Reproducible environment

Instead of installing packages inline with `!pip install`, keep the software stack in a dedicated environment file such as `environment.yml` or `requirements.txt`.

For this project, use the environment specification stored next to the notebook:

- `environment.yml`

The key packages we want to record are:

- Python: `scanpy`, `pertpy`, `rpy2`
- R / Bioconductor: `edgeR`, `SingleCellExperiment`

