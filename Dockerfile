FROM centos:9
MAINTAINER skpattanayak77@gmail.com
RUN yum install -y httpd zip unzip
RUN dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
RUN dnf distro-sync
ADD https://www.free-css.com/assets/files/free-css-templates/download/page258/beauty.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip beauty.zip
RUN cp -rvf templatemo_519_beauty/* .
RUN rm -rf templatemo_519_beauty beauty.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
