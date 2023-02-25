unix("rm edited.graph");
mode(-1);
x_message([..
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",..
    "@                                      @",..
    "@       TRAFFIC ASSIGNMENT DEMO        @",..
    "@                                      @",..
    "@                     Pablo Lotito     @",..
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"]);

x_message([..
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",..
    "@                                      @",..
    "@     Editing a traffic network        @",..
    "@                                      @",..
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"]);
mode(7);
//
// Load  the "Small" traffic network and show
// the network in a metanet window.
//
global  %net 
%net=TrafficExample("Small");
xsetech([0 0 0.6 0.6]);
ShowNet();
//----------------------------------------------------------------------------
// Edit the graph_list structure of Metanet as usual
// knowing that, now, some fields have a traffic meaning.
//
// To each BLACK EDGE (e) of a traffic network is associated 4 coefficients
// (t0,ma,ca,ba) needed to compute the travelling time (t) 
// as a function of the flow (f).
//
// To each MAGENTA EDGE is associated the traffic demand stored in the
// field "flow" of the edge.
//
// To EDIT  these fields :
//   1)  select "modify graph" in the menu "graph"
//   2)  right click on the arrow of an edge
//   3)  select "attribute" in the menu "modify"
//   4)  edit the fields
//   5)  SAVE the file using "save as" in "edited.graph" in the directory "CiudadSim"
//  (if you don't save the file in "edited.graph" an error will occur saying that
//  the file "edited.graph"  does not exist).
//----------------------------------------------------------------------------
//
//
//  LOAD the edited graph and transform it in a traffic net structure
//
g=load_graph('edited');
%net=Graph2Net(g);
mode(-1);
x_message([..
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",..
    "@                                      @",..
    "@     Assignment of the traffic        @",..
    "@                                      @",..
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"]);
mode(7)
//
// Now it is possible to compute the traffic assignement for  the edited graph
//
TrafficAssig();
//
// and to show the results :
// - the total flow on edges in the "Time" field of the menu "graph",
// - the times spent on edges in the "Flow"  field of the menu "graph".
//
ShowNet();
//
mode(-1);
x_message([..
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",..
    "@                                      @",..
    "@     Creation of a Net List           @",..
    "@                                      @",..
    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"]);
mode(7)
// Coordinates for the nodes
nx=[200 10 200 400]
ny=[10 150 300 150]
// tail and head vectors for the links
tl=[1 2 3 1 1 3]
hl=[2 3 4 4 3 1]
// link-perfomance-function parameters
lpp=[1 1 1 1 1 1;1 3 5 2 7 1;1 2 1 2 1 2;2 2 2 2 2 2]
// Creation of the traffic net
%net=MakeNet(4,nx,ny,tl,hl,6,lpp,1,3,10);
// We can see it with
ShowNet()
//
// We can modify the net created
//
//We can add nodes
AddNodes(125,150);
ShowNet()
//We can add links
AddLinks([2 5],[5 4],[1 1;3 4;2 2;2 2]);
ShowNet()
//We can add demands
AddDemands(3,5,5);
ShowNet()
//
//We can assign the flow and Analyse the results
//
TrafficAssig();
ShowNet()
//We can see each diasaggregated flow
ShowNet("all","all",0,0,0,0,1,0,0,1)
ShowNet("all","all",0,0,0,0,2,0,0,2)
//We can choose the nodes,links and demands we want to see
ShowNet("all","between",5,10,0,0,"all",0,0)
//We can wipe out the isolated nodes
ShowNet("used","between",5,10,0,0,"all",0,0)

//
// END
