<#
run.ps1 - Execute the Machine Learning project end-to-end on Windows (PowerShell)

Usage (PowerShell):
  Open PowerShell in the project directory and run:
    .\run.ps1

Notes:
  - Requires Python on PATH.
  - Installs dependencies from requirements.txt using pip.
  - Backs up an existing 'notebooks' file if it conflicts, then creates a 'notebooks' directory.
  - Executes the notebook with `python -m nbconvert`.
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Write-Host '========================================='
Write-Host 'Machine Learning Project - End-to-End Execution (PowerShell)'
Write-Host '========================================='

$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
Set-Location $scriptDir

# Check for python
if (Get-Command python3 -ErrorAction SilentlyContinue) {
    $python = 'python3'
} elseif (Get-Command python -ErrorAction SilentlyContinue) {
    $python = 'python'
} else {
    Write-Error 'Python is not installed or not on PATH.'
    exit 1
}

Write-Host "[1/4] Installing dependencies from requirements.txt..."
& $python -m pip install -q -r requirements.txt

Write-Host "[2/4] Checking if survey data exists..."
$dataFile = Join-Path $scriptDir 'survey_results_public.csv'
if (-not (Test-Path $dataFile -PathType Leaf)) {
    Write-Error "Error: survey_results_public.csv not found in project root: $scriptDir"
    exit 1
}
Write-Host "Data file found: $dataFile"

Write-Host "[3/4] Executing the project notebook..."
$notebookFile = Join-Path $scriptDir 'project.ipynb'
if (-not (Test-Path $notebookFile -PathType Leaf)) {
    Write-Error "Error: project.ipynb not found in project root: $scriptDir"
    exit 1
}

if (Get-Command jupyter -ErrorAction SilentlyContinue) {
    jupyter nbconvert --to notebook --execute $notebookFile --output project_output.ipynb
} else {
    & $python -m nbconvert --to notebook --execute $notebookFile --output project_output.ipynb
}

Write-Host '========================================='
Write-Host '✓ Project execution completed successfully!'
Write-Host 'Results saved to:'
Write-Host '  - salary_prediction_results.csv (if produced by the notebook)'
Write-Host '  - project_output.ipynb (executed notebook)'
Write-Host '========================================='
