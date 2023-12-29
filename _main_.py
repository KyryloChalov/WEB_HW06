""" Домашнє завдання #6

Реалізуйте базу даних
Заповніть отриману базу даних випадковими даними
Зробити вибірки з отриманої бази даних
"""

from make_db import create_db
from fill_db import prepare_data, generate_fake_data, insert_data_to_db
from run_sql import run_queries


def main():
    tuple_data = prepare_data(*generate_fake_data())
    create_db()
    insert_data_to_db(*tuple_data)
    run_queries()


if __name__ == "__main__":
    main()
