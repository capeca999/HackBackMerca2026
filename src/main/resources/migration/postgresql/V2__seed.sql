insert into stores (id, code, name)
values ('11111111-1111-1111-1111-111111111111', 'VAL01', 'URBANIZACION LOS OLIVOS'),
       ('33333333-3333-3333-3333-333333333333', 'VAL03', 'SANTOMERA'),
       ('22222222-2222-2222-2222-222222222222', 'VAL02', 'URB. PRADO DEL SANTO') on conflict (id) do nothing;

insert into employees (id, dni, name, surname, contract_daily_hours)
values ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '27678613E', 'Ana', 'López', 8),
       ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '82340308D', 'Luis', 'García', 6) on conflict (id) do nothing;


insert into assignments (id, store_id, employee_id, section, hours)
values ('cccccccc-cccc-cccc-cccc-cccccccccccc', '11111111-1111-1111-1111-111111111111',
        'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'HORNO', 2),
       ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '22222222-2222-2222-2222-222222222222',
        'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'VERDURAS', 3) on conflict (id) do nothing;

insert into employee_aptitudes (employee_id, aptitude)
values ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'HORNEAR_PAN'),
       ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'REPOSTERIA'),
       ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'FORTALEZA_FISICA') on conflict do nothing;
