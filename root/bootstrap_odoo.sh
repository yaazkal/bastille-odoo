#!/bin/sh
prepare_user(){
    pw groupadd odoo
    pw useradd odoo -g odoo -s /usr/sbin/nologin -d /nonexistent -c "Odoo user for running the app"
}

prepare_postgresql(){
    if [ ! -e /var/db/postgres/data12 ];then
        service postgresql initdb
    fi
}

create_pguser_and_db(){
    su -l postgres -c 'createuser --superuser odoo'
    su -l postgres -c 'createdb odoo -O odoo'
}

download_odoo(){
    if [ ! -e /usr/local/odoo ];then
        git config --global pull.rebase false
        git clone -b 13.0 --depth 1 https://github.com/odoo/odoo.git /usr/local/odoo
    fi
    git -C /usr/local/odoo pull
    chown -R odoo:odoo /usr/local/odoo
}

install_odoo_requisites(){
    pip install setuptools wheel phonenumbers
    C_INCLUDE_PATH=/usr/local/include pip install -r /usr/local/odoo/requirements.txt
}

prepare_user
prepare_postgresql
create_pguser_and_db
download_odoo
install_odoo_requisites
