FROM hub.srv.webeye.services:5000/webeye/webcam:latest

COPY manage.py /webcam/

CMD ["python", "manage.py", "celery", "beat", "-A", "webcam"] 
