#Specified version of uWSGI supports up to Python 3.7
FROM python:3.7.17-bookworm

#Ensure port 5000 is open.
EXPOSE 5000

#Some default values for MySQL:
ENV db_root_password=APasswordSuitableForRoot
ENV db_name=pytest
ENV MYSQL_SERVICE_PORT=3306

WORKDIR /usr/src/app

COPY app/requirements.txt ./

#Install our requirements.
RUN pip install --no-cache-dir --upgrade pip \ 
 && pip install --no-cache-dir -r requirements.txt

#Copy our application in, and...
COPY app/ .

#Go for it!
CMD ["python", "./userapi.py"]
