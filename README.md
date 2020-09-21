```sql

CREATE USER minhtri;
CREATE USER minhtri_read;

ALTER USER minhtri WITH SUPERUSER;
ALTER USER minhtri with encrypted password 'minhtri';

ALTER USER minhtri_read WITH SUPERUSER;
ALTER USER minhtri_read with encrypted password 'minhtri_read';

create database tole_dev;

```
