function Example_to_docker(inputniifile,outputtxt,FSLpath,f)
% This function is a example to test how to put matlab scripts in to a
% container.
% FSL is needed.
% 'inputniifile' should be an absolute path of nii file ,
% 'outputtxt' should be an absolute path of text file ,
% 'FSLpath' direct the location of FSL
% 'f' is a flag to define the output language. '1' for English; '2' for
% Chinese
%
% For example: Example_to_docker('/Users/gongjinnan/temp_for_docker/test_matlab_compile/T1_test.nii','/Users/gongjinnan/temp_for_docker/test_matlab_compile/T1_test_mid.txt','/usr/local/fsl',1)
addpath([FSLpath filesep 'etc' filesep 'matlab']);
fileId=fopen(outputtxt,'w+');
try
    [img,dims]=read_avw(inputniifile);
catch
    fprintf(fileId,'Read failed:Please check the FSL installing and the Nii File situation');
    return;
end
output=img(round(dims(1)/2),round(dims(2)/2),round(dims(2)/2),1);
if f==1
    fprintf(fileId,['The value of the middle of the image is:' num2str(output,'%5.2f')]);
elseif f==2
    fprintf(fileId,['图像的中间值为:' num2str(output,'%5.2f')]);
end
fclose(fileId);
