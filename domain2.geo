Mesh.Algorithm = 8;
Mesh.Algorithm3D = 5;
Mesh.CharacteristicLengthMin = 0.1;
Mesh.CharacteristicLengthMax = 2;
Mesh.CharacteristicLengthFactor = 1.0;
Mesh.SubdivisionAlgorithm = 1;


SetFactory("OpenCASCADE");
Cylinder(1) = {0, 0, 0, 3, 0, 0, 1.2, 2*Pi};
Cylinder(2) = {0, 0, 0, 3, 0, 0, 0.8, 2*Pi};
BooleanDifference(100) = {Volume{1}; Delete; }{ Volume{2}; Delete;};

Surface Loop(2) = {1, 2, 4, 3};
Volume(101) = {2};
Physical Volume("Pipe") = {2};
Coherence;

//+
Surface Loop(3) = {1, 2, 4, 3};
