create table if not exists stores
(
    id
    uuid
    primary
    key,
    code
    varchar
(
    32
) not null unique,
    name varchar
(
    255
) not null,
    city varchar
(
    128
),
    address varchar
(
    255
)
    );

-- Employees
create table if not exists employees
(
    id
    uuid
    primary
    key,
    dni
    varchar
(
    16
) not null unique,
    name varchar
(
    100
) not null,
    surname varchar
(
    100
) not null,
    contract_daily_hours int not null
    );

create table if not exists assignments
(
    id
    uuid
    primary
    key,
    store_id
    uuid
    not
    null
    references
    stores
(
    id
) on delete cascade,
    employee_id uuid not null references employees
(
    id
)
  on delete cascade,
    section varchar
(
    32
) not null,
    hours int not null,
    constraint uq_emp_store_section unique
(
    store_id,
    employee_id,
    section
)
    );

create table if not exists employee_aptitudes
(
    employee_id
    uuid
    not
    null
    references
    employees
(
    id
) on delete cascade,
    aptitude varchar
(
    64
) not null,
    constraint pk_emp_apt primary key
(
    employee_id,
    aptitude
)
    );
