# Spatial Omics Analysis Project  

## Project Overview

In this project, you will perform **spatial omics analysis** using mouse brain data.  
You will follow established best-practice workflows and apply them to a new dataset.

We will use tutorials from:

- https://www.sc-best-practices.org/spatial/domains.html  
- https://www.sc-best-practices.org/spatial/neighborhood.html  

---

## Objectives

By the end of this project, you will be able to:

- Load and preprocess **spatial transcriptomics data**
- Perform **spatial domain identification**
- Analyze **cellular neighborhoods**

---

## Dataset

Instead of the dataset used in the tutorial, you will analyze:

**Mouse Brain Coronal Section 1 (FFPE)**  
https://www.10xgenomics.com/datasets/mouse-brain-coronal-section-1-ffpe-2-standard  

👉 Click **“View summary”** on the dataset page to explore details.

---

## Data Download

Download the following files:

### 1. Feature / Barcode Matrix (HDF5)
https://cf.10xgenomics.com/samples/spatial-exp/2.0.0/CytAssist_FFPE_Mouse_Brain_Rep1/CytAssist_FFPE_Mouse_Brain_Rep1_filtered_feature_bc_matrix.h5

### 2. Spatial Imaging Data
https://cf.10xgenomics.com/samples/spatial-exp/1.3.0/Visium_Adult_Mouse_Brain/Visium_Adult_Mouse_Brain_spatial.tar.gz

### 3. Clustering Analysis Results
https://cf.10xgenomics.com/samples/spatial-exp/2.0.0/CytAssist_FFPE_Mouse_Brain_Rep1/CytAssist_FFPE_Mouse_Brain_Rep1_analysis.tar.gz

---

### Folder structure

```
sample_folder/
├── spatial/
│   ├── tissue_hires_image.png
│   ├── scalefactors_json.json
│   └── tissue_positions.csv   (or tissue_positions_list.csv)
├── filtered_feature_bc_matrix.h5
├── clusters.csv
```

### Data Loading 

```Python
import scanpy as sc

adata = sc.read_visium(
    path="path_to_project_folder/",
    count_file="filtered_feature_bc_matrix.h5"
)

adata.var_names_make_unique()
```

## Analysis Tasks

Follow the workflows from the tutorials:

Part 1: Spatial Domains

- Normalize data
- Perform dimensionality reduction
- Cluster spatial spots
- Visualize spatial domains

Part 2: Neighborhood Analysis

- Identify spatial neighborhoods
- Analyze cell-cell interactions
- Compare spatial patterns across regions

## Expected Outputs
A Jupyter / Colab Notebook including:
- Spatial cluster plots
- UMAP / embedding visualizations
- Neighborhood interaction maps
- Biological interpretation