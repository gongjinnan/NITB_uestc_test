FROM matlab_v90_fsl_ubuntu
MAINTAINER Jinnan Gong <gongjinnan1989@gmail.com>
RUN mkdir /root/matlab_script
ADD Example_to_docker_v2 /root/matlab_script/Example_to_docker_v2
ADD *.m /root/matlab_script/
RUN chmod +x -R /root/matlab_script/

ENTRYPOINT ["/root/matlab_script/Example_to_docker_v2"]

#ENTRYPOINT ["/bin/bash", "-c"]