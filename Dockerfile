FROM matlab_v90_fsl_ubuntu
MAINTAINER Jinnan Gong <gongjinnan1989@gmail.com>
RUN mkdir /root/matlab_script
RUN apt-get -y install git
RUN cd /root && git clone https://github.com/gongjinnan/NITB_uestc_test
RUN chmod +x -R /root/NITB_uestc_test/

ENTRYPOINT ["/root/NITB_uestc_test/Example_to_docker_v2"]

#ENTRYPOINT ["/bin/bash", "-c"]
