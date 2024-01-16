CREATE TABLE ASSIGNMENT(
                        AssignmentID NUMBER(10) CONSTRAINT Aa_ID_PK PRIMARY KEY,
                        CourseID NUMBER(10),
                        AssignmentName VARCHAR2(20),
                        DueDate DATE,
                        FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
                        );
/
CREATE TABLE Submission(
                        SubmissionID NUMBER(10) CONSTRAINT S_ID_PK PRIMARY KEY,
                        AssignmentID NUMBER(10),
                        StudentID NUMBER(10),
                        SubmissionDate DATE,
                        Grade VARCHAR2(10),
                        FOREIGN KEY (AssignmentID) REFERENCES ASSIGNMENT(AssignmentID),
                        FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
                        );
/
CREATE TABLE Library(
                        BookID NUMBER(10) CONSTRAINT B_ID_PK PRIMARY KEY,
                        Title VARCHAR2(20),
                        Author VARCHAR2(20),
                        ISBN NUMBER(10),
                        AvailableCopies NUMBER(5)
                        );
/
CREATE TABLE Borrowing(
                        BorrowingID NUMBER(5) CONSTRAINT BD_ID_PK PRIMARY KEY,
                        StudentID NUMBER(10),
                        BookID NUMBER(10),
                        BorrowDate DATE,
                        ReturnDate DATE,
                        CONSTRAINT STDD_ID_FK FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
                        CONSTRAINT B_D_FK FOREIGN KEY (BookID) REFERENCES Library(BookID));
/
