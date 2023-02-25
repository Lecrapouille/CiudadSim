mode(-1);
DIRCSMACROS=CS_DIR+"macros/";
// List of macros to be loaded, it is assumed that
// all of them have the extension .sci
genlib("metanetlib",CS_DIR+"metanet")
lista=["affec";"net_macros";"traffic_macros";"dsdtest";"translate";"glstotal_spr";"bilevel_macros"]
disp("metanetlib rebuild and loaded");

for i=1:size(lista,1),
	getf(DIRCSMACROS+lista(i)+".sci");
end;

disp("CiudadSim macros loaded");