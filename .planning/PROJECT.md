# Project: KAT - Advanced Medical (KAM)

KAT - Advanced Medical (KAM) is a highly realistic expansion mod for Arma 3, built on top of the **ACE3 Advanced Medical System** and **CBA_A3 (Community Base Addons)**. It aims to elevate the medical gameplay experience in Arma 3 by introducing advanced, real-world-inspired medical procedures, tools, and diagnostics, making specialized medical roles critical while keeping options highly customizable for different playstyles.

---

## 1. Project Vision & Goals

- **Realism & Depth:** Bridge the gap between standard game mechanics and realistic combat medicine. Add advanced airway, breathing, circulation, and surgical interventions.
- **Customizability:** Provide extensive addon options so mission creators and community leads can fine-tune the complexity of the medical system to fit their specific gameplay needs.
- **Integration:** Work seamlessly with the CBA_A3 and ACE3 frameworks, avoiding conflicts and maintaining compatibility with other Arma 3 mods.
- **Zeus Integration:** Empower Game Masters (Zeus) to monitor, debug, and influence unit medical states dynamically during operations.

---

## 2. Technology Stack & Environment

- **Target Engine:** Real Virtuality 4 (Arma 3)
- **Scripting Languages:** SQF (Status Query Function / Arma 3 Scripting Language), Python (for build/validation scripts)
- **Build Tooling:** [HEMTT](https://github.com/hemtt-ci/hemtt) (Arma build system)
- **Compilation/Validation Tooling:** SQFC (SQF Compiler), Custom python validation scripts (`tools/`)
- **Key Dependencies:**
  - [CBA_A3](https://github.com/CBASteam/CBA_A3) (v3.16.0 or later)
  - [ACE3](https://github.com/acemod/ACE3) (v3.16.1 or later)

---

## 3. Directory Layout

- **[`/addons`](file:///C:/Users/bartl/Documents/GitHub/KAM/addons)**: Core module code. Each subdirectory represents an Arma 3 pbo addon component (e.g., airway, breathing, circulation, hypothermia, surgery).
- **[`/tools`](file:///C:/Users/bartl/Documents/GitHub/KAM/tools)**: Build, deployment, style check, and validator scripts (written in Python).
- **[`/include`](file:///C:/Users/bartl/Documents/GitHub/KAM/include)**: Global macro definitions and project config includes.
- **[`/keys`](file:///C:/Users/bartl/Documents/GitHub/KAM/keys)**: Public authority keys used for signing addons.
- **[`/docs`](file:///C:/Users/bartl/Documents/GitHub/KAM/docs)**: Documentation and project guides.
