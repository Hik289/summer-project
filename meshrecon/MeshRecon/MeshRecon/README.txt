Mesh Reconstruction From Imagery Data
Zhuoliang Kang
Institute for Robotics and Intelligent Systems, University of Southern California
zkang@usc.edu
Last Update: 04/29/2015

------------------------------------------------------------------------------------
Software Abstraction

This software produces mesh model from imagery data with camera poses given.

------------------------------------------------------------------------------------
License & Disclaimer

This software is for academic purpose only. Use it at your own risk.

------------------------------------------------------------------------------------
Platform Requirement

Current version is developed and tested in Windows 7 64bit
GPU functions are implemented using CUDA. A Nvidia graphics card is needed.

------------------------------------------------------------------------------------
Simple Usage

1. Put all images in the "img" folder
2. Run "run.cmd"
3. Output model "MESH_refine.ply" is in the "result" folder in PLY format			 
				  
This simple usage uses NVM file generated from VisualSFM (inside the "vsfm" folder) by Changchang Wu
URL: http://ccwu.me/vsfm/
* current version doesn't handle distortion. Distortion estimation is disabled in nv.ini of vsfm.
* Special thanks to ChangChang Wu!

------------------------------------------------------------------------------------ 
Camera Pose Information from SFM file

This software uses SFM file as input to provide the camera pose information, such that you can also use camera poses from other sources.

SFM file format:

<number of cameras>
<list of cameras>
<bounding box>
<image neighbor information>

with camera, bounding box and image neighbor matrix in following format:

<camera> = <file path><row-wise rotation matrix R><translation vector T><fx><fy><cx><cy>
<bounding box> = <minX maxX minY maxY minZ maxZ>
<image neighbor information> = <key frame index><number of neighbors><index list of neighbor frames>

Camera Model in SFM file:

Projection matrix P = K[R | T]
Intrinsic matrix  K = [fx 0 cx; 0 fy cy; 0 0 1;]
* no distortion is handled in the current version

------------------------------------------------------------------------------------ 
"nvm2sfm.exe" is provided to generate SFM file from NVM file of VisualSFM

Usage of nvm2sfm.exe
command line: nvm2sfm.exe [PATH_NVM_FILE] [PATH_SFM_FILE] [BoundingBox_Type]

BoundingBox_Type 0: calculate the bounding box as range of sparse point cloud from NVM
BoundingBox_Type 1: calculate the bounding box as range visible to all cameras (suitable for circulated camera pose around a target object)

------------------------------------------------------------------------------------ 
Advanced Software Description

The whole pipeline is seperated into two sub-modules such that you can evaluate your own sub-modules.

(1). MeshRecon_init takes a SFM file as input, and produces an initial mesh model as output in PLY format.
Usage of MeshRecon_init.exe
command line: MeshRecon_init.exe [PATH_SFM_FILE] [PATH_OUTPUT_MESH]

(2). MeshRecon_refine takes a SFM file and an initial mesh model as input, and produces a refined mesh model as output in PLY format.
Usage of MeshRecon_refine.exe
command line: MeshRecon_refine.exe [PATH_SFM_FILE] [PATH_INITIAL_MESH] [PATH_REFINED_MESH] [Level of Details]

[Level of Details] control the image resolution used for refinement (default 0)
0: high level of details
1: middle level of details
2: low level of details
* higher level of details cost more GPU memory space

------------------------------------------------------------------------------------ 
References

V. H. Hiep, R. Keriven, P. Labatut, and J.-P. Pons. Towards high-resolution large-scale multi-view stereo. In CVPR, 2009