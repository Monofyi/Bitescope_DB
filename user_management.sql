drop table god_view;
drop table user_management;

create table if not exists user_management
(
    user_id           bigserial    not null primary key,
    f_name            varchar(100) not null,
    l_name            varchar(100) not null,
    user_name         varchar(100) not null unique ,
    phone_no          integer      not null unique,
    email_id          varchar(100) not null,
    user_password     varchar(100) not null,
    recovery_question varchar(100) not null,
    recovery_answer   varchar(100) not null,
    user_type         varchar(100) default 1,
    created_at        timestamp default current_timestamp,
    last_login        time default null
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

insert into user_management(f_name, l_name, user_name, phone_no, email_id, user_password, recovery_question, recovery_answer, user_type) values
('Divakar','R','rex','123','email.com','123','whoami','rex',1)

*/
