# llm-srv 

![](https://codebuild.eu-central-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiZ0p2WDlWOE4rVm5iSGJPZTA5WHNOd2c0VXc3NGFsWk92VTRhWDhnc3BxWWZYR0cwZFdNbFhaQkFiNWY1R1VqQU5TZFlYcEtaYkR3Zm4vSmFLclJLUjVzPSIsIml2UGFyYW1ldGVyU3BlYyI6Imt2amFFS0RoWXZpelBUSnEiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=develop)


### How to run

App uses environment variables, so you should create `.env` file in root directory with next content:

```dotenv
# App config
APP_NAME=llm-srv
APP_VERSION=0.0.1
APP_HOST=localhost
APP_HOST_PORT=80

# Docker config
DOCKER_CONTAINER_NAME=llm-srv-container
DOCKER_CONTAINER_PORT=8080
DOCKER_IMAGE_NAME=llm-srv-image:latest
OPENAI_API_KEY=${OPENAI_API_KEY}
```

or copy `.env.example` file and rename it to `.env`:

```bash
cp .env.example .env
```

#### Local

Make sure that you have installed `python3.10` and `virtualenv` your machine.

``bash brew install python3.10``

``bash pip install virtualenv``

Set up & activate virtual environment:

```bash
virtualenv --python="/opt/homebrew/bin/python3.10" venv
source venv/bin/activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Run app:

```bash
uvicorn src.main:app --reload
```

#### Docker

Make sure that you have installed `docker` and `docker-compose` on your machine.

Build image:

```bash
docker build -t llm-srv .
```

Run container:

```bash
docker run \
  -e "OPENAI_API_KEY=${OPENAI_API_KEY}" \
  -e "DOCKER_CONTAINER_PORT=8000" \
  -v ./data:/app/data \
  -p 8000:8000 \
  -it llm-srv
```


#### Docker-compose

Build & Run container:

```bash
docker-compose up -d --build
```
