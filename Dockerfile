FROM centos:7
MAINTAINER Khatrani Kishan  <support17@electromech.info> 
RUN yum update -y
RUN yum install -y python36 gcc
RUN yum install net-tools elinks  epel-release -y
RUN yum install nginx -y
RUN yum install supervisor -y
RUN pip3 install webssh
COPY ./source/ /code/
COPY ./supervisord.conf /etc/supervisor.conf 
COPY ./web-ssh.conf /etc/nginx/conf.d/web-ssh.conf
WORKDIR /code/
CMD ["supervisord", "-c", "/etc/supervisor.conf"] 
EXPOSE 80

