mode(-1);

// [1] macros directory 

libname='CSlib'
//DIR=get_file_path('builder.sce');
//compile sci files if necessary and build lib file
//genlib(libname,DIR+'/macros/')
//pause;
// prepare macro directory in case one wants to run make 
//dir=getcwd();
//chdir('macros') 
//exec builder.sce 
//chdir(dir);

// [2] src directory 
DIRCS4=SCI+'/contrib/CS5'
chdir(DIRCS4);
if (MSDOS & (fileinfo('src/libCS.dll')<>[])) | (fileinfo('src/libCS.so')<>[])
  exec loaderonly.sce
else
  exec builder.sce
  exec loaderonly.sce
end 






