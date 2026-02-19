merge into stores (id, code, name) key (id) values
    ('11111111-1111-1111-1111-111111111111','VAL01','URBANIZACION LOS OLIVOS');
merge into stores (id, code, name) key (id) values
    ('33333333-3333-3333-3333-333333333333','VAL03','SANTOMERA');
merge into stores (id, code, name) key (id) values
    ('22222222-2222-2222-2222-222222222222','VAL02','URB. PRADO DEL SANTO');

merge into employees (id, dni, name, surname, contract_daily_hours) key (id) values
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','27678613E','Ana','López',8);
merge into employees (id, dni, name, surname, contract_daily_hours) key (id) values
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','82340308D','Luis','García',6);

merge into assignments (id, store_id, employee_id, section, hours) key (id) values
    ('cccccccc-cccc-cccc-cccc-cccccccccccc','11111111-1111-1111-1111-111111111111','aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','HORNO',2);
merge into assignments (id, store_id, employee_id, section, hours) key (id) values
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee','22222222-2222-2222-2222-222222222222','bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','VERDURAS',3);

merge into employee_aptitudes (employee_id, aptitude) key (employee_id, aptitude) values
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','HORNEAR_PAN');
merge into employee_aptitudes (employee_id, aptitude) key (employee_id, aptitude) values
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa','REPOSTERIA');
merge into employee_aptitudes (employee_id, aptitude) key (employee_id, aptitude) values
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb','FORTALEZA_FISICA');
