FROM python:3.10
# на випадок помилок при збірці на arm64v8 (буде кричати на платформу)
# FROM arm64v8/python:3.10
# метаінформація про контейнер, можна стерти, не впливає на роботу
LABEL maintainer="Mykola Ponych <n.ponich@gmail.com>"

# середовище очікує DOCKER_CONTAINER_PORT та OPENAI_API_KEY
# та вольюм /app/data

VOLUME /app/data

ARG DOCKER_CONTAINER_PORT=8000
ARG OPENAI_API_KEY

ENV DOCKER_CONTAINER_PORT=${DOCKER_CONTAINER_PORT}
ENV OPENAI_API_KEY=${OPENAI_API_KEY}
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY . /app
WORKDIR /app

EXPOSE ${DOCKER_CONTAINER_PORT}

# fix: `WARNING: Running pip as the 'root' user can result in broken permissions`
#RUN addgroup --gid 1001 --system app && \
#    adduser --no-create-home --shell /bin/false --disabled-password --uid 1001 --system --group app && \
#    chown -R app:app /app

RUN chmod +x /app/entrypoint.sh
RUN pip install --no-cache-dir -r requirements.txt

#USER app

ENTRYPOINT ["/app/entrypoint.sh"]
