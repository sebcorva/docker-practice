FROM python:3.13
#environment variable for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

WORKDIR /app

COPY requirements.txt .
#we use no-cache-dir to make the container smaller and clean
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

#Expose default port
EXPOSE 5000

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
#-w means workers in this case we use 4, it's for perfomance
# -b 0.0.0.0:5000 means bind, make gunicorn to listen in all the interfaces 0.0.0.0
#app for my app and app for the instance of flask