FROM python:3.9 
WORKDIR /usr/app
COPY requirements.txt .
run pip install -r requirements.txt
COPY . .

CMD ["flask","--app", "app", "run","--host=0.0.0.0","--port=8012"]

# CMD ["python","app.py"]
#docker run -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 -p 5000:5000 jenkinspython