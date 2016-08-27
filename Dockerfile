## BUILDING
##   (from project root directory)
##   $ docker build -t minotaurdsp-youtube-dl .
##
## RUNNING
##   $ docker run minotaurdsp-youtube-dl

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="v9lpgm2" \
    STACKSMITH_STACK_NAME="minotaurdsp/youtube-dl" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install python-3.5.2-0 --checksum f7ee6044bc9ebdfefa9c9eb181deb01b065157fc645bfc9c7880274d1cc69237

ENV PATH=/opt/bitnami/python/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Django template
COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
