FROM resin/rpi-raspbian:jessie

MAINTAINER Vena <rak@webeye.services> 
RUN apt-get update -y; apt-get install python gcc git-core python-pip python-dev gphoto2 build-essential libi2c-dev libgphoto2-dev  i2c-tools libffi-dev --no-install-recommends -y && \ 
    pip install pip --upgrade && \
    pip install smbus-cffi && \
    pip install django-pretty-times && \
    pip install RPi.GPIO && \
    pip install uwsgi && \ 
    pip install celery && \
    pip install numpy && \ 
    pip install psutil && \
    pip install django-celery && \
    pip install gphoto2 && \
    pip install statsd && \
    rm -rf /var/lib/apt/lists/*

RUN    pip install python-memcached && \
    pip install redis  && \
    pip install pytz && \
    pip install pika && \
    pip install pyserial && \
    pip install td-logger && \
    pip install exifread && \
    pip install pytz && \
    pip install django && \
    pip install django-mptt && \
    pip install thermometer  && \
    pip install django-tastypie && \
    pip install statsd && \
    pip install uptime && \
    pip install django-giom
    
RUN mkdir -p /webcam

ADD ${PWD}/webcam/webapp /webcam

ADD ${PWD}/webcam/requirements.txt /webcam/

#RUN pip install -r /webcam/requirements.txt 
#RUN rm -r /webcam/webapp/settings/* 

WORKDIR /webcam

CMD ["bash"] 


