FROM hub.srv.webeye.services:5000/webeye/webcam:latest

COPY manage.py /webcam/

ENV C_FORCE_ROOT true

CMD ["python", "manage.py", "celery", "worker", "-A", "webcam"] 
