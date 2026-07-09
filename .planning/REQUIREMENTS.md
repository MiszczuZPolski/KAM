# Requirements: KAT - Advanced Medical (KAM)

This document tracks the requirements, features, and specs for the KAT Advanced Medical project.

---

## 1. Functional Requirements

### 1.1 Airway Management
- [x] **Airway Obstruction:** Unconscious patients should require airway management to prevent suffocation.
- [x] **Head Hyper-extension:** Basic physical maneuver to temporarily open/clear the airway.
- [x] **Stable Recovery Position:** Physical positioning to maintain an open airway for an unconscious unit.
- [x] **Airway Devices:** Implement functional medical items:
  - Guedel Tube (Oropharyngeal airway)
  - King LT (Laryngeal tube)
- [x] **Intubation:** Advanced airway management using Laryngoscope and Endotracheal Tubes.
- [x] **Aspiration:** Fluid buildup in airways requiring suctioning.
- [x] **Suction Devices:** Implement suctioning equipment (e.g., Accuvac, Manual Suction Pump).

### 1.2 Breathing & Pulmonology
- [x] **Oxygen Saturation (SpO2):** Real-time tracking of blood oxygen levels.
- [x] **Diagnostics:** Implement Pulse Oximeter tool to measure SpO2 and pulse rate.
- [x] **Visual Indicators:** Cyanosis (blue discoloration of skin/nails) when oxygen saturation falls low.
- [x] **Thoracic Injuries:** Support pneumothorax, tension pneumothorax, and hemothorax, requiring needle decompression or chest tubes.

### 1.3 Circulation & Cardiology
- [x] **Cardiac Rhythms:** Expand standard cardiac arrest to distinct rhythms (VFib, VTach, PEA, Asystole).
- [x] **Defibrillation:** Implement Automated External Defibrillator (AED) to treat shockable rhythms.
- [x] **Blood Typing:** Implement Blood Groups (A, B, AB, O) including Rh Factors (+ / -) and cross-matching rules.
- [x] **Bleeding & Hemorrhage:** Support internal bleeding and hemorrhage.
- [x] **Pain Management:** Implement realistic painkillers and dosage side-effects.
- [x] **CPR Mechanics:** Configurable CPR success rates based on unit training levels.

### 1.4 Disability & Surgery
- [x] **Surgical Interventions:** Require surgical kits and specific environment settings to repair complex trauma.
- [x] **Skeletal Trauma:** Support complex fractures requiring stabilization and surgical repair.

### 1.5 Exposure & Thermal Regulation
- [ ] **Hypothermia & Exposure:** Realistic body temperature fluctuation based on environment, wetness, and wind.
- [ ] **Heat-preserving items:** Blankets, active heating devices, etc.

### 1.6 Burns
- [ ] **Burn Injuries:** Thermal/chemical/electrical burn damage modeling.
- [ ] **Burn Treatments:** Specialized dressings (e.g., gel dressings, burn wraps) and fluids.

### 1.7 Miscellaneous & Quality of Life
- [x] **IV Stand:** Deployable, functional IV stands to hold fluids and administer them to patients.
- [ ] **Big Backpack:** Dedicated medic backpack to accommodate extensive medical gear.

### 1.8 Zeus & Game Master Tools
- [x] **Airway Controls:** Force-clear or obstruct unit airways.
- [x] **Hematology Controls:** Directly alter unit blood volume and blood type.
- [x] **Cardiology Controls:** Set specific cardiac rhythms.
- [x] **Medical Menu:** Open any unit's ACE medical menu directly from Zeus.

---

## 2. Technical & Non-Functional Requirements

- **Framework Compatibility:** All addon files must follow ACE3's API and structure patterns.
- **Performance:** Low CPU overhead during loop execution. Vitals calculation must scale efficiently for large player/AI environments.
- **Multilingual Support:** Localized stringtables (`stringtable.xml`) for all interface terms.
- **Security & Multiplayer:** Code must run cleanly in Multiplayer (MP) with signed PBO keys (`keys/`).
- **Code Quality:** Pass existing syntax and linting checks:
  - SQF validation and styling.
  - Stringtable validation for duplicate keys or missing translations.

## 3. Vitals Loop Refactoring Requirements

- [x] **Private Variable Declarations:** Ensure all locally-assigned variables inside the vitals functions (e.g. `_vasoconstriction`, `_logOutput`) are declared `private` to avoid polluting caller or global namespaces.
- [x] **Robust Parameter Handling:** Add default values to optional/expanded parameters in `params` calls (e.g. `_x params [...]` in `fnc_handleUnitVitals.sqf` adjustments loop) to prevent scripts crashing if medications are added by external/compatibility mods with fewer array elements.
- [x] **SQF Performance Optimizations:**
  - Avoid using dynamically created arrays with boolean `select` for conditional logic inside high-frequency loops (e.g., in SpO2 calculation). Replace with standard `if/then/else` branching.
  - Eliminate unused variables or skip binding unused elements in arrays using `""` in `params`.
- [x] **Debug Logic Safety:** Ensure that debug blocks (like `#ifdef DEBUG_MODE_FULL` in `fnc_handleSimpleVitals.sqf`) define all their local print variables (like `_cardiacOutput`) before usage to prevent runtime crashes when active.

## 4. Real-World Physiological Formulas

- [x] **ODC (Oxy-Hemoglobin Dissociation Curve) Formula:** Calculate oxygen saturation ($S_{O_2}$) from partial pressure of oxygen ($P_a O_2$), pH, temperature, and $PCO_2$ using standard physiological models.
- [x] **Kelman/Severinghaus $P_{50}$ Shift:** Implement $P_{50}$ temperature/pH/$PCO_2$ correction:
  $$P_{50} = 26.8 \times 10^{\left[ 0.4 \times (7.4 - pH) + 0.06 \times \log_{10}(PCO_2 / 40) + 0.024 \times (T - 37) \right]}$$
