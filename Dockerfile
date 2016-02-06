FROM daocloud.io/python:3-onbuild
CMD [ "python", "./your-daemon-or-script.py" ]
MAINTAINER tzwlwm <tzwlwm@qq.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN pip install -r requirements.txt
docker build -t my-python-app .
docker run -it --rm --name my-running-app my-python-app
ADD docker-entrypoint.sh /usr/src/app/docker-entrypoint.sh
RUN chmod +x /usr/src/app/*.sh

EXPOSE 80

CMD ["/usr/src/app/docker-entrypoint.sh"]
