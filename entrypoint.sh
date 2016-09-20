#!/bin/bash

modprobe i2c-dev

python manage.py $@
