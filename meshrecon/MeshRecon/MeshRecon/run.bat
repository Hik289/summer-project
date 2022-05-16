cd vsfm
.\VisualSFM.exe sfm ..\img ..\results\output.nvm
cd..

cd meshrecon
.\nvm2sfm.exe ..\results\output.nvm ..\results\output.sfm 1
.\MeshRecon_init.exe ..\results\output.sfm ..\results\MESH_init.ply
.\MeshRecon_refine.exe ..\results\output.sfm ..\results\MESH_init.ply ..\results\MESH_refine.ply 0
cd ..