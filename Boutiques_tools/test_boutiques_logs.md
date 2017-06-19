## Running Example_to_docker_v2 in Docker
docker pull jngong/nitb_uestc_test

docker run -v /Users/gongjinnan/temp_for_docker/:/data --rm jngong/nitb_uestc_test Example_to_docker_v2 /data/Nii_Images_fortest/JME_01_fMRI.nii /data/test.txt 1

		Creating MATLAB Runtime Cache at location: /tmp/.mcrCache9.0
		.max_size not found.  Using default size of 33554432 bytes.
		MATLAB Runtime cache extracting component: Example_to_d_7CD9A7912F7E5912BB52EA4379C0A0FA
		Acquiring MATLAB Runtime cache root-level directory lock... acquire succeeded.
		Reading cache index file...
		File open failed for /tmp/.mcrCache9.0/.mcr_cache_index
		MATLAB Runtime cache: extractDir is /tmp/.mcrCache9.0/Exampl0

		Adding component Example_to_d_7CD9A7912F7E5912BB52EA4379C0A0FA to the cache.
		MATLAB Runtime Cache: performing maintenance...
		Processing cached components...
		Done with cache maintenance.
		Creating component directory: /tmp/.mcrCache9.0/Exampl0
		Acquiring component directory WRITE lock... acquire succeeded.
		Extracting component... Component extracted to cache.  Writing creation timestamp...
		Timestamp successfully created.
		done.
		Downgrading WRITE lock to READ lock... downgrade successful.
		Component Example_to_d_7CD9A7912F7E5912BB52EA4379C0A0FA has successfully been accessed from the cache.
		MATLAB Runtime Cache: performing maintenance...
		Processing cached components...
		Done with cache maintenance.
		Checking whether index file /tmp/.mcrCache9.0/.mcr_cache_index needs to be written...
		Write is needed.
		Writing cache index file: /tmp/.mcrCache9.0/.mcr_cache_index
		Writing cache index entry:
		Example_to_d_7CD9A7912F7E5912BB52EA4379C0A0FA
		Exampl0
		51031
		2017-Jun-19 22:39:47.812167

		The image has been loaded, the first 3 Dim is :61 * 73 * 61
		The value of the middle of the image is:11.28


## Boutiques testing 

bash-3.2$ docker run --rm -v /Users/gongjinnan/temp_for_docker/:/data -w /data boutiques/boutiques validator.rb /usr/local/boutiques/schema/descriptor.schema.json ./nitb_uestc_test.json

		["OK"]


bash-3.2$ docker run --rm -v /Users/gongjinnan/temp_for_docker/:/data -w /data boutiques/boutiques localExec.py -i inputs_localExec.json -e ./nitb_uestc_test.json

		/bin/sh: docker: command not found
		/bin/sh: docker: command not found
		Attempting execution of command:
			Example_to_docker_v2  /data/Nii_Images_fortest/T1_test.nii  /data/Nii_Images_fortest/test.txt  1
		---/* Start program output */---
		Executing in Docker via: docker run --rm  -v ${PWD}:${PWD} -w ${PWD} jngong/nitb_uestc_test ./temp-1497910031562.localExec.dockerjob.sh
		---/* End program output */---
		Completed execution (exit code: 127)
		Looking for output files:
			Required output file 'Output text file' was found at /data/Nii_Images_fortest/test.txt
	
	
bash-3.2$ docker run --rm -v /Users/gongjinnan/temp_for_docker/:/data -w /data boutiques/boutiques invocationSchemaHandler.py -i ./nitb_uestc_test.json

		{
		   "description" : "Input parameters schema for nitb_uestc_test.",
		   "title" : "nitb_uestc_test.invocationSchema",
		   "required" : [
		      "nii_file",
		      "out_path",
		      "flag_of_lang"
		   ],
		   "dependencies" : {},
		   "additionalProperties" : false,
		   "$schema" : "http://json-schema.org/draft-04/schema#",
		   "type" : "object",
		   "properties" : {
		      "nii_file" : {
		         "type" : "string"
		      },
		      "out_path" : {
		         "type" : "string"
		      },
		      "flag_of_lang" : {
		         "type" : "number"
		      }
		   }
		}
		


bash-3.2$ docker run --rm -v /Users/gongjinnan/temp_for_docker/:/data -w /data boutiques/boutiques invocationSchemaHandler.py -i ./nitb_uestc_test.json -d ./inputs_invocationSchemaHandler.json

		Valid data!
		
		
