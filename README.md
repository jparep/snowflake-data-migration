# Snowflake Data Migration with PostgreSQL and Docker

This project demonstrates how to develop a PostgreSQL database using Docker and migrate data to Snowflake using state-of-the-art technology.

## Prerequisites

- Docker
- Docker Compose
- Snowflake Account
- Python 3.x (for migration scripts)
- `pip` (Python package installer)

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/jparep/snowflake-data-migration.git
cd snowflake-data-migration
```

### 2. Set Up PostgreSQL with Docker

Create a `docker-compose.yml` file to set up PostgreSQL:

```yaml
version: '3.1'

services:
    db:
        image: postgres:latest
        environment:
            POSTGRES_USER: yourusername
            POSTGRES_PASSWORD: yourpassword
            POSTGRES_DB: yourdatabase
        ports:
            - "5432:5432"
        volumes:
            - pgdata:/var/lib/postgresql/data

volumes:
    pgdata:
```

Start the PostgreSQL container:

```bash
docker-compose up -d
```

### 3. Initialize the Database

Connect to the PostgreSQL database and create tables:

```bash
docker exec -it <container_id> psql -U yourusername -d yourdatabase
```

Run your SQL scripts to create tables and insert initial data.

### 4. Install Python Dependencies

Create a `requirements.txt` file for the migration script:

```
snowflake-connector-python
pandas
sqlalchemy
```

Install the dependencies:

```bash
pip install -r requirements.txt
```

### 5. Configure Snowflake Connection

Create a `config.py` file to store Snowflake connection details:

```python
SNOWFLAKE_USER = 'your_snowflake_user'
SNOWFLAKE_PASSWORD = 'your_snowflake_password'
SNOWFLAKE_ACCOUNT = 'your_snowflake_account'
SNOWFLAKE_WAREHOUSE = 'your_snowflake_warehouse'
SNOWFLAKE_DATABASE = 'your_snowflake_database'
SNOWFLAKE_SCHEMA = 'your_snowflake_schema'
```

### 6. Write the Migration Script

Create a `migrate.py` script to transfer data from PostgreSQL to Snowflake:

```python
import pandas as pd
from sqlalchemy import create_engine
import snowflake.connector
from config import *

# PostgreSQL connection
pg_engine = create_engine('postgresql://yourusername:yourpassword@localhost:5432/yourdatabase')

# Snowflake connection
sf_conn = snowflake.connector.connect(
        user=SNOWFLAKE_USER,
        password=SNOWFLAKE_PASSWORD,
        account=SNOWFLAKE_ACCOUNT,
        warehouse=SNOWFLAKE_WAREHOUSE,
        database=SNOWFLAKE_DATABASE,
        schema=SNOWFLAKE_SCHEMA
)

# Read data from PostgreSQL
df = pd.read_sql('SELECT * FROM your_table', pg_engine)

# Write data to Snowflake
write_pandas(sf_conn, df, 'your_table')

sf_conn.close()
```

### 7. Run the Migration

Execute the migration script:

```bash
python migrate.py
```

## Conclusion

You have successfully set up a PostgreSQL database using Docker and migrated data to Snowflake. This setup can be extended and customized based on your specific requirements.

## License

This project is licensed under the MIT License.