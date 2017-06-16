function Example_to_docker_v2(inputniifile,outputtxt,f)
% This function is a example to test how to put matlab scripts in to a
% container.
% FSL is needed.
% 'inputniifile' should be an absolute path of nii file ,
% 'outputtxt' should be an absolute path of text file ,

% 'f' is a flag to define the output language. '1' for English; '2' for
% Chinese
%
% For example: Example_to_docker_v2('/Users/gongjinnan/temp_for_docker/test_matlab_compile/T1_test.nii','/Users/gongjinnan/temp_for_docker/test_matlab_compile/T1_test_mid.txt',1)

% addpath([FSLpath filesep 'etc' filesep 'matlab']);
fileId=fopen(outputtxt,'w+');
try
    [img,dims]=read_avw(inputniifile);
    display(['The image has been loaded, the first 3 Dim is :' ...
        num2str(dims(1),'%i') ' * ' num2str(dims(2),'%i') ' * ' num2str(dims(3),'%i')]);
catch
    fprintf(fileId,'Read failed:Please check the FSL installing and the Nii File situation');
    return;
end
output=img(round(dims(1)/2),round(dims(2)/2),round(dims(3)/2),1);
display(['The value of the middle of the image is:' num2str(output,'%5.2f')]);
if f==2
    fprintf(fileId,['�???�为:' num2str(output,'%5.2f') ' in '...
        num2str(round(dims(1)/2),'%i') ',' num2str(round(dims(2)/2),'%i') ',' num2str(round(dims(3)/2),'%i')]);
else
    fprintf(fileId,['Value of center of the image is:' num2str(output,'%5.2f') ' in '...
        num2str(round(dims(1)/2),'%i') ',' num2str(round(dims(2)/2),'%i') ',' num2str(round(dims(3)/2),'%i')]);
end
fclose(fileId);
%system([char(13,10)' char(13,10)' ' >> ' outputtxt]);
system(['echo ================= >> ' outputtxt]);
system(['echo tesing the system command ' datestr(now) ' >> ' outputtxt]);
system(['echo ================= >> ' outputtxt]);
%system([char(13,10)' char(13,10)' ' >> ' outputtxt]);
system(['bet >> ' outputtxt]);
end
