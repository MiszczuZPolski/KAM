# Roadmap: KAT - Advanced Medical (KAM)

This roadmap outlines completed development milestones, active tasks, and future feature planning.

---

## Phase 1: Core Medical Interventions (Completed)
- [x] **Airway Management:** Intubation, guedel tube, King LT, suctioning devices, and stable recovery position.
- [x] **Breathing & Diagnostics:** SpO2 tracking, pulse oximeter tool, cyanosis modeling, and thoracic trauma (pneumothorax/hemothorax).
- [x] **Zeus Integration:** Basic Zeus modules for managing unit airways and opening medical menus.

---

## Phase 2: Advanced Cardiology, Blood Typing & Surgery (Completed)
- [x] **Defibrillation & Cardiology:** VFib/VTach/PEA/Asystole cardiac arrest rhythms and Automated External Defibrillator (AED) implementation.
- [x] **Blood Typing:** Full A/B/O and Rh (+/-) blood group matrices, compatibility rules, cross-matching, and transfusion reactions.
- [x] **Surgery & Trauma:** Advanced surgical procedures for internal bleeding and complex fractures.
- [x] **IV Stand:** Deployable physical IV stand item.

---

## Phase 3: Hypothermia & Thermal Regulation (Active Development / In Progress)
- [ ] **Core Temperature Loop:** Integrate dynamic body temperature shifts based on wetness, altitude, environment, clothing, and bleeding.
- [ ] **Hypothermia Mechanics:** Shivering, reduced motor functions, and eventual cardiac risks.
- [ ] **Treatment Items:** Thermal blankets, warm fluids, active warming units.

---

## Phase 4: Burns & Advanced Environmental Injuries (Backlog / Planned)
- [ ] **Burn Trauma System:** Distinct burn types (first, second, third degree) and their impact on infection, pain, and fluid loss.
- [ ] **Burn Treatments:** Gel dressings, specialized burn wraps, and skin grafts.
- [ ] **Equipment Expansion:** Dedicated medic backpack model.

---

## Phase 5: Vitals Loop Refactoring & Optimization (Completed)
- [x] **Namespace Safety:** Declare missing private variables (`_vasoconstriction`, `_logOutput`).
- [x] **Medication Param Defaults:** Implement robust parameters in medication adjustment loops.
- [x] **Branching Performance:** Replace dynamic arrays / boolean select with fast `if/then/else` conditionals in SpO2 calculation.
- [x] **Unused Variables:** Clean up 11 unused private variable allocations to save engine CPU cycles.
- [x] **Debug Logic Fix:** Correct the undefined `_cardiacOutput` variable in `fnc_handleSimpleVitals.sqf`.

---

## Phase 6: Real-World Physiology Integration (Completed)
- [x] **P50 Shift:** Implement the Kelman/Severinghaus temperature/pH/CO2 P50 adjustment.
- [x] **Hill Equation SpO2:** Compute the ODC curve using corrected P50 and Hill coefficient.
- [x] **Temperature Thermodynamics:** Implement a rate-based heat transfer equation (Newton's cooling, metabolic, and warmers) for body temperature.
- [x] **Hemodynamic Testing:** Validate vitals outputs across standard, acidosis, fever, and hypercapnia states.

---

## Phase 7: Real-World Cardiac Integration (Completed)
- [x] **Frank-Starling Effect:** Implement stroke volume scaling based on blood volume.
- [x] **Baroreflex Tachycardia:** Implement heart rate compensation for hypovolemia.
- [x] **Chemoreflex Boost:** Implement heart rate boost for low oxygen saturation (hypoxemia).
- [x] **Autonomic Transition Filter:** Implement a first-order lag filter to smooth heart rate adjustments.

---

## Phase 8: Renal and Fluid Function Upgrades (Completed)
- [x] **Lethal Acidosis Fix:** Trigger `FatalVitals` event for `_ph >= 3000` in the kidney function checker.
- [x] **Code Simplification:** Simplify redundant `warmingImpact` branches in `fnc_getBloodVolumeChange.sqf`.

---

## Phase 9: Renal, Vasoconstriction, and Urine Output Upgrades (Completed)
- [x] **Pressure-Dependent Renal Perfusion:** Scale kidney filtration GFR and acid clearance dynamically using MAP perfusion factor.
- [x] **Urine Output Tracking:** Implement a state variable recording urine production (mL), resetting on full recovery.
- [x] **Hypovolemia Vasoconstriction:** Integrate blood volume deficit factor into the vascular constriction equation to simulate prolonged constriction after bleeding arrest.

---

## Phase 10: Unconscious Casualty Degradation Upgrades (Completed)
- [x] **Dynamic Tongue Obstruction:** Checked unmanaged comatose casualties every 3 seconds for a 2% chance of tongue occlusion.
- [x] **Comatose Hypoventilation:** Reduced respiratory depth by 2.5 points during unconsciousness to trigger hypercapnia and respiratory acidosis.
- [x] **Metabolic Rate Drop:** Reduced unconscious metabolic heat production rate by 25%.

---

## Phase 11: Vitals Loop Integration (Completed)
- [x] **Consolidated updates:** Moved kidney (GFR, pH clearance, urine tracking) and pneumothorax coughing calculations out of separate CBA PFH loops and placed them directly into `fnc_handleUnitVitals.sqf`.
- [x] **Removed Standalone Loops:** Removed the standalone kidney PFH loop from `fnc_init.sqf` to prevent duplicate updates.
- [x] **Delta-T Integration:** Mathematically scaled renal and urinary rates by `_deltaT` to guarantee a smooth, continuous integration.

---

## Phase 12: Repository Knowledge Base Updates (Completed)
- [x] **Function Inventory Mapping:** Scanned and indexed SQF function definitions across all 17 addons.
- [x] **Addon Overviews:** Documented clinical, physical, and gameplay roles of each individual module.
- [x] **Custom Knowledge Base:** Wrote detailed state variables and key mechanics mapping into `.planning/KNOWLEDGE_BASE.md`.

---

## Phase 13: Code Modernization & Performance Optimizations (Completed)
- [x] **HashMap Lookups:** Initialized and implemented optimized gasmask lookup HashMaps in `breathing` and `chemical` modules.
- [x] **Scoping & Shadowing:** Corrected local private variables and parameter shadowing warnings in `pharma` and `stretcher` addons.
- [x] **Logical & Array Optimizations:** Converted linear array loops to `findIf` and standardized negated if-checks to `isEqualTo false`.

---

## Phase 14: Function Header Inspections & Verification (Completed)
- [x] **Parameter Auditing:** Analyzed mismatching function argument numbers and Example usage blocks across the repository.
- [x] **Header Alignment:** Updated headers in initialization (`pharma`, `breathing`), mask removal, and chemical zone logic to correctly represent parameters.
- [x] **Static Verification:** Verified compilation syntax safety of documentation updates via HEMTT check runner.

---

## Phase 15: CI/CD & Build Environment Optimizations (Ongoing)
- [x] **Build System Migration:** Migrate to HEMTT build runner.
- [x] **SQF Compliers:** Enable SQFC integration for static analysis checks.
- [ ] **Automated Tests:** Add syntax/linting workflow tests to GitHub Actions.


