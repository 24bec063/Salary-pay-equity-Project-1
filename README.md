# Machine Learning: Salary Prediction & Fairness Analysis

A comprehensive machine learning project for predicting developer salaries and analyzing pay fairness using Stack Overflow survey data.

## 🎯 Project Overview

This project consists of two main tasks:

### **Task 1: Salary Prediction (Regression)**
- **Goal**: Predict developer salaries based on experience, education, role, and location
- **Models Used**: 
  - Linear Regression (baseline)
  - Random Forest Regressor (main model)
- **Evaluation Metrics**: MAE, RMSE, R²
- **Output**: Feature importance analysis showing key salary factors

### **Task 2: Salary Fairness Classification**
- **Goal**: Classify whether developers are paid fairly relative to their predicted salary
- **Definition**: Fair = Actual Salary ≥ 80% of Predicted Salary
- **Model Used**: Logistic Regression
- **Evaluation Metrics**: Accuracy, Precision, Recall, F1-score, ROC-AUC
- **Output**: Feature analysis showing which factors affect pay fairness

## 📊 Dataset

- **Source**: Stack Overflow Developer Survey (2024)
- **Size**: ~65,000 survey responses, 114 columns
- **Key Features Used**:
  - ConvertedCompYearly (Target for regression)
  - YearsCodePro (Years of professional experience)
  - Country, Education Level, Job Role
  - Age, Employment Type, Organization Size

## 🗂️ Project Structure

```
project/
├── notebooks/                     # Jupyter notebooks
│   ├── README.md
│   └── project.ipynb              # Main project notebook
├── .gitignore                 # Git ignore rules
├── PROJECT_LOG.MD             # log file
├── README.md                  # This file
├── requirements.txt           # Python dependencies
└── run.sh                     # Automated execution script
```


## 🚀 Quick Start

### Prerequisites
- Python 3.8+
- Git
- pip or conda

### Installation

1. **Clone the repository**:
```bash
git clone https://github.com/24bec063/Salary-pay-equity-analysis-Project.git
cd Salary-pay-equity-analysis-Project
code .
```

2. **Create a virtual environment**:
```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

3. **Install dependencies**:
```bash
pip install -r requirements.txt
```

4. **Download the dataset**:
- Download `survey_results_public.csv` from [Stack Overflow Survey](https://survey.stackoverflow.co/) for the year 2024.
- Place it in the same folder

### Running the Project

**Option 1: Automated execution**
```bash
bash run.sh
```

**Option 2: Manual Jupyter execution**
```bash
jupyter notebook notebooks/project.ipynb
```

## 📁 File Descriptions

| File | Purpose |
|------|---------|
| `project.ipynb` | Main Jupyter notebook with full analysis |
| `run.sh` | Automated script to install dependencies and run notebook |
| `requirements.txt` | Python package dependencies |
| `salary_prediction_results.csv` | Model predictions and residuals |

## 🛠️ Technology Stack

- **Data Processing**: pandas, numpy
- **Visualization**: matplotlib, seaborn
- **Machine Learning**: scikit-learn
- **Notebooks**: Jupyter
- **Environment**: Python 3.13+

## 📊 Dependencies

All required packages are listed in `requirements.txt`:
```
pandas>=2.0.0
numpy>=1.24.0
matplotlib>=3.7.0
seaborn>=0.12.0
scikit-learn>=1.3.0
jupyter>=1.0.0
nbconvert>=7.8.0
```

## 📝 Notes

- The dataset is large (~153 MB) and is not included in the Git repository
- First run will take 5-10 minutes to process the data and train models
- Results are saved to `reports/salary_prediction_results.csv`

---

**Last Updated**: November 17, 2025
