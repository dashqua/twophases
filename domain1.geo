// jet on a viscuous wall
// later : thick section of pipe

//+
SetFactory("OpenCASCADE");
Box(1) = {0, 0, 0, 2, 2, 1};
Cylinder(2) = {1, 1, 0, 0, 0, 1, 0.75, 1*Pi};


Mesh.CharacteristicLengthMin = 0.1;
Mesh.CharacteristicLengthMax = 2;
//BooleanDifference(100) = { Volume{1}; Delete; }{ Volume{2}; Delete; };


