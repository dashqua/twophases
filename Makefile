#GMSH=/home/thomas/gmsh-4.1.0-Linux64/bin/gmsh
GMSH=/home/thomas/gmsh-3.0.6-Linux64/bin/gmsh
H=/home/thomas/OpenFOAM/thomas-6/run/twophases
solver="simpleFoam"

clean:
	foamListTimes -rm;
	rm -rf postProcessing
	rm *log *msh *.opt *.pos *.png *tmp *~ *#*
	rm Residuals

run:
	$(solver) > log

view:
	paraFoam

mesh:
	rm -f im.png
	$(GMSH) bare_shaft.geo -
	gmshToFoam bare_shaft.msh

	tail -n9 constant/polyMesh/boundary | sed -e "s/defaultFaces/Wrap/" | sed -e "s/patch/wall/" > $(H)/tmp
	head constant/polyMesh/boundary -n -9 > $(H)/tmp2
	mv $(H)/tmp2 -f constant/polyMesh/boundary
	cat $(H)/tmp >> constant/polyMesh/boundary
	rm -r $(H)/tmp
# $(GMSH) -nt 4 -v 5 -3 -o Elbow_Pipe_v2.msh Elbow_Pipe_v2.geo | tee stdout.log 2&>stderr.log


renew:
	foamListTimes -rm
	simpleFoam > log

all:
	$(MAKE) clean
	$(MAKE) mesh
	$(MAKE) run
