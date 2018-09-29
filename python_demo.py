import sqlalchemy
from sqlalchemy import text
import pandas as pd

class DatabaseConnection:

    def __init__(self, connection_string):
        self.db = sqlalchemy.create_engine(connection_string)
        self.connection = self.db.connect()

USER_NAME = "_"
PASSWORD = "_"
HOST = "_"
DATABASE = "pagila_mod"


if __name__ == "__main__":

    CONNECTION_STRING = f"postgresql+psycopg2://{USER_NAME}:{PASSWORD}@{HOST}/{DATABASE}"
    # connect to the database in Virginia
    database = DatabaseConnection(CONNECTION_STRING)

    # retrieve all records from the film table
    results = database.connection.execute(text("SELECT * FROM film"))

    # load it into Python as a dataframe
    data = pd.DataFrame(results.fetchall(), columns=results.keys())

    # iterate through each row and print results
    for i, row in data.iterrows():
        if "Touching" in row["description"]:
            print(f"We found a touching film!: {row['title']}")