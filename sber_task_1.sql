/*Есть две таблицы:
students – список студентов, поля: name (имя студента), group (группа), passed (признак успешного прохождения экзаменов).
exams – результаты экзамена, поля: name (имя студента), exam (предмет), score (оценка), year (год), period (период).*/

/*Напишите SQL-запрос:
a)	Который выставляет passed = 1 всем студентам 2-ой и 3-ей группы, у которых сумма баллов по всем экзаменам больше 36.
b)	Который выводит количество отличников и хорошистов в каждой группе по каждому предмету за 2-ой период 2021 года.
c)	Который выводит список итоговых оценок студентов по предметам (итоговая оценка – последняя оценка по предмету).
В качестве решения необходимо приложить файл с запросами.*/

--a)
CREATE VIEW temp_score as SELECT name, SUM(score)>36 AS score FROM exams GROUP BY name;
UPDATE sutdents SET passed = (SELECT score FROM temp_score WHERE temp_score.name = students.name) WHERE `group` > 1 AND `group` < 4;
DROP VIEW temp_score;

--b)
SELECT * FROM exams WHERE `score` > 3 AND `period` = 2 AND `year` = 2021;

--c)
SELECT name, score, exam FROM exams WHERE year = (SELECT max(year) WHERE exams) AND period = 2 ORDER BY name;

