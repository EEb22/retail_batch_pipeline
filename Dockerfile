
FROM python:3.9.6

# set up location of code
WORKDIR /code
ENV PYTHONPATH=/code/etl

# install python requirements
ADD ./requirements.txt requirements.txt
RUN pip install -r requirements.txt

# copy repo
COPY ../.. /code/

# keep container up
ENTRYPOINT ["tail", "-f", "/dev/null"]
