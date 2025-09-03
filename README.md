# Anime & Manga Analytics ELT Pipeline  

## 📌 Overview  
This project implements an **ELT (Extract–Load–Transform)** pipeline for analyzing anime and manga datasets.  
It leverages **Dagster** for orchestration, **dbt** for SQL-based transformations, and **Postgres** as the database backend.  

The workflow follows the **ELT pattern**:  
1. **Extract** – Raw anime and manga datasets are downloaded from external sources (CSV files).  
2. **Load** – Raw datasets are ingested into a **Postgres** database.  
3. **Transform** – dbt models clean, transform, and aggregate the data into analytics-ready tables.  

---

## 🏗 Project Structure  
project/

├── anime_manga/ # dbt project
├── analyses/ # Custom dbt analysis queries
├── logs/ # dbt logs
├── macros/ # dbt macros
├── models/ # dbt models (SQL transformations)
│ ├── bronze/ # Raw staging models
│ ├── silver/ # Cleaned models
│ └── gold/ # Aggregated analytics models
├── seeds/ # Seed data (CSV for dbt)
├── snapshots/ # Snapshots for slowly changing dimensions

├── target/ # dbt compiled output

├── etl_pipeline/ # Orchestration with Dagster

│ └── dagster_dbt_assets.py # Dagster assets + dbt integration

├── raw.datasets/ # Raw input datasets (CSV files)

│ ├── MAL-anime.csv

│ └── MAL-manga.csv

├── postgresql/ # Database setup

│ └── logs/ # Database logs

├── docker-compose.yaml # Dockerized Postgres service

├── psql_schemas.sql # SQL schema definitions

├── dataset_download.py # Script to download raw datasets

├── requirements.txt # Python dependencies

├── profiles.yml # dbt profiles for Postgres

├── dbt_project.yml # dbt project configuration

└── README.md # Project documentation

## Setup
pip install -r requirements.txt
docker-compose up -d
dagster dev
dbt build

## 📊 Data Flow

Raw Data → downloaded with dataset_download.py and stored in raw.datasets/.

Load → ingested into Postgres (bronze layer).

Transform → dbt models create silver (cleaned) and gold (analytics) tables.

Analytics → tables like gap_score.sql and ascore_analytics.sql provide insights.

## 🔧 Tech Stack

Dagster → Orchestration and asset management.

dbt → SQL-based transformations.

Postgres → Data warehouse.

Docker → Containerized database setup.

Python → Data extraction & pipeline glue code
