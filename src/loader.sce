// generated by builder.sce: Please do not edit this file
// ------------------------------------------------------
libCS_path=get_file_path('loader.sce');
functions=[ 'Costo';
            'DH';
            'FBPV';
            'Flujo';
            'FlujoT';
            'simplify';
            'qksp';
];
addinter(libCS_path+'/libCS.dll','libCS',functions);