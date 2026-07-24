# Summer Project: 3D Reconstruction

<p align="center">
  <a href="#license"><img src="https://img.shields.io/badge/license-pending-0E7C66.svg" alt="License"></a> <a href="#paper-or-reference"><img src="https://img.shields.io/badge/paper-reference-1F4E79.svg" alt="Paper or reference"></a> <img src="https://img.shields.io/badge/language-Python-3776AB.svg" alt="Python">
</p>

<p align="center">
  <strong>Computer-vision workspace for image capture, reconstruction, and mesh generation.</strong>
</p>

<p align="center">
  <img src="assets/readme-figure.png" alt="Summer Project: 3D Reconstruction overview" width="100%">
</p>

**Figure 1.** The overview figure follows the reconstruction path from image capture and calibration through feature matching, depth estimation, point-cloud reconstruction, mesh generation, and evaluation.

## Scope

This repository is organized as a conference-style research artifact for image-to-point-cloud and mesh reconstruction workflow. Summer Project organizes assets for a 3D reconstruction workflow, including VisualSFM, CMVS-PMVS, mesh reconstruction, database artifacts, and project documentation. It is a practical workspace for moving from captured images to point clouds and reconstructed meshes.

The README is structured for fast inspection by reviewers and future collaborators: it states the artifact scope, the main entry points, the reproduction path, and the outputs that should be checked after a run.

## Artifact Contents

| Component | Role |
| --- | --- |
| `visualSFM/` | VisualSFM-related reconstruction assets. |
| `CMVS-PMVS/` | dense reconstruction tools and project files. |
| `meshrecon/` | mesh reconstruction components. |
| `3D construction/` | 3D construction workspace and supporting files. |
| `说明文档-分布式移动服务器网络.docx` | project documentation. |

## Reproduction Guide

1. `git clone git@github.com:Hik289/summer-project.git`
2. Open the reconstruction tool folder that matches the desired stage: `visualSFM/`, `CMVS-PMVS/`, or `meshrecon/`.
3. Use the project document as the guide for local system settings and data layout.

For a full rerun, record the data window, random seed, software versions, machine type, and command used for each experiment. Keep raw datasets outside Git unless they are small public fixtures.

## Experimental Workflow

| Stage | What to Check |
| --- | --- |
| Setup | Confirm local data paths, environment packages, and any MATLAB or notebook paths before running experiments. |
| Run | Execute the smallest script or notebook first, then scale to the full experiment once outputs match expectations. |
| Inspect | Compare generated figures, logs, tables, and saved result folders against the intended analysis. |
| Extend | Add new experiments as separate scripts or notebooks with explicit names instead of overwriting existing artifacts. |

## Expected Outputs

- Recreated figures, tables, notebooks, reports, or saved result files from the listed entry points.
- A clear mapping from each experiment command to its generated output location.
- Updated notes when a script depends on local data, private paths, or external software.

## Paper or Reference

No external paper link is currently attached to this project. For now, the code, notebooks, and notes in this repository are the primary reference artifact.

## Citation

If this repository supports academic work, cite the linked paper when available. Otherwise cite the repository version used in your experiment.

```bibtex
@misc{summer_project_artifact_2026,
  title = {{Summer Project: 3D Reconstruction}},
  author = {Hik289},
  year = {2026},
  howpublished = {\url{https://github.com/Hik289/summer-project}},
  note = {Research artifact}
}
```

## License

No explicit license file is included yet. Add one before public reuse, redistribution, or package release.

## Reviewer Notes

| Item | Status |
| --- | --- |
| Code | Included in this repository. |
| Data | Expected to be configured locally unless a small fixture is committed. |
| Environment | Base dependencies are listed in the reproduction guide; pin a lockfile for archival release. |
| Results | Store generated artifacts under the existing result, report, log, or output folders. |
