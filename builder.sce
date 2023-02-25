mode(-1);

// [1] macros directory 

libname='CSlib'
DIR=get_file_path('builder.sce');
//compile sci files if necessary and build lib file
//genlib(libname,DIR+'/macros/')

// prepare macro directory in case one wants to run make 
dir=getcwd();
chdir('macros') 
exec builder.sce 
chdir(dir);

// [2] src directory 


if c_link('libCS') 
  write(%io(2),'please do not rebuild a shared library while it is linked')
  write(%io(2),'in scilab. use ulink to unlink first');
else 
  dir=getcwd();
  chdir('src') 
  exec builder.sce 
  chdir(dir);
end 

//getf("./macros/formatman.sci");
// [3] man directory 
	dir=getcwd();
// To regenerate  the manual
//	chdir('man/man') 
//  1) to generate the cat file
//	formatman("./","ascii");
//  2) to generate the xml file
//	formatman("./","xml");
// If Sablotron is installed html files can be generated 
// from xml files. If CiudadSim is installed in DIR
// (DIR is cleared by the builder at the end of its eexecution) 
//      xmltohtml("DIR/CiudadSim2.2/man",[],'html.xsl')
//	formatman("./","tex");
//	chdir(dir);


// [3] generate Path.incl 

     F=mopen('Path.incl','w');
     mfprintf(F,'SCIDIR='+SCI+'\n');
     mfprintf(F,'SCIDIR1='+strsubst(SCI,'/','\\')+'\n');
     mclose(F);

clear DIR libname genlib get_file_path F





