""" Реалізуйте базу даних, схема якої містить:

Таблиця студентів;
Таблицю груп;
Таблицю викладачів;
Таблицю предметів із вказівкою викладача, який читає предмет;
Таблицю, де у кожного студента є оцінки з предметів із зазначенням коли оцінку отримано;"""

import sqlite3
from constants_db import NAME_DB, MAKE_TABLES_SQL


def create_db(name_db=NAME_DB, make_table=MAKE_TABLES_SQL):
    # читаємо файл зі скриптом для створення БД
    with open(make_table, "r", encoding="utf-8") as f:
        sql_make_tales = f.read()

    # створюємо з'єднання з БД (якщо файлу БД немає, його буде створено)
    with sqlite3.connect(name_db) as con:
        cur = con.cursor()
        # виконуємо скрипт із файлу, який створить таблиці в БД
        cur.executescript(sql_make_tales)
    print(f" database {NAME_DB} created successfully")

if __name__ == "__main__":
    create_db()
