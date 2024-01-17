BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO Submission (SubmissionID, AssignmentID, StudentID, SubmissionDate, Grade) VALUES 
        (i, TRUNC(DBMS_RANDOM.VALUE(1, 10)), TRUNC(DBMS_RANDOM.VALUE(1, 20)), SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 30)), CASE WHEN DBMS_RANDOM.VALUE < 0.7 THEN NULL ELSE 'A' END);
    END LOOP;
    COMMIT;
END;
/
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO Submission (SubmissionID, AssignmentID, StudentID, SubmissionDate, Grade) VALUES 
        (i, TRUNC(DBMS_RANDOM.VALUE(1, 10)), TRUNC(DBMS_RANDOM.VALUE(1, 20)), SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 30)), CASE WHEN DBMS_RANDOM.VALUE < 0.7 THEN NULL ELSE 'A' END);
    END LOOP;
    COMMIT;
END;
/
BEGIN
    FOR i IN 1..400 LOOP
        INSERT INTO Parent (ParentID, FirstName, LastName, Email, Phone) VALUES 
        (i, 'Name_' || i, 'LName_' || i,  i || 'xyz@com',  LPAD(i, 5, '11033'));
    END LOOP;
    COMMIT;
END;
/
