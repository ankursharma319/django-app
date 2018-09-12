FROM python:3.6

# RUN apt-get update
# RUN apt-get install -y --no-install-recommends postgresql-client
# RUN rm -rf /var/lib/apt/lists/*

# RUN ping -c 3 google.com
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY ./ ./
COPY ./start.sh ./start.sh
EXPOSE 8000
CMD ["./start.sh"]
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]