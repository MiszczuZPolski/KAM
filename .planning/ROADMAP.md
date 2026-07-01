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

## Phase 10: CI/CD & Build Environment Optimizations (Ongoing)
- [x] **Build System Migration:** Migrate to HEMTT build runner.
- [x] **SQF Compliers:** Enable SQFC integration for static analysis checks.
- [ ] **Automated Tests:** Add syntax/linting workflow tests to GitHub Actions.


