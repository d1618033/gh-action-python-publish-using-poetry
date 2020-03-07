FROM python:3.8

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade --no-cache-dir twine poetry

WORKDIR /src
COPY build_and_upload.sh .

RUN chmod +x build_and_upload.sh
ENTRYPOINT ["/src/build_and_upload.sh"]
