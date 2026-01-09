FROM python:3.11

EXPOSE 8000
WORKDIR /app

ARG ART_USER
ARG ART_TOKEN

# Set environment variables for Cloud Run
ENV ART_USER=${ART_USER} \
    ART_TOKEN=${ART_TOKEN}

COPY . ./

RUN pip install -r requirements.txt --index-url "https://${ART_USER}:${ART_TOKEN}@krogertechnology.jfrog.io/artifactory/api/pypi/pypi-remote/simple"

ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8000", "--server.address=0.0.0.0"]



