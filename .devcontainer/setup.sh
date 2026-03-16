#!/usr/bin/env bash
set -euo pipefail

echo "[setup] Starting devcontainer setup..."

# --- Conda channels (bioconda stack) ---
echo "[setup] Configuring conda channels..."
/opt/conda/bin/conda config --system --add channels conda-forge || true
/opt/conda/bin/conda config --system --add channels bioconda || true
/opt/conda/bin/conda config --system --add channels defaults || true

# --- Python tooling for dev workflow ---
echo "[setup] Installing Python dev tools..."
/opt/conda/bin/python -m pip install --upgrade pip
/opt/conda/bin/python -m pip install pre-commit ipykernel

# Install repo requirements
echo "[setup] Installing requirements.txt..."
/opt/conda/bin/python -m pip install -r requirements.txt

# --- Jupyter kernel (Conda base) ---
echo "[setup] Registering Jupyter kernel..."
/opt/conda/bin/python -m ipykernel install --user --name=base --display-name "Python (Conda Base)" || true

# --- Nextflow install (pinned by NXF_VER) ---
echo "[setup] Installing Nextflow..."
mkdir -p "${NXF_HOME:-/workspaces/.nextflow}"

# Installs into current directory as ./nextflow, then move to /usr/local/bin
curl -fsSL https://get.nextflow.io | bash
sudo mv -f nextflow /usr/local/bin/nextflow

echo "[setup] Nextflow version:"
nextflow -version

# --- Verify Docker access (for -profile docker) ---
echo "[setup] Checking Docker availability..."
if docker version >/dev/null 2>&1; then
  echo "[setup] Docker OK"
else
  echo "[setup] WARNING: Docker not accessible inside devcontainer."
  echo "[setup] If you need -profile docker, switch feature to docker-in-docker OR fix docker-outside-of-docker permissions."
fi

echo "[setup] Done."