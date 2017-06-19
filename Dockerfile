FROM jngong/matlab_v90_fsl_ubuntu
MAINTAINER Jinnan Gong <gongjinnan1989@gmail.com>
RUN apt-get -y install git
RUN mkdir -p /scripts
RUN cd /scripts && git clone https://github.com/gongjinnan/NITB_uestc_test
RUN chmod +x -R /scripts/NITB_uestc_test/
ENTRYPOINT ["/scripts/NITB_uestc_test/Example_to_docker_v2"]
#ENTRYPOINT ["/bin/bash", "-c"]
