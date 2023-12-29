"""Заповніть отриману базу даних випадковими даними 
(~30-50 студентів, 3 групи, 5-8 предметів, 3-5 викладачів, 
до 20 оцінок у кожного студента з усіх предметів). 
Використовуйте пакет Faker для наповнення."""


from datetime import datetime
from random import randint
import sqlite3
from faker import Faker
from make_db import create_db
from constants_db import NAME_DB

NUMBER_STUDENTS = 50
NUMBER_TEACHERS = 5
NUMBER_SCORES = 20
MAX_SCORE = 5

GROUPS = ["AA-91", "AA-92", "AA-93"]
SUBJECTS = [
    "Python Core",
    "Python WEB",
    "Python Development",
    "Патерни проєктування",
    "Реляційні бази даних",
    "Асинхронне програмування",
    "Штучний інтелект",
]


def generate_fake_data() -> tuple:
    """generate fake data"""
    fake_data = Faker(locale="uk_UA")

    fake_groups = GROUPS
    fake_subjects = SUBJECTS
    fake_students = [fake_data.unique.name() for _ in range(NUMBER_STUDENTS)]
    fake_teachers = [fake_data.unique.name() for _ in range(NUMBER_TEACHERS)]

    end_date = datetime.now().date()
    # calculate studies start date
    offset = 0 if end_date.month < 9 else 1
    start_date = datetime(datetime.now().year - offset, 9, 1).date()

    fake_dates = [
        fake_data.date_between(start_date, end_date)
        for _ in range(int(NUMBER_STUDENTS * NUMBER_SCORES))
    ]

    return fake_groups, fake_students, fake_teachers, fake_subjects, fake_dates


def prepare_data(
    _groups: list,
    _students: list,
    _teachers: list,
    _subjects: list,
    _grades_dates: list,
) -> tuple:
    """prepare data "tuple(list(tuple))" """

    for_groups = [(group,) for group in _groups]
    for_students = [(student, randint(1, len(_groups))) for student in _students]
    for_teachers = [(teacher,) for teacher in _teachers]
    for_subjects = [(subject, randint(1, len(_teachers))) for subject in _subjects]

    for_grades = []

    for grades_date in _grades_dates:
        # data format:
        # tuple(student_id, subject_id, grade, grade_date)
        for_grades.append(
            (
                randint(1, len(for_students)),
                randint(1, len(for_subjects)),
                randint(1, MAX_SCORE),
                grades_date,
            )
        )

    return for_groups, for_students, for_teachers, for_subjects, for_grades


def insert_data_to_db(
    _groups: tuple,
    _students: tuple,
    _teachers: tuple,
    _subjects: tuple,
    _grades: tuple,
    db_name: str = NAME_DB,
) -> None:
    """insert data to db"""

    with sqlite3.connect(db_name) as con:
        # get DB cursor
        cur = con.cursor()

        # prepare sql statements
        sql_to_groups = """INSERT INTO groups(name) VALUES (?)"""
        sql_to_teachers = """INSERT INTO teachers(name) VALUES (?)"""
        sql_to_students = """INSERT INTO students(name, group_id) VALUES (?, ?)"""
        sql_to_subjects = """INSERT INTO subjects(name, teacher_id) VALUES (?, ?)"""
        sql_to_grades = """INSERT INTO grades(student_id, subject_id, grade, grade_date) VALUES (?, ?, ?, ?)"""

        # execute sql statements
        cur.executemany(sql_to_groups, _groups)
        cur.executemany(sql_to_teachers, _teachers)
        cur.executemany(sql_to_students, _students)
        cur.executemany(sql_to_subjects, _subjects)
        cur.executemany(sql_to_grades, _grades)

        # Commit DB change
        con.commit()


if __name__ == "__main__":
    groups, students, teachers, subjects, grades = prepare_data(*generate_fake_data())
    create_db()
    insert_data_to_db(groups, students, teachers, subjects, grades)
