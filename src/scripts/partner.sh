#partner.sh - call with ./partner.sh localhost 5432 lognex partner 123123

psql -U ba -h ${1} -p ${2} -d ${3} -c "INSERT into billing.partner(id, name) VALUES (public.uuid_generate_v4(), 'partner');"

psql -U ba -h ${1} -p ${2} -d ${3} -c "INSERT INTO ba.company values(uuid_generate_v1(), '${4}')"
psql -U ba -h ${1} -p ${2} -d ${3} -c "INSERT INTO ba.userinfo(id, uid, name, passwd, company_id) VALUES(uuid_generate_v1(), 'admin@${4}', 'admin', '${5}', (select id from ba.company where name = '${4}'))"
psql -U ba -h ${1} -p ${2} -d ${3} -c "INSERT INTO ba.userinfo_roleinfo(userinfo_id, roleinfo_id) VALUES((select id from ba.userinfo where uid = 'admin@${4}'),(select id from ba.roleinfo where name = 'AUTHORIZED_USER'))"
psql -U ba -h ${1} -p ${2} -d ${3} -c "INSERT INTO ba.userinfo_roleinfo(userinfo_id, roleinfo_id) VALUES((select id from ba.userinfo where uid = 'admin@${4}'),(select id from ba.roleinfo where name = 'API'))"
psql -U ba -h ${1} -p ${2} -d ${3} -c "INSERT INTO ba.userinfo_roleinfo(userinfo_id, roleinfo_id) VALUES((select id from ba.userinfo where uid = 'admin@${4}'),(select id from ba.roleinfo where name = 'PARTNER'))"
