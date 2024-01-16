# Мониторим какой процесс сколько пишет на диск

## Установка
1. Понадобится утилита pidstat из пакета sysstat
```bash
# sudo apt install sysstat
```
2. Копируем скрипты и конфиги в папку заббикса
```bash
# cd zabbix_iops_monitor
# sudo cp iops_check.sh iops_procces_check.sh /etc/zabbix/scripts/
# sudo cp iops_monitor_zabbix.conf /etc/zabbix/zabbix_agent2.d/
```
3. Добавляем пользователя zabbix в /etc/sudoers
```bash
# zabbix ALL=(ALL) NOPASSWD:/usr/bin/top
# zabbix ALL=(ALL) NOPASSWD:/usr/bin/pidstat
```
4. Выдаем все нужные права на скопированные файлы и папки в которых они лежат, пользователь zabbix должен быть владелец.
5. Импортируем шаблон zbx_iops_monitor.yaml в наш Заббикс и ждем, когда появятся данные, если не появились, то изучаем что могло пойти не так :D