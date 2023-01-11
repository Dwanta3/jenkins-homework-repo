# Specify the base image
FROM centos:7

# Add a tag
LABEL maintainer="cloudspace student Karim"

# Update our packages
RUN yum -y update && yum clean all 

# Install apache --> create /var/www/html
RUN yum install -y httpd

# Copy the app inside the container
COPY index.html /var/www/html

# Port on which the container should listen on
EXPOSE 80

# Run httpd by doing systemctl start httpd
# Hey when container starts please start apache
ENTRYPOINT ["/usr/sbin/httpd"]

# We dont want the container to exit
#Run the container in the background
CMD ["-D","FOREGROUND"]

