drop table god_view;
drop table user_management;

CREATE TABLE IF NOT EXISTS user_management
(
    User_Id           serial8 PRIMARY KEY,
    User_Name         varchar unique,
    Email_Id          varchar unique,
    User_Password     varchar,
    recovery_question varchar,
    recovery_answer   varchar,
    User_Type         varchar default 'User',
    Created_At        timestamp default now()
);


CREATE TABLE IF NOT EXISTS god_view
(
    User_Id        INTEGER REFERENCES user_management (User_Id),
    User_Name      varchar REFERENCES user_management (User_Name),
    Email_Id       varchar REFERENCES user_management (Email_ID),
    location       varchar,
    IP_Address     varchar,
    Brower_Session varchar,
    Duration       timestamp,
    Last_Active    timestamp default now()
);

/*
INSERT INTO user_management(User_Name, Email_Id, User_Password, recovery_question, recovery_answer, User_Type) values ('admin','admin','admin','test','test','Admin')
 */
