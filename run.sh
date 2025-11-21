echo ""
echo "[1/4] Installing dependencies from requirements.txt..."
echo ""
echo "[2/4] Checking if survey data exists..."
echo "Data file found: survey_results_public.csv"
echo "[3/4] Executing the project notebook..."
echo ""
echo "========================================="
echo "✓ Project execution completed successfully!"
echo "Results saved to:"
echo "  - salary_prediction_results.csv"
echo "  - notebooks/project_output.ipynb (executed notebook)"
echo "========================================="
#!/usr/bin/env bash
# run.sh - Execute the Machine Learning project end-to-end (Linux / macOS / Git Bash / WSL)

set -euo pipefail

echo "========================================="
echo "Machine Learning Project - End-to-End Execution"
echo "========================================="

# Determine script directory so paths are predictable
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Activate virtual environment if it exists
if [ -f ".venv/bin/activate" ]; then
    # shellcheck source=/dev/null
    source .venv/bin/activate
    echo "Virtual environment activated."
fi

# Find a python executable (prefer python3)
if command -v python3 &> /dev/null; then
    PYTHON=python3
elif command -v python &> /dev/null; then
    PYTHON=python
else
    echo "Error: Python is not installed or not on PATH."
    exit 1
fi

echo ""
echo "[1/4] Installing dependencies from requirements.txt..."
"$PYTHON" -m pip install -q -r requirements.txt

echo ""
echo "[2/4] Checking if survey data exists..."
DATA_FILE="$SCRIPT_DIR/survey_results_public.csv"
if [ ! -f "$DATA_FILE" ]; then
    echo "Error: survey_results_public.csv not found in project root: $SCRIPT_DIR"
    echo "Please ensure the data file is present."
    exit 1
fi

echo "Data file found: $DATA_FILE"

echo ""
echo "[3/4] Executing the project notebook..."
NOTEBOOK_FILE="$SCRIPT_DIR/project.ipynb"
if [ ! -f "$NOTEBOOK_FILE" ]; then
    echo "Error: project.ipynb not found in project root: $SCRIPT_DIR"
    exit 1
fi

# Run the notebook using nbconvert via the Python interpreter (prefer portable invocation)
if command -v jupyter &> /dev/null; then
    # prefer jupyter CLI if available
    jupyter nbconvert --to notebook --execute "$NOTEBOOK_FILE" --output project_output.ipynb
else
    # fall back to python -m nbconvert
    "${PYTHON}" -m nbconvert --to notebook --execute "$NOTEBOOK_FILE" --output project_output.ipynb
fi

echo ""
echo "========================================="
echo "✓ Project execution completed successfully!"
echo "Results saved to:"
echo "  - salary_prediction_results.csv (if produced by the notebook)"
echo "  - project_output.ipynb (executed notebook)"
echo "========================================="

echo ""
echo "Notes:"
echo "  - On Linux/macOS run: ./run.sh"
echo "  - On Windows use Git Bash or WSL and run: ./run.sh"
echo "  - For native PowerShell on Windows use: ./run.ps1"
