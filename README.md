# [WIP] bastille-odoo
[Bastille](https://github.com/bastillebsd/bastille) template for running odoo in FreeBSD

By default it installs Odoo 16.0 and PostgreSQL 15. If you want another version of Odoo or PostgreSQL please see the Arguments section below.

## Bootstrap

```shell
bastille bootstrap https://github.com/yaazkal/bastille-odoo
```

## Usage

```shell
bastille template TARGET yaazkal/bastille-odoo
```

After the template has been applied the first time, restart the jail.
If you want to directly access the Odoo instance outside the host, don't forget to create an `rdr` rule in order to redirect the port.

### Arguments
This template can receive two arguments: `odoo-version` to specify another version for Odoo and `psql-version` to specify another version for PostgreSQL.

#### Example
If you want Odoo 13.0 with PostgreSQL 11, you can use the template like this:

```shell
bastille template TARGET yaazkal/bastille-odoo --arg odoo-version=13.0 --arg psql-version=11
```

Note that Odoo versions needs `.0` like `14.0`, `15.0` and so on. If you want next version that is under development, you can use `master` as the Odoo version.
