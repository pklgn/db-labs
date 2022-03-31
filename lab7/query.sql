-- 1. Добавить внешние ключи
CREATE INDEX IX_lesson_id_subject
    ON lesson (id_subject);

CREATE INDEX IX_lesson_id_teacher
    ON lesson (id_teacher);

CREATE INDEX IX_lesson_id_student
    ON mark (id_student);

CREATE INDEX IX_mark_id_lesson
    ON mark (id_lesson);

CREATE INDEX IX_student_id_group
    ON student (id_group);

ALTER TABLE lesson
    ADD CONSTRAINT FK_lesson_id_group
        FOREIGN KEY (id_group) REFERENCES `group` (id_group)
            ON UPDATE CASCADE ON DELETE CASCADE,

    ADD CONSTRAINT FK_lesson_id_subject
        FOREIGN KEY (id_subject) REFERENCES subject (id_subject)
            ON UPDATE CASCADE ON DELETE CASCADE,

    ADD CONSTRAINT FK_lesson_id_teacher
        FOREIGN KEY (id_teacher) REFERENCES teacher (id_teacher)
            ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE student
    ADD CONSTRAINT FK_student_id_group
        FOREIGN KEY (id_group) REFERENCES `group` (id_group)
            ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE mark
    ADD CONSTRAINT FK_mark_id_lesson
        FOREIGN KEY (id_lesson) REFERENCES lesson (id_lesson)
            ON UPDATE CASCADE ON DELETE CASCADE,

    ADD CONSTRAINT FK_mark_id_student
        FOREIGN KEY (id_student) REFERENCES student (id_student)
            ON UPDATE CASCADE ON DELETE CASCADE;


-- 2. Выдать оценки студентов по информатикеесли они обучаются данному предмету. Оформить выдачу данных с использованием view
CREATE VIEW informatics_mark AS
SELECT st.name, m.mark, l.date
FROM mark m
         JOIN lesson l ON m.id_lesson = l.id_lesson
         JOIN subject st ON l.id_subject = st.id_subject AND st.name = 'Информатика'
         JOIN student st ON m.id_student = st.id_student;

SELECT *
FROM informatics_mark;

/*
 3. Дать информацию о должниках с указанием фамилии студента и названия предмета. Должниками считаются студенты,
 не имеющие оценки по предмету,который ведется в группе. Оформить в виде процедуры, на входе идентификатор группы
 */
CREATE PROCEDURE get_bad_students(IN group_id INT)
BEGIN
    SELECT t.name, t.subject_name
    FROM (SELECT st.name, sb.name AS subject_name, MAX(m.mark) AS max_mark
          FROM `group` g
                   JOIN lesson l ON g.id_group = l.id_group
                   JOIN student st ON g.id_group = st.id_group
                   JOIN subject sb ON l.id_subject = sb.id_subject
                   LEFT JOIN mark m ON l.id_lesson = m.id_lesson AND st.id_student = m.id_student
          WHERE g.id_group = group_id
          GROUP BY st.name, sb.id_subject
          HAVING max_mark IS NULL) t;
END;
CALL get_bad_students(2);


-- 4. Дать среднюю оценку студентов по каждому предмету для тех предметов, по которым занимается не менее 35 студентов.
CREATE TEMPORARY TABLE subject_over_35_students
SELECT sb.id_subject, sb.name, COUNT(DISTINCT s.id_student) AS count
FROM `group` g
         JOIN lesson l ON g.id_group = l.id_group
         JOIN subject sb ON l.id_subject = sb.id_subject
         JOIN student s ON g.id_group = s.id_group
GROUP BY sb.name
HAVING count > 35;

SELECT subject_over_35_students.name, AVG(m.mark) AS average_mark
FROM subject_over_35_students
         JOIN lesson l ON subject_over_35_students.id_subject = l.id_subject
         JOIN student s ON s.id_group = l.id_group
         JOIN mark m ON l.id_lesson = m.id_lesson AND m.id_student = s.id_student
GROUP BY subject_over_35_students.name;

/*
 5. Дать оценки студентов специальности ВМ по всем проводимым предметам с
 указанием группы, фамилии, предмета, даты. При отсутствии оценки заполнить
 значениями NULL поля оценки.
 */
SELECT g.name, s.name, sb.name, l.date, m.mark
FROM `group` g
    JOIN lesson l ON g.id_group = l.id_group
    JOIN student s ON g.id_group = s.id_group
    JOIN subject sb ON l.id_subject = sb.id_subject
    LEFT JOIN mark m ON l.id_lesson = m.id_lesson AND s.id_student = m.id_student
WHERE g.name = 'ВМ';

-- 6. Всем студентам специальности ПС, получившим оценки меньшие 5 по предмету БД до 12.05, повысить эти оценки на 1 балл.
UPDATE mark m
    JOIN lesson l ON m.id_lesson = l.id_lesson AND l.date < '2019-05-12'
    JOIN lab7.subject s ON l.id_subject = s.id_subject AND s.name = 'БД'
    JOIN `group` g ON l.id_group = g.id_group AND g.name = 'ПС'
SET m.mark = m.mark + 1
WHERE m.mark < 5;