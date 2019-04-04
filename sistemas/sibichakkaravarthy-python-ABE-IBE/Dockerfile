FROM ubuntu:latest
RUN apt-get update
RUN apt-get install python:2.7.6
RUN pip install hashlib
COPY ServerMain.py ServerMain.py
CMD python ServerMain.py