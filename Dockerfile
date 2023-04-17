FROM ubuntu:latest
RUN apt-get -qq update
RUN apt-get install wget -y
RUN mkdir /usr/local/rlm
RUN chmod -R 777 /usr/local/rlm
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

# Add startup script
COPY ./start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

# Run the startup script
CMD ["/opt/start.sh"]
