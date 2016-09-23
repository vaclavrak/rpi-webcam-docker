#!/bin/bash

#modprobe i2c-dev
rm celerybeat-schedule.*
rm celerybeat.pid
python manage.py $@
