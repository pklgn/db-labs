create table building
(
    id_building        int auto_increment
        primary key,
    type               varchar(255)   null,
    owner              varchar(255)   null,
    address            varchar(255)   null,
    date_commissioning date           not null,
    cost               decimal(19, 2) null
);

create table flat
(
    id_flat         int auto_increment
        primary key,
    number          int               not null,
    area            int               not null,
    id_building     int               null,
    cost            decimal(19, 2)    null,
    type            varchar(255)      null,
    room_number     tinyint default 1 null,
    resident_number tinyint default 0 null,
    part_number     tinyint default 1 not null,
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
    bank_account varchar(255) null
);

create table expense
(
    id_expense   int auto_increment
        primary key,
    name         varchar(255)   null,
    description  varchar(255)   null,
    total        decimal(10, 2) null,
    period_start date           null,
    period_end   date           null,
    id_person    int            not null,
    constraint expense_person_id_person_fk
        foreign key (id_person) references person (id_person)
);

create table person_has_flat
(
    id_person_has_flat int auto_increment
        primary key,
    id_person          int     null,
    id_flat            int     null,
    ownership          tinyint not null,
    date_start         date    not null,
    constraint person_has_flat_flat_id_flat_fk
        foreign key (id_flat) references flat (id_flat),
    constraint person_has_flat_person_id_person_fk
        foreign key (id_person) references person (id_person)
);

create table utility_rate
(
    id_utility_rate int auto_increment
        primary key,
    name            varchar(255)                not null,
    description     varchar(255)                null,
    price           decimal(10, 2) default 0.00 null,
    date_start      date                        null,
    date_end        date                        not null
);

create table service
(
    id_service       int auto_increment
        primary key,
    id_flat          int                     not null,
    id_utility_rate  int                     not null,
    period_start     date                    not null,
    period_end       date                    null,
    rate_coefficient decimal(10, 2) unsigned null,
    constraint service_flat_id_flat_fk
        foreign key (id_flat) references flat (id_flat),
    constraint service_utility_rate_id_utility_rate_fk
        foreign key (id_utility_rate) references utility_rate (id_utility_rate)
);

create table debt
(
    id_debt          int auto_increment
        primary key,
    id_service       int                         not null,
    total            decimal(10, 2)              not null,
    debt_coefficient decimal(10, 2) default 1.00 null,
    constraint debt_service_id_service_fk
        foreign key (id_service) references service (id_service)
);

create table payment
(
    id_payment       int auto_increment
        primary key,
    id_person        int                                  not null,
    id_service       int                                  null,
    payee            varchar(255)                         null,
    datetime_payment datetime                             null,
    total            decimal(10, 2) unsigned default 0.00 null,
    constraint payment_person_id_person_fk
        foreign key (id_person) references person (id_person),
    constraint payment_service_id_service_fk
        foreign key (id_service) references service (id_service)
);