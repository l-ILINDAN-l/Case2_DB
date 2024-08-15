CREATE TABLE "User" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL,
    role VARCHAR(10) CHECK (role IN ('student', 'teacher', 'admin')) NOT NULL
);

CREATE TABLE Theory (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    video_url VARCHAR(255)
);

CREATE TABLE Hint (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL
);

CREATE TABLE Task (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    difficulty VARCHAR(10) CHECK (difficulty IN ('easy', 'medium', 'hard')) NOT NULL,
    theory_id INT REFERENCES Theory(id) ON DELETE SET NULL,
    hint_id_1 INT REFERENCES Hint(id) ON DELETE SET NULL,
    hint_id_2 INT REFERENCES Hint(id) ON DELETE SET NULL,
    hint_id_3 INT REFERENCES Hint(id) ON DELETE SET NULL,
    hint_id_4 INT REFERENCES Hint(id) ON DELETE SET NULL,
    hint_id_5 INT REFERENCES Hint(id) ON DELETE SET NULL
);

CREATE TABLE TaskPoints (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    task_id INT REFERENCES Task(id) ON DELETE CASCADE,
    points INT NOT NULL
);

CREATE TABLE UserPoints (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    total_points INT NOT NULL
);

CREATE TABLE UserTask (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    task_id INT REFERENCES Task(id) ON DELETE CASCADE,
    completion_date DATE NOT NULL,
    is_correct BOOLEAN,
    hints_used INT
);

CREATE TABLE Exam (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    creation_date DATE NOT NULL,
    total_tasks INT NOT NULL
);

CREATE TABLE ExamVariant (
    id SERIAL PRIMARY KEY,
    exam_id INT REFERENCES Exam(id) ON DELETE CASCADE,
    variant_number INT NOT NULL,
    task_id_1 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_2 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_3 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_4 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_5 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_6 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_7 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_8 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_9 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_10 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_11 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_12 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_13 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_14 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_15 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_16 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_17 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_18 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_19 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_20 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_21 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_22 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_23 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_24 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_25 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_26 INT REFERENCES Task(id) ON DELETE SET NULL,
    task_id_27 INT REFERENCES Task(id) ON DELETE SET NULL
);

CREATE TABLE ExamResult (
    id SERIAL PRIMARY KEY,
    exam_id INT REFERENCES Exam(id) ON DELETE CASCADE,
    user_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    score INT NOT NULL,
    completion_time INT NOT NULL
);

CREATE TABLE Progress (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    task_id INT REFERENCES Task(id) ON DELETE CASCADE,
    status VARCHAR(20) CHECK (status IN ('not_started', 'in_progress', 'completed')) NOT NULL
);

CREATE TABLE Recommendation (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    task_id INT REFERENCES Task(id) ON DELETE CASCADE,
    recommendation_date DATE NOT NULL
);

CREATE TABLE Feedback (
    id SERIAL PRIMARY KEY,
    user_task_id INT REFERENCES UserTask(id) ON DELETE CASCADE,
    teacher_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    feedback_text TEXT NOT NULL,
    feedback_date DATE NOT NULL
);

CREATE TABLE Achievement (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE UserAchievement (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    achievement_id INT REFERENCES Achievement(id) ON DELETE CASCADE,
    date_awarded DATE NOT NULL
);
