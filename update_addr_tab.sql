DECLARE
    -- Declare a collection type to store StudentIDs
    TYPE student_id_list IS TABLE OF address.StudentID%TYPE;
    
    -- Declare a variable of the collection type
    v_student_ids student_id_list := student_id_list();
    v_address_ids student_id_list := student_id_list();
BEGIN
    -- Populate the collection with distinct StudentIDs from the Student table
    --SELECT DISTINCT StudentID BULK COLLECT INTO v_student_ids FROM Student;
select studentid,addressid BULK COLLECT INTO v_student_ids,v_address_ids
from
(select studentid,rownum as student_no from student)std,
(select addressid,rownum as address_no from address)addr
where std.student_no=addr.address_no;
    -- Iterate through the collection and update the Address table
    FOR i IN 1..v_student_ids.COUNT LOOP
        UPDATE Address
        SET StudentID = v_student_ids(i)
        WHERE addressid =v_address_ids(i);--5; -- Add any additional conditions here if needed
        
        -- Commit the changes after each update
        COMMIT;
    END LOOP;
END;
/
DECLARE
    -- Declare a cursor to fetch distinct StudentIDs
    CURSOR student_ids_cur IS
        SELECT DISTINCT StudentID FROM Student;

    -- Declare variables
    v_student_id Student.StudentID%TYPE;
BEGIN
    -- Open the cursor
    OPEN student_ids_cur;

    -- Fetch and process each StudentID
    LOOP
        FETCH student_ids_cur INTO v_student_id;
        EXIT WHEN student_ids_cur%NOTFOUND;

        -- Update the Address table based on the StudentID
        UPDATE Address
        SET StudentID = v_student_id
        WHERE StudentID =6; -- Add any additional conditions here if needed

        -- Commit the changes after each update
        COMMIT;
    END LOOP;

    -- Close the cursor
    CLOSE student_ids_cur;
END;
/