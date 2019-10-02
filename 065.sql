/*Please add ; after each select statement*/
CREATE PROCEDURE storageOptimization()
BEGIN
    SELECT 
    d.id,
    d.column_name, 
    d.v as 'value'
    FROM 
    (
        SELECT 
        id
        , name as v
        , 'name' as column_name
        , 1 as column_order
        FROM workers_info
        UNION 
        SELECT 
        id
        , date_of_birth as v
        , 'date_of_birth' as column_name
        , 2 as column_order
        FROM workers_info
        UNION
        SELECT 
        id
        , salary as v
        , 'salary' as column_name
        , 3 as column_order
        FROM workers_info
    ) d
    WHERE d.v IS NOT NULL
    ORDER BY d.id, d.column_order
    ;
END