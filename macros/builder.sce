// this script must be run from the directory 
// where the script is writen 

f=mopen('Names.incl','w');
mfprintf(f,'SCIDIR='+SCI+'\n')
mfprintf(f,'CURRENT_DIR='+getcwd()+'\n');
mclose(f);

// G_make('all','all')

