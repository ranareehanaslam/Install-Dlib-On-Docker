
# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.11-slim

# Allow statements and log messages to immediately appear in the logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# Install production dependencies.
RUN pip install --upgrade pip setuptools
RUN pip install gunicorn
RUN pip install Flask==2.3.2
RUN pip install --upgrade pip setuptools
RUN pip install cmake==3.27.0
RUN apt-get clean && apt-get -y update && apt-get install -y build-essential cmake libopenblas-dev liblapack-dev libopenblas-dev liblapack-dev
RUN pip install dlib==19.24.2
RUN pip install numpy==1.24.3
RUN pip install opencv-python==4.8.0.74
RUN pip install opencv-python-headless==4.8.0.74
RUN pip install Werkzeug==2.3.6
RUN apt-get install wget
RUN wget https://huggingface.co/spaces/asdasdasdasd/Face-forgery-detection/resolve/ccfc24642e0210d4d885bc7b3dbc9a68ed948ad6/shape_predictor_68_face_landmarks.dat

# # RUN the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
# Timeout is set to 0 to disable the timeouts of the workers to allow Cloud # RUN to handle instance scaling.
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app