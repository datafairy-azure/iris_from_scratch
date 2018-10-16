FROM python:3.7.0

RUN pip3 install --upgrade pip

WORKDIR /iris_from_scratch

COPY requirements.txt /iris_from_scratch/

COPY ./api/ /iris_from_scratch/app/

RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

WORKDIR /iris_from_scratch/iris_101

COPY ./iris_101/ /iris_from_scratch/iris_101/

RUN pip3 install .

WORKDIR /iris_from_scratch/app

EXPOSE 80

CMD ["python3", "iris_flask.py"]