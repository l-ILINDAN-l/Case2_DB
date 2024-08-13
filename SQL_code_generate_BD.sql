CREATE TABLE "User" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP NOT NULL,
    role VARCHAR(10) CHECK (role IN ('student', 'teacher', 'admin')) NOT NULL
);

CREATE TABLE Theory (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    video_url VARCHAR(255)
);

CREATE TABLE Task (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    difficulty VARCHAR(10) CHECK (difficulty IN ('easy', 'medium', 'hard')) NOT NULL,
    theory_id INT REFERENCES Theory(id) ON DELETE SET NULL
);

CREATE TABLE UserTask (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    task_id INT REFERENCES Task(id) ON DELETE CASCADE,
    completion_date TIMESTAMP NOT NULL,
    is_correct BOOLEAN,
    hints_used INT
);

CREATE TABLE Exam (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    creation_date TIMESTAMP NOT NULL,
    total_tasks INT NOT NULL
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
    recommendation_date TIMESTAMP NOT NULL
);

CREATE TABLE Feedback (
    id SERIAL PRIMARY KEY,
    user_task_id INT REFERENCES UserTask(id) ON DELETE CASCADE,
    teacher_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    feedback_text TEXT NOT NULL,
    feedback_date TIMESTAMP NOT NULL
);

CREATE TABLE Gamification (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES "User"(id) ON DELETE CASCADE,
    points INT NOT NULL,
    badges VARCHAR(255)
);
