FROM ubuntu:latest
RUN apt-get -qq update
RUN apt-get install wget -y
RUN mkdir /usr/local/rlm

# Install Reprise to latest version
RUN wget http://www.reprisesoftware.com/license_admin_kits/x64_l1.admin.tar.gz
RUN tar xvf x64_l1.admin.tar.gz
RUN rm x64_l1.admin.tar.gz
RUN cp -rp /x64_l1.admin/* /usr/local/rlm/

VOLUME /opt/rlm/licenses

# rlm server
EXPOSE 5053
# admin gui
EXPOSE 5054
# isv server
EXPOSE 4101

RUN /usr/local/rlm/rlm

# Add startup script
COPY ./start.sh /usr/local/rlm/start.sh
RUN chmod +x /usr/local/rlm/start.sh

# Run the startup script
CMD ["/usr/local/rlm/start.sh"]
