create table building
(
    id_building        int auto_increment
        primary key,
    address            varchar(255) null,
    date_commissioning date         not null,
    type               varchar(255) null,
    owner              varchar(255) null,
    cost               int          null
);

create table expense
(
    id_expanse  int auto_increment
        primary key,
    name        varchar(255) null,
    description varchar(255) null,
    price       int          null,
    date_start  date         null,
    date_end    date         null
);

create table flat
(
    id_flat     int auto_increment
        primary key,
    number      int               not null,
    area        int               not null,
    id_building int               null,
    cost        int               null,
    type        varchar(255)      null,
    room_number tinyint default 1 null,
    constraint flat_building_id_building_fk
        foreign key (id_building) references building (id_building)
);

create table person
(
    id_person    int auto_increment
        primary key,
    first_name   varchar(255) not null,
    last_name    varchar(255) null,
    date_birth   date         not null,
    phone        varchar(11)  null,
    bank_account varchar(255) null,
    id_expanse   int          null,
    constraint person_expense_id_expanse_fk
        foreign key (id_expanse) references expense (id_expanse)
);

create table person_has_flat
(
    id_person int         not null
        primary key,
    id_flat   int         not null,
    ownership varchar(50) not null,
    constraint person_has_flat_flat_id_flat_fk
        foreign key (id_flat) references flat (id_flat),
    constraint person_has_flat_person_id_person_fk
        foreign key (id_person) references person (id_person)
);

create table service
(
    id_service      int auto_increment
        primary key,
    id_utility_rate int not null,
    coefficient     int null,
    id_flat         int not null
);

create table utility_rate
(
    id_utility_rate int auto_increment
        primary key,
    name            varchar(255) not null,
    description     varchar(255) null,
    price           int          null,
    date_start      date         null,
    date_end        date         not null
);

create table payment
(
    id_payment       int auto_increment
        primary key,
    id_person        int      not null,
    id_utility_rate  int      null,
    period_start     date     null,
    period_end       date     null,
    datetime_payment datetime null,
    cost             int      null,
    constraint payment_person_id_person_fk
        foreign key (id_person) references person (id_person),
    constraint payment_utility_rate_id_utility_rate_fk
        foreign key (id_utility_rate) references utility_rate (id_utility_rate)
);