- [x] **Hill Equation Integration:** Use the corrected $P_{50}$ shift inside the Hill equation to compute SpO2:
  $$S_{O_2} = \frac{PO_2^n}{P_{50}^n + PO_2^n} \quad (\text{where } n = 2.7)$$
- [x] **Thermodynamic Temperature Model:** Upgraded body temperature computation from instant direct calculation to gradual rate-based integration ($\Delta T = \frac{dT}{dt} \cdot \Delta t$).
- [x] **Newton's Law of Cooling:** Implement environmental heat exchange scaled by blood volume (representing thermal mass).
- [x] **Dynamic Metabolic Production:** Implement body core metabolic recovery target (37°C) scaling with hemorrhage status (blood volume).
- [x] **Functional Hand Warmers:** Connect the `handWarmers` array elements to generate active warming rates inside the integration loop.

## 5. Real-World Cardiac Function Models

- [x] **Frank-Starling Stroke Volume:** Stroke volume dynamically models venous return (blood volume) using:
  $$SV = SV_{\text{normal}} \cdot \left( \frac{\text{bloodVolume}}{6.0} \right)^{1.2}$$
- [x] **Baroreflex Heart Rate Boost:** Tachycardia compensation rate scales based on hypovolemia status:
  $$HR_{\text{baro}} = \text{Gain} \cdot \left( 1 - \frac{\text{bloodVolume}}{6.0} \right)$$
- [x] **Chemoreflex Hypoxia Boost:** Heart rate scales in response to hypoxemia:
  $$HR_{\text{hypoxia}} = 80 \cdot (1 - SpO_2)$$
- [x] **Autonomic First-Order Lag Filter:** Stabilizes heart rate transition kinetics to simulate cardiac muscle inertia:
  $$HR_{t+\Delta t} = HR_t + (HR_{\text{target}} - HR_t) \cdot (1 - e^{-\Delta t / \tau})$$

## 6. Renal and Fluid Function Upgrades

- [x] **Kidney Lethal Acidosis Bug:** Correct the `_ph == 3000` case to check `_ph >= 3000`, remove nested redundant condition, and trigger `FatalVitals` event to drive immediate cardiac arrest.
- [x] **Warming Impact Branch Simplification:** Remove the redundant `if/else` checks for `_fluidHeat > 0` in `fnc_getBloodVolumeChange.sqf` and collapse to a single assignment.

## 7. Renal, Vasoconstriction, and Urine Output Upgrades

- [x] **Pressure-Dependent Renal Perfusion (GFR):** Scale kidney filtration rate by Mean Arterial Pressure (MAP):
  - Normal GFR when $\text{MAP} \ge 75$ mmHg.
  - Linear reduction to 0 between 75 and 65 mmHg.
  - Zero filtration/clearance when $\text{MAP} < 65$ mmHg, simulating shock-induced anuria.
- [x] **Urine Volume Tracking:** Record accumulated urine volume over time based on filtration rate (normal rate $\approx 0.5 - 1.0$ mL/min), reset to 0 on full resuscitation/heal.
- [x] **Hypovolemia-Driven Vasoconstriction:** Include a blood volume deficit term to represent persistent vasoconstriction after active bleeding has stopped:
  $$\text{Constriction} = 1 + 0.5 \cdot \text{BleedLoss} + 0.8 \cdot \left( 1 - \frac{\text{bloodVolume}}{6.0} \right) + \text{DrugsAdjustment}$$

## 8. Unconscious Casualty Degradation Upgrades

- [x] **Dynamic Airway Obstruction Check:** Check unconscious patient state every 3 seconds: if they have no airway device, are not in recovery position, and head is not hyperextended, roll a 2% chance of airway tongue obstruction.
- [x] **Comatose Hypoventilation:** Depress respiratory depth by 2.5 points if the patient is unconscious, reducing ventilation and naturally accumulating $PCO_2$ and respiratory acidosis.
- [x] **Comatose Metabolic Depression:** Scale metabolic heat production rate down by 25% for unconscious patients, increasing susceptibility to ambient cooling.

## 9. Vitals Loop Integration

- [x] **Consolidated Loops:** Relocate the renal filtration (GFR, acid clearance, urine tracking) logic and pneumothorax coughing logic into `fnc_handleUnitVitals.sqf`.
- [x] **Remove Old PFH:** Delete/comment out the standalone 20-second kidney PFH in `fnc_init.sqf` to prevent duplicate processing.
- [x] **Temporal Scaling:** Scale GFR and clearance formulas by `_deltaT` to guarantee smooth, continuous integration in the core vitals update loop.

## 10. Code Modernization & Performance Optimizations

- [x] **O(1) HashMap Lookups:** Convert linear gasmask lookups to native `createHashMap` lookups, optimizing high-frequency check loops.
- [x] **Scope Safety:** Enforce proper `private` variable scoping inside `pharma/XEH_postInit.sqf`, `fnc_treatmentAdvanced_ReorientationLocal.sqf`, `fnc_treatmentAdvanced_PervitinLocal.sqf`, and `fnc_fullHealLocal.sqf`.
- [x] **Shadowing Prevention:** Rename local variables in `fnc_retractHeliStretcher.sqf` to prevent scope shadowing of parameters.
- [x] **Array Loop Optimization:** Convert sequential array count checks inside `fnc_gui_updateInjuryListPart.sqf` to short-circuiting `findIf` lookups.
- [x] **Logical Standardization:** Replace unneeded logical negations in `watch/XEH_postInit.sqf` with standard `isEqualTo false` boolean evaluations.



