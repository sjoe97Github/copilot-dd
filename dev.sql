-- define a select statement to get all students enrolled in a course   
-- define a select statement to get all students enrolled in a course
SELECT students.first_name, students.last_name, students.email, students.phone, students.city, students.state, students.zip_code
FROM courses.students
JOIN courses.registrations ON students.student_id = registrations.student_id
JOIN courses.registration_items ON registrations.registration_id = registration_items.registration_id
WHERE registration_items.course_id = 1
ORDER BY registrations.registration_date DESC;

-- create indexes to improve the performance of the previous query  
CREATE INDEX idx_course_id ON courses.registration_items (course_id);   
CREATE INDEX idx_student_id ON courses.registrations (student_id);  
CREATE INDEX idx_registration_id ON courses.registration_items (registration_id);   
CREATE INDEX idx_registration_date ON courses.registrations (registration_date);    

-- create a view to get all students enrolled in a course
CREATE VIEW courses.students_enrolled_in_course AS  
SELECT students.first_name, students.last_name, students.email, students.phone, students.city, students.state, students.zip_code    
FROM courses.students
JOIN courses.registrations ON students.student_id = registrations.student_id
JOIN courses.registration_items ON registrations.registration_id = registration_items.registration_id
WHERE registration_items.course_id = 1
ORDER BY registrations.registration_date DESC;

-- define a table for student attendance to capture attendance by class 
CREATE TABLE courses.student_attendance (
    attendance_id INT IDENTITY (1, 1) PRIMARY KEY,
    registration_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    attendance_status tinyint NOT NULL,
    -- Attendance status: 1 = Present; 2 = Absent; 3 = Late; 4 = Excused
    FOREIGN KEY (registration_id) REFERENCES courses.registrations (registration_id) ON DELETE CASCADE ON UPDATE CASCADE    
);

-- define a stored procedure to get course enrollment by location
CREATE PROCEDURE courses.GetCourseEnrollmentByLocation
    @city VARCHAR(50),
    @state VARCHAR(50),
    @zip_code VARCHAR(10)
AS
BEGIN
    SELECT students.first_name, students.last_name, students.email, students.phone, students.city, students.state, students.zip_code
    FROM courses.students
    JOIN courses.registrations ON students.student_id = registrations.student_id
    JOIN courses.registration_items ON registrations.registration_id = registration_items.registration_id
    WHERE registration_items.course_id = 1
    AND students.city = @city
    AND students.state = @state
    AND students.zip_code = @zip_code
    ORDER BY registrations.registration_date DESC;
END;

CREATE PROCEDURE GetInstructorDetailsByLocation
    @instructor_id INT
AS
BEGIN
    SELECT instructors.first_name, instructors.last_name, instructors.email, 
           locations.city, locations.state, locations.zip_code, 
           courses.course_name
    FROM instructors
    JOIN locations ON instructors.location_id = locations.location_id
    JOIN instructor_courses ON instructors.instructor_id = instructor_courses.instructor_id
    JOIN courses ON instructor_courses.course_id = courses.course_id
    WHERE instructors.instructor_id = @instructor_id;
END;

-- optimize the query by adding an index on the registration_date column
CREATE INDEX idx_registration_date ON courses.registration (registration_date);

SELECT * FROM courses.registration WHERE YEAR(registration_date) = 2023 AND MONTH(registration_date) = 9;

