FROM python:3.9-slim-buster

RUN  pip3 --version;
#SHELL ["/bin/bash", "-c"]

# port 8000 is the application port
EXPOSE 8000

RUN mkdir myapp
COPY DevOps-Challenge ./myapp
WORKDIR /myapp
RUN pip3 install -r requirements.txt

# Port 6379 is redis port 
EXPOSE 6379 

ENTRYPOINT ["/bin/bash" , "-c", "export $(cat .env | xargs) && python hello.py"]


