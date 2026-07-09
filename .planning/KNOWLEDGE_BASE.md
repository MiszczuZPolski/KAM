# KAM (KAT - Advanced Medical) Repository Knowledge Base

This document contains a comprehensive analysis and mapping of all addons within the KAM repository, detailing their purpose, functions, variables, and clinical/gameplay interactions.

---

## Addon: `airway`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Airway Management (Mechanical Obstruction & Occlusion)
**Overview:** Implements mechanical airway injuries and interventions. Simulates tongue obstruction from muscle relaxation in unconscious patients, fluid occlusion (blood/vomit), head hyperextension, recovery position, and airway devices.

**State Variables:**
- `kat_airway_occluded` (bool) - True if the airway is blocked by fluids (vomit/blood) requiring suctioning.
- `kat_airway_obstruction` (bool) - True if the tongue is obstructing the throat (can be cleared by hyperextension or devices).
- `kat_airway_recovery` (bool) - True if the patient is turned into the recovery position (prevents and clears tongue obstruction).
- `kat_airway_overstretch` (bool) - True if the head is hyperextended (head tilt / chin lift).
- `kat_airway_airway` (bool) - True if an airway device is currently inserted.
- `kat_airway_airway_item` (string) - Classname of the inserted device (e.g., OPA / LMA / ETT).

**Key Mechanics:**
- **Suctioning:** Accuvac suction device clears fluid occlusions.
- **Head Tilt / Chin Lift:** Overstretches the airway, providing a temporary path around a tongue obstruction.
- **Airway Devices:** OPA (Guedel tube), LMA (Laryngeal Mask), and ETT (Endotracheal Tube) secure the airway permanently against muscle collapse.
- **Recovery Position:** Prevents aspiration and tongue obstruction.

### Functions List:

#### `kat_airway_fnc_checkAirway`
- **Author:** Katalam
- **File Path:** [fnc_checkAirway.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_checkAirway.sqf)
- **Description:** Checks need of airway management

#### `kat_airway_fnc_checkMask`
- **Author:** Mazinski
- **File Path:** [fnc_checkMask.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_checkMask.sqf)
- **Description:** Checks if patient has mask on

#### `kat_airway_fnc_checkRecovery`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_checkRecovery.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_checkRecovery.sqf)
- **Description:** Checks if guedel or larynx was placed before

#### `kat_airway_fnc_fullHealLocal`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_fullHealLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_fullHealLocal.sqf)
- **Description:** Local callback for fully healing a patient.

#### `kat_airway_fnc_gui_updateBodyImage`
- **Author:** Blue
- **File Path:** [fnc_gui_updateBodyImage.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_gui_updateBodyImage.sqf)
- **Description:** Updates the body image for given target.

#### `kat_airway_fnc_gui_updateInjuryListGeneral`
- **Author:** AtrixZockt
- **File Path:** [fnc_gui_updateInjuryListGeneral.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_gui_updateInjuryListGeneral.sqf)
- **Description:** Updates injury list for given body part for the target.

#### `kat_airway_fnc_gui_updateInjuryListPart`
- **Author:** AtrixZockt
- **File Path:** [fnc_gui_updateInjuryListPart.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_gui_updateInjuryListPart.sqf)
- **Description:** Updates injury list for given body part for the target.

#### `kat_airway_fnc_handleAirway`
- **Author:** Katalam
- **File Path:** [fnc_handleAirway.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_handleAirway.sqf)
- **Description:** Handler for airway damage.

#### `kat_airway_fnc_handlePuking`
- **Author:** Katalam, edited by MiszczuZPolski
- **File Path:** [fnc_handlePuking.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_handlePuking.sqf)
- **Description:** Called when a unit enters the unconscious state. Will add a FrameHandler for puking while unconscious.

#### `kat_airway_fnc_handleRecoveryPosition`
- **Author:** Blue
- **File Path:** [fnc_handleRecoveryPosition.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_handleRecoveryPosition.sqf)
- **Description:** Handle cancelling recovery position if patient is in one

#### `kat_airway_fnc_handleRespawn`
- **Author:** YetheSamartaka
- **File Path:** [fnc_handleRespawn.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_handleRespawn.sqf)
- **Description:** Ensures proper initial values reset on respawn

#### `kat_airway_fnc_init`
- **Author:** Katalam
- **File Path:** [fnc_init.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_init.sqf)
- **Description:** Initializes unit variables.

#### `kat_airway_fnc_startHeadTurning`
- **Author:** Blue
- **File Path:** [fnc_startHeadTurning.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_startHeadTurning.sqf)
- **Description:** Begin head turning

#### `kat_airway_fnc_treatmentAdvanced_Accuvac`
- **Author:** Katalam
- **File Path:** [fnc_treatmentAdvanced_Accuvac.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_Accuvac.sqf)
- **Description:** Airway Management for occluding

#### `kat_airway_fnc_treatmentAdvanced_AccuvacLocal`
- **Author:** Katalam
- **File Path:** [fnc_treatmentAdvanced_AccuvacLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_AccuvacLocal.sqf)
- **Description:** Airway Management for occluding local

#### `kat_airway_fnc_treatmentAdvanced_AccuvacStart`
- **Author:** Blue
- **File Path:** [fnc_treatmentAdvanced_AccuvacStart.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_AccuvacStart.sqf)
- **Description:** Play Suction Devices sound

#### `kat_airway_fnc_treatmentAdvanced_CancelRecoveryPosition`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_treatmentAdvanced_CancelRecoveryPosition.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_CancelRecoveryPosition.sqf)
- **Description:** Set patient into recovery position preventing further airway occlusion.

#### `kat_airway_fnc_treatmentAdvanced_CancelRecoveryPositionLocal`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_treatmentAdvanced_CancelRecoveryPositionLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_CancelRecoveryPositionLocal.sqf)
- **Description:** Local callback for set patient from recovery position.

#### `kat_airway_fnc_treatmentAdvanced_RecoveryPosition`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_treatmentAdvanced_RecoveryPosition.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_RecoveryPosition.sqf)
- **Description:** Set patient into recovery position preventing further airway occlusion.

#### `kat_airway_fnc_treatmentAdvanced_RecoveryPositionLocal`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_treatmentAdvanced_RecoveryPositionLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_RecoveryPositionLocal.sqf)
- **Description:** Local callback for set patient into recovery position.

#### `kat_airway_fnc_treatmentAdvanced_RemoveAirwayItem`
- **Author:** Miss Heda, edited by apo_tle
- **File Path:** [fnc_treatmentAdvanced_RemoveAirwayItem.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_RemoveAirwayItem.sqf)
- **Description:** Removing Guedeltubus or KingLT

#### `kat_airway_fnc_treatmentAdvanced_RemoveAirwayItemLocal`
- **Author:** Miss Heda
- **File Path:** [fnc_treatmentAdvanced_RemoveAirwayItemLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_RemoveAirwayItemLocal.sqf)
- **Description:** Removing Guedeltubus & KingLT

#### `kat_airway_fnc_treatmentAdvanced_airway`
- **Author:** Katalam
- **File Path:** [fnc_treatmentAdvanced_airway.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_airway.sqf)
- **Description:** Airway Management for collapsing

#### `kat_airway_fnc_treatmentAdvanced_airwayLocal`
- **Author:** Katalam, edited by MiszczuZPolski, Miss Heda & apo_tle
- **File Path:** [fnc_treatmentAdvanced_airwayLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_airwayLocal.sqf)
- **Description:** Airway Management for collapsing local

#### `kat_airway_fnc_treatmentAdvanced_hyperextendHead`
- **Author:** Katalam
- **File Path:** [fnc_treatmentAdvanced_hyperextendHead.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\airway\functions\fnc_treatmentAdvanced_hyperextendHead.sqf)
- **Description:** Overstretch the head of the patient for airway management without items

---

## Addon: `breathing`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Breathing & Pulmonary Pathology (Pneumothorax & Ventilation)
**Overview:** Simulates respiratory trauma including simple pneumothorax, tension pneumothorax, hemothorax, chest seals, needle decompression, chest tubes, and bag-valve-mask (BVM) manual ventilation.

**State Variables:**
- `kat_breathing_pneumothorax` (number, 0-4) - Severity of lung collapse.
- `kat_breathing_tensionpneumothorax` (bool) - High-pressure tension pneumothorax, causing progressive hemodynamic collapse.
- `kat_breathing_hemopneumothorax` (bool) - Blood accumulation in the pleural cavity.
- `kat_breathing_activeChestSeal` (bool) - True if a chest seal is applied to a penetrating chest wound.
- `kat_breathing_BVMInUse` (bool) - True if a bag-valve-mask is actively ventilating the patient.
- `kat_breathing_oxygenTankConnected` (bool) - True if oxygen supply is connected to BVM/cannula.

**Key Mechanics:**
- **Lung Sounds:** Listening with a stethoscope identifies unilateral diminished or absent breath sounds.
- **Decompression:** Needle chest decompression converts a tension pneumothorax into a simple one.
- **Chest Tube:** Provides definitive drainage of air and blood from the chest cavity.
- **BVM Ventilation:** Manually breaths for apneic or cardiac arrest casualties, delivering oxygen via mask.

### Functions List:

#### `kat_breathing_fnc_attachPersonalOxygen`
- **Author:** Mazinski
- **File Path:** [fnc_attachPersonalOxygen.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_attachPersonalOxygen.sqf)
- **Description:** Attaches personal oxygen tank to player

#### `kat_breathing_fnc_attachVehicleOxygen`
- **Author:** Mazinski
- **File Path:** [fnc_attachVehicleOxygen.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_attachVehicleOxygen.sqf)
- **Description:** Attaches vehicle oxygen to player

#### `kat_breathing_fnc_canUseBVM`
- **Author:** Blue
- **File Path:** [fnc_canUseBVM.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_canUseBVM.sqf)
- **Description:** Check if patient can have BVM used on them

#### `kat_breathing_fnc_checkAircraftOxygen`
- **Author:** Mazinski
- **File Path:** [fnc_checkAircraftOxygen.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_checkAircraftOxygen.sqf)
- **Description:** Checks status of attached oxygen

#### `kat_breathing_fnc_checkBreathing`
- **Author:** Mazinski
- **File Path:** [fnc_checkBreathing.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_checkBreathing.sqf)
- **Description:** Modified: Blue

#### `kat_breathing_fnc_checkOxygenMask`
- **Author:** Mazinski
- **File Path:** [fnc_checkOxygenMask.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_checkOxygenMask.sqf)
- **Description:** Checks if patient has an oxygen mask on

#### `kat_breathing_fnc_checkPersonalOxygen`
- **Author:** Mazinski
- **File Path:** [fnc_checkPersonalOxygen.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_checkPersonalOxygen.sqf)
- **Description:** Checks status of attached oxygen

#### `kat_breathing_fnc_checkPulseOximeter`
- **Author:** Blue
- **File Path:** [fnc_checkPulseOximeter.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_checkPulseOximeter.sqf)
- **Description:** Checks if target arm has pulse oximeter.

#### `kat_breathing_fnc_createTamponade`
- **Author:** Mazinski
- **File Path:** [fnc_createTamponade.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_createTamponade.sqf)
- **Description:** Called when an effusion starts

#### `kat_breathing_fnc_detachPersonalOxygen`
- **Author:** Mazinski
- **File Path:** [fnc_detachPersonalOxygen.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_detachPersonalOxygen.sqf)
- **Description:** Detaches personal oxygen mask from player

#### `kat_breathing_fnc_fullHealLocal`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_fullHealLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_fullHealLocal.sqf)
- **Description:** Local callback for fully healing a patient.

#### `kat_breathing_fnc_gui_updateBodyImage`
- **Author:** Blue
- **File Path:** [fnc_gui_updateBodyImage.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_gui_updateBodyImage.sqf)
- **Description:** Updates the body image for given target.

#### `kat_breathing_fnc_gui_updateInjuryListPart`
- **Author:** Blue
- **File Path:** [fnc_gui_updateInjuryListPart.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_gui_updateInjuryListPart.sqf)
- **Description:** Updates injury list for given body part for the target.

#### `kat_breathing_fnc_gui_updateInjuryListWounds`
- **Author:** Blue
- **File Path:** [fnc_gui_updateInjuryListWounds.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_gui_updateInjuryListWounds.sqf)
- **Description:** Updates injury list for given body part for the target.

#### `kat_breathing_fnc_handleBreathing`
- **Author:** Katalam, edited by Tomcat, Kygan, YetheSamartaka and Mazinski
- **File Path:** [fnc_handleBreathing.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_handleBreathing.sqf)
- **Description:** Handling oxygen saturation for breathing

#### `kat_breathing_fnc_handleBreathingConditions`
- **Author:** Mazinski
- **File Path:** [fnc_handleBreathingConditions.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_handleBreathingConditions.sqf)
- **Description:** Monitors breathing conditions.

#### `kat_breathing_fnc_handlePneumothoraxDeterioration`
- **Author:** Blue
- **File Path:** [fnc_handlePneumothoraxDeterioration.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_handlePneumothoraxDeterioration.sqf)
- **Description:** Handle pneumothorax deterioration

#### `kat_breathing_fnc_handleRespawn`
- **Author:** YetheSamartaka
- **File Path:** [fnc_handleRespawn.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_handleRespawn.sqf)
- **Description:** Ensures proper initial values reset on respawn

#### `kat_breathing_fnc_hasBVM`
- **Author:** Blue
- **File Path:** [fnc_hasBVM.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_hasBVM.sqf)
- **Description:** Check if patient has any kind of BVM

#### `kat_breathing_fnc_hasOxygenTank`
- **Author:** Blue
- **File Path:** [fnc_hasOxygenTank.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_hasOxygenTank.sqf)
- **Description:** Check if target has any kind of oxygen tank

#### `kat_breathing_fnc_inflictAdvancedPneumothorax`
- **Author:** Blue
- **File Path:** [fnc_inflictAdvancedPneumothorax.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_inflictAdvancedPneumothorax.sqf)
- **Description:** Inflict advanced pneumothorax

#### `kat_breathing_fnc_init`
- **Author:** Katalam
- **File Path:** [fnc_init.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_init.sqf)
- **Description:** Initializes unit variables.

#### `kat_breathing_fnc_inspectChest`
- **Author:** Blue
- **File Path:** [fnc_inspectChest.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_inspectChest.sqf)
- **Description:** Inspect chest for injuries

#### `kat_breathing_fnc_listenLungs`
- **Author:** Battlekeeper, modified by YetheSamartaka, Tomcat and Blue
- **File Path:** [fnc_listenLungs.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_listenLungs.sqf)
- **Description:** Handles listening to lungs.

#### `kat_breathing_fnc_refillOxygenTank`
- **Author:** Blue
- **File Path:** [fnc_refillOxygenTank.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_refillOxygenTank.sqf)
- **Description:** Refill unit's portable oxygen tank

#### `kat_breathing_fnc_removeOxygenMask`
- **Author:** Mazinski
- **File Path:** [fnc_removeOxygenMask.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_removeOxygenMask.sqf)
- **Description:** Removes oxygen mask from player

#### `kat_breathing_fnc_treatmentAdvanced_chestSeal`
- **Author:** Katalam
- **File Path:** [fnc_treatmentAdvanced_chestSeal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_chestSeal.sqf)
- **Description:** Treatment for a pulmo injury

#### `kat_breathing_fnc_treatmentAdvanced_chestSealLocal`
- **Author:** Katalam, modified by Kygan, YetheSamartaka and Tomcat.
- **File Path:** [fnc_treatmentAdvanced_chestSealLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_chestSealLocal.sqf)
- **Description:** handles chest seal treatment

#### `kat_breathing_fnc_treatmentAdvanced_hemopneumothorax`
- **Author:** Kygan
- **File Path:** [fnc_treatmentAdvanced_hemopneumothorax.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_hemopneumothorax.sqf)
- **Description:** Treatment for hemopneumothorax

#### `kat_breathing_fnc_treatmentAdvanced_hemopneumothoraxLocal`
- **Author:** Kygan, modified by YetheSamartaka and Tomcat.
- **File Path:** [fnc_treatmentAdvanced_hemopneumothoraxLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_hemopneumothoraxLocal.sqf)
- **Description:** Treatment for hemopneumothorax

#### `kat_breathing_fnc_treatmentAdvanced_nasalCannula`
- **Author:** apo_tle
- **File Path:** [fnc_treatmentAdvanced_nasalCannula.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_nasalCannula.sqf)
- **Description:** Inserting Nasal Cannula

#### `kat_breathing_fnc_treatmentAdvanced_nasalCannulaLocal`
- **Author:** apo_tle
- **File Path:** [fnc_treatmentAdvanced_nasalCannulaLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_nasalCannulaLocal.sqf)
- **Description:** Inserting Nasal Cannula

#### `kat_breathing_fnc_treatmentAdvanced_pulseoximeter`
- **Author:** Katalam
- **File Path:** [fnc_treatmentAdvanced_pulseoximeter.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_pulseoximeter.sqf)
- **Description:** docks a pulseoximeter on the patient

#### `kat_breathing_fnc_treatmentAdvanced_pulseoximeterLocal`
- **Author:** Katalam
- **File Path:** [fnc_treatmentAdvanced_pulseoximeterLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_pulseoximeterLocal.sqf)
- **Description:** Puts a pulseoximeter on the patient

#### `kat_breathing_fnc_treatmentAdvanced_removeNasalCannula`
- **Author:** apo_tle
- **File Path:** [fnc_treatmentAdvanced_removeNasalCannula.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_removeNasalCannula.sqf)
- **Description:** Removes Nasal Cannula from patient and returns it to medic if reusable airway items is enabled

#### `kat_breathing_fnc_treatmentAdvanced_removeNasalCannulaLocal`
- **Author:** apo_tle
- **File Path:** [fnc_treatmentAdvanced_removeNasalCannulaLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_removeNasalCannulaLocal.sqf)
- **Description:** Removes Nasal Cannula from patient and returns it to medic if reusable airway items is enabled

#### `kat_breathing_fnc_treatmentAdvanced_removePulseoximeter`
- **Author:** Katalam
- **File Path:** [fnc_treatmentAdvanced_removePulseoximeter.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_removePulseoximeter.sqf)
- **Description:** Removes a pulseoximeter for a patient and adds Item to the caller

#### `kat_breathing_fnc_treatmentAdvanced_tensionpneumothorax`
- **Author:** Kygan
- **File Path:** [fnc_treatmentAdvanced_tensionpneumothorax.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_tensionpneumothorax.sqf)
- **Description:** Treatment for hemopneumothorax

#### `kat_breathing_fnc_treatmentAdvanced_tensionpneumothoraxLocal`
- **Author:** Kygan, modified by YetheSamartaka and Tomcat.
- **File Path:** [fnc_treatmentAdvanced_tensionpneumothoraxLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_treatmentAdvanced_tensionpneumothoraxLocal.sqf)
- **Description:** Treatment for tension pneumothorax

#### `kat_breathing_fnc_useBVM`
- **Author:** Blue
- **File Path:** [fnc_useBVM.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_useBVM.sqf)
- **Description:** Handles BVM usage.

#### `kat_breathing_fnc_woundsHandlerPulmoHit`
- **Author:** Katalam, LinkIsGrim
- **File Path:** [fnc_woundsHandlerPulmoHit.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\breathing\functions\fnc_woundsHandlerPulmoHit.sqf)
- **Description:** Called when a unit is damaged.

---

## Addon: `chemical`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Chemical Warfare & Toxicology (Nerve Agents & Gas Masks)
**Overview:** Models chemical warfare agents (such as Sarin nerve gas) causing miosis, respiratory arrest, seizures, and bradycardia, along with gas masks and autoinjectors.

**State Variables:**
- `kat_chemical_airPoisoning` (number) - Concentration of nerve agent in the bloodstream.
- `kat_chemical_maskActive` (bool) - True if player has a functional protective gas mask equipped.
- `kat_chemical_decontaminated` (bool) - True if the unit has been washed or decontaminated.

**Key Mechanics:**
- **Nerve Agent Exposure:** Causes progressive miosis (pupil constriction), seizures, muscle twitching, and fatal respiratory failure.
- **CBRN Autoinjectors:** Epinephrine, Atropine, Obidoxime, and Diazepam treat nerve agent symptoms.
- **Gas Mask Filtration:** Protects the respiratory tract from environmental toxins.

### Functions List:

#### `kat_chemical_fnc_AttributeRadius`
- **Author:** DiGii
- **File Path:** [fnc_AttributeRadius.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_AttributeRadius.sqf)
- **Description:** 

#### `kat_chemical_fnc_CASCreateGas`
- **Author:** DiGii
- **File Path:** [fnc_CASCreateGas.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_CASCreateGas.sqf)
- **Description:** 

#### `kat_chemical_fnc_GasTripEffect`
- **Author:** DiGii
- **File Path:** [fnc_GasTripEffect.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_GasTripEffect.sqf)
- **Description:** 

#### `kat_chemical_fnc_addToExposureWatcher`
- **Author:** DiGii
- **File Path:** [fnc_addToExposureWatcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_addToExposureWatcher.sqf)
- **Description:** Asks the server to register a unit with the exposure watcher PFH so its

#### `kat_chemical_fnc_applyDelayedEffect`
- **Author:** DiGii
- **File Path:** [fnc_applyDelayedEffect.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_applyDelayedEffect.sqf)
- **Description:** Dispatcher for delayed effects fired by the exposure watcher PFH. Runs

#### `kat_chemical_fnc_applyMustardDamage`
- **Author:** DiGii
- **File Path:** [fnc_applyMustardDamage.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_applyMustardDamage.sqf)
- **Description:** Applies one tick of mustard damage to a unit. Inflicts chemical pulmonary

#### `kat_chemical_fnc_breathing`
- **Author:** DiGii
- **File Path:** [fnc_breathing.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_breathing.sqf)
- **Description:** Handles the breathing sound for gasMasks

#### `kat_chemical_fnc_canPutGasMask`
- **Author:** DiGii
- **File Path:** [fnc_canPutGasMask.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_canPutGasMask.sqf)
- **Description:** 

#### `kat_chemical_fnc_canPutOnGasMask`
- **Author:** Unknown
- **File Path:** [fnc_canPutOnGasMask.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_canPutOnGasMask.sqf)
- **Description:** No description available.

#### `kat_chemical_fnc_canReplaceFilter`
- **Author:** DiGii
- **File Path:** [fnc_canReplaceFilter.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_canReplaceFilter.sqf)
- **Description:** 

#### `kat_chemical_fnc_canTakeOffGasMask`
- **Author:** Unknown
- **File Path:** [fnc_canTakeOffGasMask.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_canTakeOffGasMask.sqf)
- **Description:** No description available.

#### `kat_chemical_fnc_changeGasMaskFilter`
- **Author:** DiGii
- **File Path:** [fnc_changeGasMaskFilter.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_changeGasMaskFilter.sqf)
- **Description:** 

#### `kat_chemical_fnc_checkGasMaskDur`
- **Author:** DiGii
- **File Path:** [fnc_checkGasMaskDur.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_checkGasMaskDur.sqf)
- **Description:** 

#### `kat_chemical_fnc_clearContamination`
- **Author:** DiGii
- **File Path:** [fnc_clearContamination.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_clearContamination.sqf)
- **Description:** Clears skin contamination on a patient (mustard or VX) and zeroes the

#### `kat_chemical_fnc_contaminationTickPFH`
- **Author:** DiGii
- **File Path:** [fnc_contaminationTickPFH.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_contaminationTickPFH.sqf)
- **Description:** Server-side per-unit PFH that re-applies the gas effect at a fixed interval

#### `kat_chemical_fnc_createSealAction`
- **Author:** DiGii, MiszczuZPolski
- **File Path:** [fnc_createSealAction.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_createSealAction.sqf)
- **Description:** 

#### `kat_chemical_fnc_csGrenade`
- **Author:** DiGii, MiszczuPolski
- **File Path:** [fnc_csGrenade.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_csGrenade.sqf)
- **Description:** Spawns Patricles for the Gas zone

#### `kat_chemical_fnc_decontaminate`
- **Author:** DiGii
- **File Path:** [fnc_decontaminate.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_decontaminate.sqf)
- **Description:** Self-action handler: decontaminate skin contamination (mustard, VX) on

#### `kat_chemical_fnc_displayGasMaskDur`
- **Author:** DiGii
- **File Path:** [fnc_displayGasMaskDur.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_displayGasMaskDur.sqf)
- **Description:** 

#### `kat_chemical_fnc_effect_chlorine`
- **Author:** DiGii
- **File Path:** [fnc_effect_chlorine.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_effect_chlorine.sqf)
- **Description:** Chlorine (legacy "Toxic Gas" / KAT_toxicLvL = 1). Choking agent, mask-sufficient.

#### `kat_chemical_fnc_effect_cs`
- **Author:** DiGii
- **File Path:** [fnc_effect_cs.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_effect_cs.sqf)
- **Description:** CS / tear gas effect. Lifted from the original fnc_poison.sqf:40-45 branch.

#### `kat_chemical_fnc_effect_mustard`
- **Author:** DiGii
- **File Path:** [fnc_effect_mustard.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_effect_mustard.sqf)
- **Description:** Mustard / Yperite (HD). Blister agent — REQUIRES CBRN suit. Sets skin

#### `kat_chemical_fnc_effect_phosgene`
- **Author:** DiGii
- **File Path:** [fnc_effect_phosgene.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_effect_phosgene.sqf)
- **Description:** Phosgene (CG). Choking agent, mask-sufficient. Famous "silent killer" —

#### `kat_chemical_fnc_effect_sarin`
- **Author:** DiGii
- **File Path:** [fnc_effect_sarin.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_effect_sarin.sqf)
- **Description:** Sarin (GB). G-series nerve agent, fast-acting. REQUIRES CBRN suit.

#### `kat_chemical_fnc_effect_vx`
- **Author:** DiGii
- **File Path:** [fnc_effect_vx.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_effect_vx.sqf)
- **Description:** VX. V-series nerve agent — REQUIRES CBRN suit. Slower onset than Sarin but

#### `kat_chemical_fnc_emitSmellHint`
- **Author:** DiGii
- **File Path:** [fnc_emitSmellHint.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_emitSmellHint.sqf)
- **Description:** Emits a one-shot smell hint to the local player when first entering a cloud

#### `kat_chemical_fnc_enableChemDetector`
- **Author:** Mazinski
- **File Path:** [fnc_enableChemDetector.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_enableChemDetector.sqf)
- **Description:** Enables the audio on the Chemical Detector.

#### `kat_chemical_fnc_exposureWatcherPFH`
- **Author:** DiGii
- **File Path:** [fnc_exposureWatcherPFH.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_exposureWatcherPFH.sqf)
- **Description:** Server-side per-frame handler that checks deadline variables on tracked

#### `kat_chemical_fnc_fullHealLocal`
- **Author:** Glowbal, Brett Mayson
- **File Path:** [fnc_fullHealLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_fullHealLocal.sqf)
- **Description:** Local callback for fully healing a patient.

#### `kat_chemical_fnc_gasManagerPFH`
- **Author:** tcvm, johnb43
- **File Path:** [fnc_gasManagerPFH.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_gasManagerPFH.sqf)
- **Description:** Modified by: MiszczuZPolski

#### `kat_chemical_fnc_gasmodule`
- **Author:** DiGii, MiszczuZPolski
- **File Path:** [fnc_gasmodule.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_gasmodule.sqf)
- **Description:** This cant be called manualy!

#### `kat_chemical_fnc_getList`
- **Author:** DiGii
- **File Path:** [fnc_getList.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_getList.sqf)
- **Description:** This cant be called manualy!

#### `kat_chemical_fnc_giveUnitGasMask`
- **Author:** DiGii
- **File Path:** [fnc_giveUnitGasMask.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_giveUnitGasMask.sqf)
- **Description:** 

#### `kat_chemical_fnc_gui_updateBodyImage`
- **Author:** Blue
- **File Path:** [fnc_gui_updateBodyImage.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_gui_updateBodyImage.sqf)
- **Description:** Updates the body image for given target.

#### `kat_chemical_fnc_gui_updateInjuryListGeneral`
- **Author:** DiGii
- **File Path:** [fnc_gui_updateInjuryListGeneral.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_gui_updateInjuryListGeneral.sqf)
- **Description:** Updates injury list for given body part for the target.

#### `kat_chemical_fnc_handleFired`
- **Author:** DiGii
- **File Path:** [fnc_handleFired.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_handleFired.sqf)
- **Description:** 

#### `kat_chemical_fnc_handleGasMaskDur`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_handleGasMaskDur.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_handleGasMaskDur.sqf)
- **Description:** 

#### `kat_chemical_fnc_handleRespawn`
- **Author:** YetheSamartaka, Brett Mayson
- **File Path:** [fnc_handleRespawn.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_handleRespawn.sqf)
- **Description:** Ensures proper initial values reset on respawn

#### `kat_chemical_fnc_hasCBRNProtection`
- **Author:** DiGii
- **File Path:** [fnc_hasCBRNProtection.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_hasCBRNProtection.sqf)
- **Description:** Checks whether a unit has full CBRN protection (gas mask AND a uniform on

#### `kat_chemical_fnc_hasDetector`
- **Author:** DiGii
- **File Path:** [fnc_hasDetector.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_hasDetector.sqf)
- **Description:** 

#### `kat_chemical_fnc_hasGasMaskON`
- **Author:** DiGii
- **File Path:** [fnc_hasGasMaskON.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_hasGasMaskON.sqf)
- **Description:** 

#### `kat_chemical_fnc_hasGasmask`
- **Author:** DiGii
- **File Path:** [fnc_hasGasmask.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_hasGasmask.sqf)
- **Description:** 

#### `kat_chemical_fnc_hideChemDetector`
- **Author:** Garth 'L-H' de Wet
- **File Path:** [fnc_hideChemDetector.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_hideChemDetector.sqf)
- **Description:** Modified: Mazinski

#### `kat_chemical_fnc_init`
- **Author:** DiGii
- **File Path:** [fnc_init.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_init.sqf)
- **Description:** 

#### `kat_chemical_fnc_initGasRegistry`
- **Author:** DiGii
- **File Path:** [fnc_initGasRegistry.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_initGasRegistry.sqf)
- **Description:** Builds the gas registry hashmap. Each entry maps a gas-id string to a

#### `kat_chemical_fnc_initModule`
- **Author:** DiGii
- **File Path:** [fnc_initModule.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_initModule.sqf)
- **Description:** Initializes placed Module

#### `kat_chemical_fnc_poison`
- **Author:** DiGii
- **File Path:** [fnc_poison.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_poison.sqf)
- **Description:** Per-gas dispatcher. Validates the unit, checks protection (mask only or

#### `kat_chemical_fnc_putOnGasMask`
- **Author:** Unknown
- **File Path:** [fnc_putOnGasMask.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_putOnGasMask.sqf)
- **Description:** No description available.

#### `kat_chemical_fnc_scheduleAirPoisoningOnset`
- **Author:** DiGii
- **File Path:** [fnc_scheduleAirPoisoningOnset.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_scheduleAirPoisoningOnset.sqf)
- **Description:** Implements the legacy in-cloud infection countdown used by chlorine.

#### `kat_chemical_fnc_scheduleNerveSymptomChain`
- **Author:** DiGii
- **File Path:** [fnc_scheduleNerveSymptomChain.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_scheduleNerveSymptomChain.sqf)
- **Description:** Schedules the nerve-agent symptom chain (vomit -> unconscious -> cardiac arrest)

#### `kat_chemical_fnc_showChemDetector`
- **Author:** Garth 'L-H' de Wet
- **File Path:** [fnc_showChemDetector.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_showChemDetector.sqf)
- **Description:** Modified: Mazinski

#### `kat_chemical_fnc_spawnSmoke`
- **Author:** DiGii
- **File Path:** [fnc_spawnSmoke.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_spawnSmoke.sqf)
- **Description:** 

#### `kat_chemical_fnc_startContaminationTick`
- **Author:** DiGii
- **File Path:** [fnc_startContaminationTick.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_startContaminationTick.sqf)
- **Description:** Server-side: starts the contamination tick PFH for a unit if not already

#### `kat_chemical_fnc_takeOffGasMask`
- **Author:** Unknown
- **File Path:** [fnc_takeOffGasMask.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_takeOffGasMask.sqf)
- **Description:** No description available.

#### `kat_chemical_fnc_throwGrenade`
- **Author:** DiGii
- **File Path:** [fnc_throwGrenade.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_throwGrenade.sqf)
- **Description:** 

#### `kat_chemical_fnc_treatmentAdvanced_AtnaaLocal`
- **Author:** DiGii
- **File Path:** [fnc_treatmentAdvanced_AtnaaLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_treatmentAdvanced_AtnaaLocal.sqf)
- **Description:** Chemical-side ATNAA local handler. Clears nerve-agent exposure so the

#### `kat_chemical_fnc_treatmentAdvanced_AtropineLocal`
- **Author:** Mazinski.H
- **File Path:** [fnc_treatmentAdvanced_AtropineLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_treatmentAdvanced_AtropineLocal.sqf)
- **Description:** Locates and Removes Bradycardia Effect.

#### `kat_chemical_fnc_ui_gasModule`
- **Author:** DiGii, MiszczuZPolski
- **File Path:** [fnc_ui_gasModule.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_ui_gasModule.sqf)
- **Description:** Creates the UI for the Zeus Module

#### `kat_chemical_fnc_useM8Paper`
- **Author:** DiGii
- **File Path:** [fnc_useM8Paper.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\chemical\functions\fnc_useM8Paper.sqf)
- **Description:** Self-action implementation for the M8/M9 detection paper. Wipes the paper

---

## Addon: `circulation`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Circulation, Access & Cardiac Care (IV, AED, & Resuscitation)
**Overview:** Implements cardiovascular diagnostic equipment, IV/IO access, fluid infusions, defibrillation, CPR, and REBOA aortic balloon occlusion.

**State Variables:**
- `kat_circulation_bloodGas` (array) - Stores blood gas panel variables: `[PaCO2, PaO2, SpO2, HCO3, pH, EtCO2]`.
- `kat_circulation_cardiacArrestType` (number) - Cardiac arrest rhythm: 0 = None, 1 = PEA, 2 = Asystole, 3 = VF, 4 = VT.
- `kat_circulation_reboaActive` (bool) - True if a REBOA balloon is inflated in Zone 1/3 of the aorta.
- `kat_circulation_ivAccess` (array) - Cannula status per limb (e.g., 14G, 16G, 18G, or IO).

**Key Mechanics:**
- **AED Defibrillation:** Analyzes ECG rhythm and delivers shocks to shockable rhythms (VF/VT) while guiding CPR for non-shockable rhythms (PEA/Asystole).
- **REBOA:** Inflating an aortic balloon halts blood flow below the diaphragm, preserving brain/coronary perfusion at the cost of lower limb ischemia.
- **Cannulation:** Establishes IV/IO paths; larger gauge catheters allow faster fluid infusion rates.
- **Pulse Oximeter:** Measures peripheral oxygen saturation and pulse rate.

### Functions List:

#### `kat_circulation_fnc_AEDXPlaced_VitalsMonitor_SetVolume`
- **Author:** Blue
- **File Path:** [fnc_AEDXPlaced_VitalsMonitor_SetVolume.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AEDXPlaced_VitalsMonitor_SetVolume.sqf)
- **Description:** Handle setting vitals monitor volume for placed AED-X.

#### `kat_circulation_fnc_AEDX_ConnectVitalsMonitor`
- **Author:** Blue
- **File Path:** [fnc_AEDX_ConnectVitalsMonitor.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AEDX_ConnectVitalsMonitor.sqf)
- **Description:** Connect vitals monitoring to patient.

#### `kat_circulation_fnc_AEDX_DisconnectVitalsMonitor`
- **Author:** Blue
- **File Path:** [fnc_AEDX_DisconnectVitalsMonitor.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AEDX_DisconnectVitalsMonitor.sqf)
- **Description:** Disconnect vitals monitoring from patient.

#### `kat_circulation_fnc_AEDX_ViewMonitor`
- **Author:** Blue
- **File Path:** [fnc_AEDX_ViewMonitor.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AEDX_ViewMonitor.sqf)
- **Description:** Open AED-X Vitals Monitor dialog

#### `kat_circulation_fnc_AEDX_ViewMonitor_AnalyzeFeedback`
- **Author:** Blue
- **File Path:** [fnc_AEDX_ViewMonitor_AnalyzeFeedback.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AEDX_ViewMonitor_AnalyzeFeedback.sqf)
- **Description:** Handle displaying AED mode message on monitor screen

#### `kat_circulation_fnc_AEDX_ViewMonitor_CPR`
- **Author:** Blue
- **File Path:** [fnc_AEDX_ViewMonitor_CPR.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AEDX_ViewMonitor_CPR.sqf)
- **Description:** Open AED-X Vitals Monitor dialog

#### `kat_circulation_fnc_AEDX_ViewMonitor_Charging`
- **Author:** Blue
- **File Path:** [fnc_AEDX_ViewMonitor_Charging.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AEDX_ViewMonitor_Charging.sqf)
- **Description:** Handle monitor visuals while charging

#### `kat_circulation_fnc_AEDX_ViewMonitor_Condition`
- **Author:** Blue
- **File Path:** [fnc_AEDX_ViewMonitor_Condition.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AEDX_ViewMonitor_Condition.sqf)
- **Description:** Checks if monitor can be viewed on patient.

#### `kat_circulation_fnc_AEDX_VitalsMonitor`
- **Author:** Katalam
- **File Path:** [fnc_AEDX_VitalsMonitor.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AEDX_VitalsMonitor.sqf)
- **Description:** Modified: YetheSamartaka, Blue, apo_tle

#### `kat_circulation_fnc_AEDX_VitalsMonitor_CheckCondition`
- **Author:** Blue
- **File Path:** [fnc_AEDX_VitalsMonitor_CheckCondition.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AEDX_VitalsMonitor_CheckCondition.sqf)
- **Description:** Checks if AED-X vitals monitor can be connected to the patient.

#### `kat_circulation_fnc_AED_Analyze`
- **Author:** Blue
- **File Path:** [fnc_AED_Analyze.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AED_Analyze.sqf)
- **Description:** Analyzes the patient's heart rhythm

#### `kat_circulation_fnc_AED_Charge`
- **Author:** Blue
- **File Path:** [fnc_AED_Charge.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AED_Charge.sqf)
- **Description:** Charge up Defibrillator in AED mode

#### `kat_circulation_fnc_AED_Shock`
- **Author:** Blue
- **File Path:** [fnc_AED_Shock.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_AED_Shock.sqf)
- **Description:** Handles finishing AED shock procedure.

#### `kat_circulation_fnc_CPRStart`
- **Author:** Blue
- **File Path:** [fnc_CPRStart.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_CPRStart.sqf)
- **Description:** Begin CPR

#### `kat_circulation_fnc_DefibrillatorPlaced_CheckCondition`
- **Author:** Blue
- **File Path:** [fnc_DefibrillatorPlaced_CheckCondition.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_DefibrillatorPlaced_CheckCondition.sqf)
- **Description:** Checks if placed AED can be used (ace actions).

#### `kat_circulation_fnc_Defibrillator_AttachPads`
- **Author:** Blue
- **File Path:** [fnc_Defibrillator_AttachPads.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_Defibrillator_AttachPads.sqf)
- **Description:** Attach Defibrillator pads to patient.

#### `kat_circulation_fnc_Defibrillator_CheckCondition`
- **Author:** Blue
- **File Path:** [fnc_Defibrillator_CheckCondition.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_Defibrillator_CheckCondition.sqf)
- **Description:** Check if defibrillator can be used on patient.

#### `kat_circulation_fnc_Defibrillator_ManualCharge`
- **Author:** Blue
- **File Path:** [fnc_Defibrillator_ManualCharge.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_Defibrillator_ManualCharge.sqf)
- **Description:** Charge up Defibrillator in manual mode

#### `kat_circulation_fnc_Defibrillator_Pads_CheckCondition`
- **Author:** Blue
- **File Path:** [fnc_Defibrillator_Pads_CheckCondition.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_Defibrillator_Pads_CheckCondition.sqf)
- **Description:** Checks if AED pads can be attached to the patient.

#### `kat_circulation_fnc_Defibrillator_RemovePads`
- **Author:** Blue
- **File Path:** [fnc_Defibrillator_RemovePads.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_Defibrillator_RemovePads.sqf)
- **Description:** Remove Defibrillator pads from patient.

#### `kat_circulation_fnc_PulseOx_ViewMonitor`
- **Author:** Mazinski
- **File Path:** [fnc_PulseOx_ViewMonitor.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_PulseOx_ViewMonitor.sqf)
- **Description:** Open PulseOx View Monitor

#### `kat_circulation_fnc_addArterialApplyActions`
- **Author:** SzwedzikPL, mharis001
- **File Path:** [fnc_addArterialApplyActions.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_addArterialApplyActions.sqf)
- **Description:** Modified: Mazinski

#### `kat_circulation_fnc_addArterialTestActions`
- **Author:** SzwedzikPL, mharis001
- **File Path:** [fnc_addArterialTestActions.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_addArterialTestActions.sqf)
- **Description:** Modified: Mazinski

#### `kat_circulation_fnc_addDefibrillatorActions`
- **Author:** Blue
- **File Path:** [fnc_addDefibrillatorActions.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_addDefibrillatorActions.sqf)
- **Description:** Gets ACE actions for units next to placed defibrillator

#### `kat_circulation_fnc_attachBloodGas`
- **Author:** Mazinski
- **File Path:** [fnc_attachBloodGas.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_attachBloodGas.sqf)
- **Description:** Attaches ABG test to patient

#### `kat_circulation_fnc_bloodType`
- **Author:** Katalam
- **File Path:** [fnc_bloodType.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_bloodType.sqf)
- **Description:** Modified: YetheSamartaka, Blue

#### `kat_circulation_fnc_bloodTypeLog`
- **Author:** Miss Heda
- **File Path:** [fnc_bloodTypeLog.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_bloodTypeLog.sqf)
- **Description:** Adds blood type to quick_view log

#### `kat_circulation_fnc_canDraw`
- **Author:** Battlekeeper, modified by YetheSamartaka & Slatery
- **File Path:** [fnc_canDraw.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_canDraw.sqf)
- **Description:** Condition function for the blood drawing

#### `kat_circulation_fnc_checkBloodPressure`
- **Author:** Glowbal
- **File Path:** [fnc_checkBloodPressure.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_checkBloodPressure.sqf)
- **Description:** Checks the blood pressure of the patient.

#### `kat_circulation_fnc_checkBloodPressureCuff`
- **Author:** Glowbal modified by Cplhardcore
- **File Path:** [fnc_checkBloodPressureCuff.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_checkBloodPressureCuff.sqf)
- **Description:** Checks the blood pressure of the patient.

#### `kat_circulation_fnc_checkBloodPressureCuffLocal`
- **Author:** Glowbal modified by Cplhardcore
- **File Path:** [fnc_checkBloodPressureCuffLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_checkBloodPressureCuffLocal.sqf)
- **Description:** Local callback for checking the blood pressure of a patient.

#### `kat_circulation_fnc_checkBloodPressureLocal`
- **Author:** Glowbal modified by Cplhardcore
- **File Path:** [fnc_checkBloodPressureLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_checkBloodPressureLocal.sqf)
- **Description:** Local callback for checking the blood pressure of a patient.

#### `kat_circulation_fnc_checkPulse`
- **Author:** Glowbal modified by Cplhardcore
- **File Path:** [fnc_checkPulse.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_checkPulse.sqf)
- **Description:** Checks the pulse or heart rate of the patient.

#### `kat_circulation_fnc_checkPulseLocal`
- **Author:** Glowbal
- **File Path:** [fnc_checkPulseLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_checkPulseLocal.sqf)
- **Description:** Local callback for checking the pulse or heart rate of a patient.

#### `kat_circulation_fnc_checkPulseSteth`
- **Author:** Glowbal modified by Cplhardcore
- **File Path:** [fnc_checkPulseSteth.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_checkPulseSteth.sqf)
- **Description:** Checks the pulse or heart rate of the patient.

#### `kat_circulation_fnc_checkPulseStethLocal`
- **Author:** Glowbal
- **File Path:** [fnc_checkPulseStethLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_checkPulseStethLocal.sqf)
- **Description:** Local callback for checking the pulse or heart rate of a patient.

#### `kat_circulation_fnc_compatible`
- **Author:** Katalam
- **File Path:** [fnc_compatible.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_compatible.sqf)
- **Description:** Handle the compatibility for blood and patient.

#### `kat_circulation_fnc_cprLocal`
- **Author:** Glowbal
- **File Path:** [fnc_cprLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_cprLocal.sqf)
- **Description:** Modified: Tomcat, Blue

#### `kat_circulation_fnc_cprSuccess`
- **Author:** Glowbal
- **File Path:** [fnc_cprSuccess.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_cprSuccess.sqf)
- **Description:** Modified: Blue

#### `kat_circulation_fnc_drawArterial`
- **Author:** Battlekeeper, modified by YetheSamartaka, Mazinski
- **File Path:** [fnc_drawArterial.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_drawArterial.sqf)
- **Description:** Refactored by Slatery

#### `kat_circulation_fnc_drawBlood`
- **Author:** Battlekeeper, modified by YetheSamartaka
- **File Path:** [fnc_drawBlood.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_drawBlood.sqf)
- **Description:** Refactored by Slatery

#### `kat_circulation_fnc_fullHealLocal`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_fullHealLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_fullHealLocal.sqf)
- **Description:** Local callback for fully healing a patient.

#### `kat_circulation_fnc_generateBloodType`
- **Author:** Blue
- **File Path:** [fnc_generateBloodType.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_generateBloodType.sqf)
- **Description:** Generates blood type for player according to settings

#### `kat_circulation_fnc_getBloodPressure`
- **Author:** Glowbal
- **File Path:** [fnc_getBloodPressure.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_getBloodPressure.sqf)
- **Description:** Modified: Blue

#### `kat_circulation_fnc_getCardiacArrestHeartRate`
- **Author:** Blue
- **File Path:** [fnc_getCardiacArrestHeartRate.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_getCardiacArrestHeartRate.sqf)
- **Description:** Generate heart rate for type of cardiac arrest

#### `kat_circulation_fnc_gui_updateBodyImage`
- **Author:** Blue
- **File Path:** [fnc_gui_updateBodyImage.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_gui_updateBodyImage.sqf)
- **Description:** Updates the body image for given target.

#### `kat_circulation_fnc_handleCardiacArrest`
- **Author:** Blue
- **File Path:** [fnc_handleCardiacArrest.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_handleCardiacArrest.sqf)
- **Description:** Assign cardiac arrest type for unit entering cardiac arrest

#### `kat_circulation_fnc_handleRespawn`
- **Author:** YetheSamartaka
- **File Path:** [fnc_handleRespawn.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_handleRespawn.sqf)
- **Description:** Ensures proper initial values reset on respawn

#### `kat_circulation_fnc_handleTreatment`
- **Author:** Katalam
- **File Path:** [fnc_handleTreatment.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_handleTreatment.sqf)
- **Description:** Handle the treatment for the patient cause calling two functions in one action isn't allowed.

#### `kat_circulation_fnc_init`
- **Author:** Katalam
- **File Path:** [fnc_init.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_init.sqf)
- **Description:** Initializes unit variables.

#### `kat_circulation_fnc_measureBloodPressure`
- **Author:** Blue
- **File Path:** [fnc_measureBloodPressure.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_measureBloodPressure.sqf)
- **Description:** Measure and store blood pressure for unit

#### `kat_circulation_fnc_onCloseDialog`
- **Author:** Katalam
- **File Path:** [fnc_onCloseDialog.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_onCloseDialog.sqf)
- **Description:** Close the cross panel dialog.

#### `kat_circulation_fnc_placeAED`
- **Author:** Tomcat, Blue
- **File Path:** [fnc_placeAED.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_placeAED.sqf)
- **Description:** Place the AED/X in front of unit

#### `kat_circulation_fnc_placeAED_PickUpAction`
- **Author:** Blue
- **File Path:** [fnc_placeAED_PickUpAction.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_placeAED_PickUpAction.sqf)
- **Description:** Add pick up action to AED

#### `kat_circulation_fnc_removeLog`
- **Author:** Katalam
- **File Path:** [fnc_removeLog.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_removeLog.sqf)
- **Description:** Remove a given log from the ace medical menu.

#### `kat_circulation_fnc_showBloodGas`
- **Author:** Mazinski
- **File Path:** [fnc_showBloodGas.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_showBloodGas.sqf)
- **Description:** Checks patient temperature

#### `kat_circulation_fnc_treatmentAdvanced_IV`
- **Author:** Katalam
- **File Path:** [fnc_treatmentAdvanced_IV.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_treatmentAdvanced_IV.sqf)
- **Description:** Handle the IV for the patient with blood types. Have to be local to avoid effect on all clients.

#### `kat_circulation_fnc_updateBloodPressureChange`
- **Author:** Blue
- **File Path:** [fnc_updateBloodPressureChange.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_updateBloodPressureChange.sqf)
- **Description:** Updates blood pressure change.

#### `kat_circulation_fnc_updateHeartRate`
- **Author:** Glowbal
- **File Path:** [fnc_updateHeartRate.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_updateHeartRate.sqf)
- **Description:** Update the heart rate

#### `kat_circulation_fnc_updateInternalBleeding`
- **Author:** Blue
- **File Path:** [fnc_updateInternalBleeding.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_updateInternalBleeding.sqf)
- **Description:** Updates internal bleeding rate.

#### `kat_circulation_fnc_wrongBloodTreatment`
- **Author:** Tomcat
- **File Path:** [fnc_wrongBloodTreatment.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\circulation\functions\fnc_wrongBloodTreatment.sqf)
- **Description:** Treats wrong given Blood with Painkillers

---

## Addon: `compat_rhs_usf3`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### RHS USAF Compatibility
**Overview:** Registers RHS USAF inventory items, helmets, and oxygen masks as valid respiratory assets, and configures RHS vehicles/stretchers to integrate with KAM menus.

**Key Mechanics:**
- **Oxygen Compatibility:** Allows RHS fighter helmets to provide oxygen supply.

- *No SQF functions defined in this addon.*

---

## Addon: `feedback`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Sensory Feedback Overlay
**Overview:** Translates critical medical conditions (extreme acidosis, hypoxemia, or shock) into visual and auditory cues for the player.

**Key Mechanics:**
- **Heartbeat sound:** Triggers audio beats scaled by heart rate severity.
- **Hypoxia Blurring:** Darkens and blurs the screen when SpO2 falls below critical thresholds.
- **Dyspnea:** Triggers audible gasping sounds during respiratory distress.

### Functions List:

#### `kat_feedback_fnc_effectBreathingWheeze`
- **Author:** Mazinski
- **File Path:** [fnc_effectBreathingWheeze.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\feedback\functions\fnc_effectBreathingWheeze.sqf)
- **Description:** Triggers the wheezing effect.

#### `kat_feedback_fnc_effectCoughing`
- **Author:** MiszczuZPolski & Digii
- **File Path:** [fnc_effectCoughing.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\feedback\functions\fnc_effectCoughing.sqf)
- **Description:** Triggers the coughing effect.

#### `kat_feedback_fnc_effectEyeBlink`
- **Author:** Mazinski
- **File Path:** [fnc_effectEyeBlink.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\feedback\functions\fnc_effectEyeBlink.sqf)
- **Description:** Handles shock from explosions and covers eye injury transitions

#### `kat_feedback_fnc_effectEyeInjury`
- **Author:** Mazinski
- **File Path:** [fnc_effectEyeInjury.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\feedback\functions\fnc_effectEyeInjury.sqf)
- **Description:** Triggers eye injury effect from dust and rotor wash.

#### `kat_feedback_fnc_effectHurtEye`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_effectHurtEye.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\feedback\functions\fnc_effectHurtEye.sqf)
- **Description:** Handles the hurted eyes effect from explosions.

#### `kat_feedback_fnc_effectLowSpO2`
- **Author:** Miss Heda, Digii
- **File Path:** [fnc_effectLowSpO2.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\feedback\functions\fnc_effectLowSpO2.sqf)
- **Description:** Modified by MiszczuZPolski

#### `kat_feedback_fnc_effectOpioid`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_effectOpioid.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\feedback\functions\fnc_effectOpioid.sqf)
- **Description:** Triggers the opiod effect.

#### `kat_feedback_fnc_effectTearHaze`
- **Author:** MiszczuZPolski & Digii
- **File Path:** [fnc_effectTearHaze.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\feedback\functions\fnc_effectTearHaze.sqf)
- **Description:** Triggers the coughing effect.

#### `kat_feedback_fnc_handleEffects`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_handleEffects.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\feedback\functions\fnc_handleEffects.sqf)
- **Description:** Handles any visual effects of medical.

#### `kat_feedback_fnc_initEffects`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_initEffects.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\feedback\functions\fnc_initEffects.sqf)
- **Description:** Initializes visual effects of medical.

---

## Addon: `gui`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Graphical User Interface (HUD & Overlays)
**Overview:** Manages custom user interfaces, monitor displays, interactive overlays, and custom medical menu panels.

**Key Mechanics:**
- **AED Screen:** Renders dynamic ECG tracings, heart rate numbers, and shock advisory prompts.
- **Watch HUD:** Renders watch dials and digital telemetry screen overlays.

### Functions List:

#### `kat_gui_fnc_dumpBloodGas`
- **Author:** Mazinksi
- **File Path:** [fnc_dumpBloodGas.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_dumpBloodGas.sqf)
- **Description:** Removes blood gas testing values

#### `kat_gui_fnc_handleABGShow`
- **Author:** Mazinksi
- **File Path:** [fnc_handleABGShow.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_handleABGShow.sqf)
- **Description:** Changes the visibility of the ABG Menu

#### `kat_gui_fnc_handleIVAdjust`
- **Author:** Mazinksi
- **File Path:** [fnc_handleIVAdjust.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_handleIVAdjust.sqf)
- **Description:** Adjusts IV flow rates from GUI

#### `kat_gui_fnc_handleIVShow`
- **Author:** Mazinksi
- **File Path:** [fnc_handleIVShow.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_handleIVShow.sqf)
- **Description:** Changes the visibility of the IV Menu

#### `kat_gui_fnc_logListAppended`
- **Author:** Blue, Brett Mayson
- **File Path:** [fnc_logListAppended.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_logListAppended.sqf)
- **Description:** Handles the coloring of rows added to the log list

#### `kat_gui_fnc_menuPFH`
- **Author:** mharis001
- **File Path:** [fnc_menuPFH.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_menuPFH.sqf)
- **Description:** Modified: Mazinski

#### `kat_gui_fnc_onMenuClose`
- **Author:** joko // Jonas
- **File Path:** [fnc_onMenuClose.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_onMenuClose.sqf)
- **Description:** Handles closing the Medical Menu. Called from onUnload event.

#### `kat_gui_fnc_onMenuOpen`
- **Author:** Glowbal, mharis001
- **File Path:** [fnc_onMenuOpen.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_onMenuOpen.sqf)
- **Description:** Handles opening the Medical Menu. Called from onLoad event.

#### `kat_gui_fnc_updateABGStatus`
- **Author:** Mazinksi
- **File Path:** [fnc_updateABGStatus.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_updateABGStatus.sqf)
- **Description:** Updates ABG status GUI

#### `kat_gui_fnc_updateBodyImage`
- **Author:** Glowbal, kymckay, mharis001
- **File Path:** [fnc_updateBodyImage.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_updateBodyImage.sqf)
- **Description:** Updates the body image for given target.

#### `kat_gui_fnc_updateCategories`
- **Author:** mharis001
- **File Path:** [fnc_updateCategories.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_updateCategories.sqf)
- **Description:** Updates the category buttons based currently avaiable treatments.

#### `kat_gui_fnc_updateIVStatus`
- **Author:** Glowbal, kymckay, mharis001
- **File Path:** [fnc_updateIVStatus.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_updateIVStatus.sqf)
- **Description:** Updates the body image for given target.

#### `kat_gui_fnc_updateInjuryList`
- **Author:** mharis001
- **File Path:** [fnc_updateInjuryList.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\gui\functions\fnc_updateInjuryList.sqf)
- **Description:** Updates injury list for given body part for the target.

---

## Addon: `hypothermia`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Hypothermia & Thermodynamics
**Overview:** Simulates core body temperature thermal loss based on Newton's Law of cooling, environment exposure, metabolic heat production, fluid warming, and hand warmers.

**State Variables:**
- `kat_hypothermia_unitTemperature` (number) - Body core temperature (default 37C).
- `kat_hypothermia_warmingImpact` (number) - Heat energy added by transfusing warmed fluids.
- `kat_hypothermia_handWarmers` (array) - Remaining active durations of applied hand warmers.

**Key Mechanics:**
- **Newton's Law of Cooling:** Environmental cooling rate scales inversely with remaining blood volume (lower thermal mass cools faster).
- **Metabolic Production:** Metabolic heat efficiency scales with remaining blood volume (perfusion) and consciousness status (drops 25% when comatose).
- **Warming Blankets & Hand Warmers:** Counteract environmental cooling.

### Functions List:

#### `kat_hypothermia_fnc_applyFluidWarmer`
- **Author:** Mazinski
- **File Path:** [fnc_applyFluidWarmer.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_applyFluidWarmer.sqf)
- **Description:** Begins Fluid Warmer Treatment

#### `kat_hypothermia_fnc_applyFluidWarmerLocal`
- **Author:** Mazinski
- **File Path:** [fnc_applyFluidWarmerLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_applyFluidWarmerLocal.sqf)
- **Description:** Local call for applying fluid warmers

#### `kat_hypothermia_fnc_checkHandWarmers`
- **Author:** Mazinski
- **File Path:** [fnc_checkHandWarmers.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_checkHandWarmers.sqf)
- **Description:** Checks handwarmer status

#### `kat_hypothermia_fnc_checkTemperature`
- **Author:** Mazinski
- **File Path:** [fnc_checkTemperature.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_checkTemperature.sqf)
- **Description:** Checks patient temperature

#### `kat_hypothermia_fnc_fullHealLocal`
- **Author:** Mazinski
- **File Path:** [fnc_fullHealLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_fullHealLocal.sqf)
- **Description:** Local callback for fully healing a patient.

#### `kat_hypothermia_fnc_handleRespawn`
- **Author:** Mazinski
- **File Path:** [fnc_handleRespawn.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_handleRespawn.sqf)
- **Description:** Handles the player respawn for Hypothermia.

#### `kat_hypothermia_fnc_init`
- **Author:** Mazinski
- **File Path:** [fnc_init.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_init.sqf)
- **Description:** Initializes unit variables.

#### `kat_hypothermia_fnc_removeFluidWarmer`
- **Author:** Mazinski.H
- **File Path:** [fnc_removeFluidWarmer.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_removeFluidWarmer.sqf)
- **Description:** Begins Remove Fluid Warmer treatment

#### `kat_hypothermia_fnc_removeFluidWarmerLocal`
- **Author:** Mazinski
- **File Path:** [fnc_removeFluidWarmerLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_removeFluidWarmerLocal.sqf)
- **Description:** Local call for removing a fluid warmer

#### `kat_hypothermia_fnc_removeWarmer`
- **Author:** Mazinski
- **File Path:** [fnc_removeWarmer.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_removeWarmer.sqf)
- **Description:** Check for fluid warmers present

#### `kat_hypothermia_fnc_useHandWarmer`
- **Author:** Mazinski
- **File Path:** [fnc_useHandWarmer.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_useHandWarmer.sqf)
- **Description:** Begins Hand Warmer treatment

#### `kat_hypothermia_fnc_useHandWarmerLocal`
- **Author:** Mazinski
- **File Path:** [fnc_useHandWarmerLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\hypothermia\functions\fnc_useHandWarmerLocal.sqf)
- **Description:** Local call for applying hand warmers

---

## Addon: `main`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Core Bootloader & Macros
**Overview:** Initializes the KAM framework, boots addon dependencies, registers common global event structures, and exposes macro definitions.

- *No SQF functions defined in this addon.*

---

## Addon: `misc`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Miscellaneous Utilities
**Overview:** Handles player respawn state sanitization, general action menus, stethoscope items, and recovery position triggers.

### Functions List:

#### `kat_misc_fnc_BubbleWrap`
- **Author:** Miss Heda
- **File Path:** [fnc_BubbleWrap.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_BubbleWrap.sqf)
- **Description:** Plays popping sound & removes mag

#### `kat_misc_fnc_FAK_ammoToArray`
- **Author:** Blue
- **File Path:** [fnc_FAK_ammoToArray.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_FAK_ammoToArray.sqf)
- **Description:** Convert ammo count to bool array

#### `kat_misc_fnc_FAK_arrayToAmmo`
- **Author:** Blue
- **File Path:** [fnc_FAK_arrayToAmmo.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_FAK_arrayToAmmo.sqf)
- **Description:** Convert bool array into ammo count

#### `kat_misc_fnc_FAK_checkRepack`
- **Author:** Miss Heda, Blue
- **File Path:** [fnc_FAK_checkRepack.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_FAK_checkRepack.sqf)
- **Description:** Checks if unit has required items to refill a FAK slot.

#### `kat_misc_fnc_FAK_checkSlot`
- **Author:** Miss Heda, Blue
- **File Path:** [fnc_FAK_checkSlot.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_FAK_checkSlot.sqf)
- **Description:** Checks which slots are free to use in an FAK

#### `kat_misc_fnc_FAK_displayContent`
- **Author:** Miss Heda
- **File Path:** [fnc_FAK_displayContent.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_FAK_displayContent.sqf)
- **Description:** Displays FAK items to player

#### `kat_misc_fnc_FAK_repack`
- **Author:** Miss Heda, Blue
- **File Path:** [fnc_FAK_repack.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_FAK_repack.sqf)
- **Description:** Repacks FAK Slot

#### `kat_misc_fnc_FAK_unpack`
- **Author:** Miss Heda, Blue
- **File Path:** [fnc_FAK_unpack.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_FAK_unpack.sqf)
- **Description:** Gives the player the predefined Items (in CBA) for every FAK variant

#### `kat_misc_fnc_FAK_updateContents`
- **Author:** Blue
- **File Path:** [fnc_FAK_updateContents.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_FAK_updateContents.sqf)
- **Description:** Update contents of FAKs

#### `kat_misc_fnc_addIVbag`
- **Author:** Katalam
- **File Path:** [fnc_addIVbag.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_addIVbag.sqf)
- **Description:** Adds a IV bag for the medicine IV stands.

#### `kat_misc_fnc_addVehicleCarryLoadActions`
- **Author:** Blue
- **File Path:** [fnc_addVehicleCarryLoadActions.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_addVehicleCarryLoadActions.sqf)
- **Description:** Add carry load ace actions to vehicle.

#### `kat_misc_fnc_addVehicleUnloadCarryPatientActions`
- **Author:** Blue
- **File Path:** [fnc_addVehicleUnloadCarryPatientActions.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_addVehicleUnloadCarryPatientActions.sqf)
- **Description:** Add carry and unload ace actions to vehicle.

#### `kat_misc_fnc_canCheckDogtag`
- **Author:** SzwedzikPL
- **File Path:** [fnc_canCheckDogtag.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_canCheckDogtag.sqf)
- **Description:** Checks if dogtag can be checked.

#### `kat_misc_fnc_canStitchFullBody`
- **Author:** Katalam, mharis001, Brett Mayson
- **File Path:** [fnc_canStitchFullBody.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_canStitchFullBody.sqf)
- **Description:** Checks if the patient can be stitched.

#### `kat_misc_fnc_carryObject`
- **Author:** commy2
- **File Path:** [fnc_carryObject.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_carryObject.sqf)
- **Description:** Modified: Blue

#### `kat_misc_fnc_checkArmbandCondition`
- **Author:** Miss Heda
- **File Path:** [fnc_checkArmbandCondition.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_checkArmbandCondition.sqf)
- **Description:** Checks if conditions are met for armband parent option to be displayed

#### `kat_misc_fnc_conditionExecutionDeath`
- **Author:** BaerMitUmlaut
- **File Path:** [fnc_conditionExecutionDeath.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_conditionExecutionDeath.sqf)
- **Description:** Modified: Blue

#### `kat_misc_fnc_conditionIV`
- **Author:** Katalam
- **File Path:** [fnc_conditionIV.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_conditionIV.sqf)
- **Description:** Condition check for the medicine IV stands to remove a bag.

#### `kat_misc_fnc_conditionIVstand`
- **Author:** Katalam
- **File Path:** [fnc_conditionIVstand.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_conditionIVstand.sqf)
- **Description:** Condition check for the medicine IV stands to add a bag.

#### `kat_misc_fnc_conditionSecondChance`
- **Author:** mharis001
- **File Path:** [fnc_conditionSecondChance.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_conditionSecondChance.sqf)
- **Description:** Modified: Blue

#### `kat_misc_fnc_getDogtagData`
- **Author:** esteldunedain
- **File Path:** [fnc_getDogtagData.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_getDogtagData.sqf)
- **Description:** Get unit dogtag data.

#### `kat_misc_fnc_getFullBodyStitchableWounds`
- **Author:** kymckay
- **File Path:** [fnc_getFullBodyStitchableWounds.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_getFullBodyStitchableWounds.sqf)
- **Description:** Returns a hashmap of the stitchable wounds that the given unit has on each body part.

#### `kat_misc_fnc_getMagazineAmmoCounts`
- **Author:** Miss Heda
- **File Path:** [fnc_getMagazineAmmoCounts.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_getMagazineAmmoCounts.sqf)
- **Description:** Returns ammo count of each provided magazine.

#### `kat_misc_fnc_getStitchTimeFullBody`
- **Author:** kymckay
- **File Path:** [fnc_getStitchTimeFullBody.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_getStitchTimeFullBody.sqf)
- **Description:** Calculates the Surgical Kit treatment time based on the amount of stitchable wounds on the Full Body.

#### `kat_misc_fnc_groupID`
- **Author:** Katalam
- **File Path:** [fnc_groupID.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_groupID.sqf)
- **Description:** Returns the groupname for a given unit.

#### `kat_misc_fnc_handleRespawn`
- **Author:** YetheSamartaka
- **File Path:** [fnc_handleRespawn.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_handleRespawn.sqf)
- **Description:** Ensures proper initial values reset on respawn

#### `kat_misc_fnc_handleTourniquetEffects`
- **Author:** Blue
- **File Path:** [fnc_handleTourniquetEffects.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_handleTourniquetEffects.sqf)
- **Description:** Handle effects for when tourniquet is applied for prolonged time

#### `kat_misc_fnc_handleUnconscious`
- **Author:** commy2
- **File Path:** [fnc_handleUnconscious.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_handleUnconscious.sqf)
- **Description:** Modified: Blue

#### `kat_misc_fnc_incompatibilityWarning`
- **Author:** YetheSamartaka
- **File Path:** [fnc_incompatibilityWarning.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_incompatibilityWarning.sqf)
- **Description:** Throws a warning and add line to RPT log if incompatible addons(Listed by us - developers) that

#### `kat_misc_fnc_init`
- **Author:** Katalam
- **File Path:** [fnc_init.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_init.sqf)
- **Description:** Initializes unit variables.

#### `kat_misc_fnc_removeIVbag`
- **Author:** Katalam
- **File Path:** [fnc_removeIVbag.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_removeIVbag.sqf)
- **Description:** Removes a IV bag for the medicine IV stands.

#### `kat_misc_fnc_removeTourniquetTime`
- **Author:** Mazinski
- **File Path:** [fnc_removeTourniquetTime.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_removeTourniquetTime.sqf)
- **Description:** Removes in game time when tourniquet was applied

#### `kat_misc_fnc_setTourniquetTime`
- **Author:** Mazinski
- **File Path:** [fnc_setTourniquetTime.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_setTourniquetTime.sqf)
- **Description:** Records in game time when tourniquet was applied

#### `kat_misc_fnc_setUnconscious`
- **Author:** Glowbal
- **File Path:** [fnc_setUnconscious.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_setUnconscious.sqf)
- **Description:** Sets a unit in the unconscious state.

#### `kat_misc_fnc_slingArmband`
- **Author:** Miss Heda
- **File Path:** [fnc_slingArmband.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_slingArmband.sqf)
- **Description:** Attaches a armband to the according limb.

#### `kat_misc_fnc_stopCarryingPrompt`
- **Author:** Blue
- **File Path:** [fnc_stopCarryingPrompt.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_stopCarryingPrompt.sqf)
- **Description:** Give interactions to stop being carried

#### `kat_misc_fnc_stringToArray`
- **Author:** Digii
- **File Path:** [fnc_stringToArray.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_stringToArray.sqf)
- **Description:** Splits an string into an array. (that can be used by CBA settings)

#### `kat_misc_fnc_surgicalKitProgressFullBody`
- **Author:** BaerMitUmlaut, mharis001
- **File Path:** [fnc_surgicalKitProgressFullBody.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_surgicalKitProgressFullBody.sqf)
- **Description:** Handles the surgical kit treatment by periodically closing bandaged wounds.

#### `kat_misc_fnc_switchMagItems`
- **Author:** Miss Heda
- **File Path:** [fnc_switchMagItems.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_switchMagItems.sqf)
- **Description:** Deletes magazine with specific ammo count & creates a new one with provided ammo count.

#### `kat_misc_fnc_treatment`
- **Author:** Glowbal, KoffeinFlummi, mharis001
- **File Path:** [fnc_treatment.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_treatment.sqf)
- **Description:** Modified: Blue

#### `kat_misc_fnc_treatmentIV`
- **Author:** Katalam
- **File Path:** [fnc_treatmentIV.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_treatmentIV.sqf)
- **Description:** Treatment handle function to remove a bag.

#### `kat_misc_fnc_treatmentSuccess`
- **Author:** KoffeinFlummi, Glowbal, mharis001
- **File Path:** [fnc_treatmentSuccess.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_treatmentSuccess.sqf)
- **Description:** Modified: Blue

#### `kat_misc_fnc_unSlingArmband`
- **Author:** Miss Heda
- **File Path:** [fnc_unSlingArmband.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_unSlingArmband.sqf)
- **Description:** Detaches a armband from a previously attached limb.

#### `kat_misc_fnc_unloadAndCarryPatient`
- **Author:** Blue
- **File Path:** [fnc_unloadAndCarryPatient.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_unloadAndCarryPatient.sqf)
- **Description:** Unload patient from vehicle and carry (skip animation)

#### `kat_misc_fnc_updateDamageEffects`
- **Author:** commy2, PabstMirror
- **File Path:** [fnc_updateDamageEffects.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_updateDamageEffects.sqf)
- **Description:** Modified: Blue

#### `kat_misc_fnc_useItem`
- **Author:** Glowbal, mharis001
- **File Path:** [fnc_useItem.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\misc\functions\fnc_useItem.sqf)
- **Description:** Modified: Blue

---

## Addon: `ophthalmology`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Ophthalmology & Ocular Trauma
**Overview:** Simulates eye trauma (laser burns, shrapnel, chemical splashes) and diagnostic pupillary checks.

**State Variables:**
- `kat_ophthalmology_eyeState` (array) - Left/right eye status (pupil dilation, reaction time, chemical contamination).
- `kat_ophthalmology_patchApplied` (bool) - True if an eye patch is covering a damaged eye.

**Key Mechanics:**
- **Pupillary Light Reflex:** Checking with a penlight reveals normal, fixed/dilated (brain injury), or pinpoint (opioid/chemical) pupils.
- **Eye Wash:** Irrigation washes out chemical toxins.
- **Eye Patch:** Prevents further damage from light/movement to wounded eyes.

### Functions List:

#### `kat_ophthalmology_fnc_eyeShieldCondition`
- **Author:** Mazinski
- **File Path:** [fnc_eyeShieldCondition.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\ophthalmology\functions\fnc_eyeShieldCondition.sqf)
- **Description:** Sets condition for the Eye Shield

#### `kat_ophthalmology_fnc_fullHealLocal`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_fullHealLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\ophthalmology\functions\fnc_fullHealLocal.sqf)
- **Description:** Local callback for fully healing a patient.

#### `kat_ophthalmology_fnc_gui_updateInjuryListPart`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_gui_updateInjuryListPart.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\ophthalmology\functions\fnc_gui_updateInjuryListPart.sqf)
- **Description:** Updates injury list for given body part for the target.

#### `kat_ophthalmology_fnc_handleDustInjury`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_handleDustInjury.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\ophthalmology\functions\fnc_handleDustInjury.sqf)
- **Description:** Handles the possibility to have dust in the eye.

#### `kat_ophthalmology_fnc_handleExplosion`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_handleExplosion.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\ophthalmology\functions\fnc_handleExplosion.sqf)
- **Description:** Handles explosions.

#### `kat_ophthalmology_fnc_handleRespawn`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_handleRespawn.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\ophthalmology\functions\fnc_handleRespawn.sqf)
- **Description:** Ensures proper initial values reset on respawn

#### `kat_ophthalmology_fnc_init`
- **Author:** Katalam
- **File Path:** [fnc_init.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\ophthalmology\functions\fnc_init.sqf)
- **Description:** Initialize unit

#### `kat_ophthalmology_fnc_treatmentAdvanced_eyeShield`
- **Author:** Mazinski
- **File Path:** [fnc_treatmentAdvanced_eyeShield.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\ophthalmology\functions\fnc_treatmentAdvanced_eyeShield.sqf)
- **Description:** Handles the placement of the eye shield

#### `kat_ophthalmology_fnc_treatmentAdvanced_eyewash`
- **Author:** Mazinski
- **File Path:** [fnc_treatmentAdvanced_eyewash.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\ophthalmology\functions\fnc_treatmentAdvanced_eyewash.sqf)
- **Description:** Handles the treatment of dust or heavy dust in eyes.

---

## Addon: `pharma`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Advanced Pharmacology & Kidney GFR
**Overview:** Simulates medication infusions, drug concentration curves, metabolic acidosis/pH shifts, and MAP-dependent renal clearance (GFR).

**State Variables:**
- `kat_pharma_externalPh` (number) - Acidosis pH buffer accumulator.
- `kat_pharma_urineVolume` (number) - Urine accumulation tracking in mL.
- `kat_pharma_kidneyFail` (bool) - True if kidneys have failed due to severe shock or acidosis.
- `kat_pharma_kidneyArrest` (bool) - True if renal failure has triggered metabolic cardiac arrest.

**Key Mechanics:**
- **Drug Concentration Curves:** Epinephrine, Adenosine, Atropine, Fentanyl, Ketamine, TXA, and Naloxone follow peak-concentration and clearance curves.
- **Renal Perfusion (GFR):** Kidney clearance GFR scales with Mean Arterial Pressure. Clearance drops to 0 when MAP falls below 65 mmHg.
- **Acidosis:** Failing kidneys cannot clear acid, driving pH down, shifting the oxygen affinity curve, and eventually triggering cardiac arrest.

### Functions List:

#### `kat_pharma_fnc_applyIV`
- **Author:** Mazinski.H
- **File Path:** [fnc_applyIV.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_applyIV.sqf)
- **Description:** Opens an IV/IO on a patient and changes the patient's flow variable

#### `kat_pharma_fnc_checkIV`
- **Author:** Mazinski.H
- **File Path:** [fnc_checkIV.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_checkIV.sqf)
- **Description:** Checks Limb Damage before and IV can be used.

#### `kat_pharma_fnc_clotWound`
- **Author:** Miss Heda
- **File Path:** [fnc_clotWound.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_clotWound.sqf)
- **Description:** Clots wounds

#### `kat_pharma_fnc_coagRegen`
- **Author:** Miss Heda
- **File Path:** [fnc_coagRegen.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_coagRegen.sqf)
- **Description:** Regenerates clots

#### `kat_pharma_fnc_fluid`
- **Author:** MiszczuZPolski, Mazinski.H
- **File Path:** [fnc_fluid.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_fluid.sqf)
- **Description:** Starts ph treatment

#### `kat_pharma_fnc_fluidLocal`
- **Author:** 2LT.Mazinski
- **File Path:** [fnc_fluidLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_fluidLocal.sqf)
- **Description:** Locally changes a patient's PH value

#### `kat_pharma_fnc_fullHealLocal`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_fullHealLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_fullHealLocal.sqf)
- **Description:** Local callback for fully healing a patient.

#### `kat_pharma_fnc_getBloodVolumeChange`
- **Author:** Glowbal
- **File Path:** [fnc_getBloodVolumeChange.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_getBloodVolumeChange.sqf)
- **Description:** Calculates the blood volume change and decreases the IVs given to the unit.

#### `kat_pharma_fnc_gui_updateBodyImage`
- **Author:** Blue
- **File Path:** [fnc_gui_updateBodyImage.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_gui_updateBodyImage.sqf)
- **Description:** Updates the body image for given target.

#### `kat_pharma_fnc_gui_updateInjuryListPart`
- **Author:** mazinskihenry
- **File Path:** [fnc_gui_updateInjuryListPart.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_gui_updateInjuryListPart.sqf)
- **Description:** Updates injury list for given body part for the target.

#### `kat_pharma_fnc_handleRespawn`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_handleRespawn.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_handleRespawn.sqf)
- **Description:** Ensures proper initial values reset on respawn

#### `kat_pharma_fnc_init`
- **Author:** Katalam, Miss Heda
- **File Path:** [fnc_init.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_init.sqf)
- **Description:** Initializes unit variables.

#### `kat_pharma_fnc_inspectCatheter`
- **Author:** 2LT.Mazinski
- **File Path:** [fnc_inspectCatheter.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_inspectCatheter.sqf)
- **Description:** Function for inspecting catheter

#### `kat_pharma_fnc_medication`
- **Author:** Glowbal, mharis001
- **File Path:** [fnc_medication.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_medication.sqf)
- **Description:** Edited by MiszczuZPolski

#### `kat_pharma_fnc_medicationLocal`
- **Author:** Glowbal, mharis001
- **File Path:** [fnc_medicationLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_medicationLocal.sqf)
- **Description:** Modified: MiszczuZPolski, Blue, Mazinski

#### `kat_pharma_fnc_pervitinPP`
- **Author:** Miss Heda
- **File Path:** [fnc_pervitinPP.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_pervitinPP.sqf)
- **Description:** Triggers the perivin visual effect.

#### `kat_pharma_fnc_removeIV`
- **Author:** Mazinski.H
- **File Path:** [fnc_removeIV.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_removeIV.sqf)
- **Description:** Removes the IV from the patient on the given body part.

#### `kat_pharma_fnc_retrieveIV`
- **Author:** 2LT.Mazinski
- **File Path:** [fnc_retrieveIV.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_retrieveIV.sqf)
- **Description:** Retrieves the IV/IO from a patient and returns additional fluids to the medic.

#### `kat_pharma_fnc_salineCheck`
- **Author:** 2LT.Mazinski
- **File Path:** [fnc_salineCheck.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_salineCheck.sqf)
- **Description:** Checks Saline volume remaining

#### `kat_pharma_fnc_tourniquetRemove`
- **Author:** Glowbal, mharis001
- **File Path:** [fnc_tourniquetRemove.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_tourniquetRemove.sqf)
- **Description:** Removes the tourniquet from the patient on the given body part.

#### `kat_pharma_fnc_treatmentAdvanced_AmiodaroneLocal`
- **Author:** Mazinski.H, Edited by MiszczuZPolski
- **File Path:** [fnc_treatmentAdvanced_AmiodaroneLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_AmiodaroneLocal.sqf)
- **Description:** Applies Bradycardia randomly

#### `kat_pharma_fnc_treatmentAdvanced_AtropineLocal`
- **Author:** Mazinski.H
- **File Path:** [fnc_treatmentAdvanced_AtropineLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_AtropineLocal.sqf)
- **Description:** Locates and Removes Bradycardia Effect.

#### `kat_pharma_fnc_treatmentAdvanced_CWMP`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_treatmentAdvanced_CWMP.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_CWMP.sqf)
- **Description:** Begins CWMP Treatment

#### `kat_pharma_fnc_treatmentAdvanced_Caffeine`
- **Author:** Miss Heda
- **File Path:** [fnc_treatmentAdvanced_Caffeine.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_Caffeine.sqf)
- **Description:** Begins Caffeine Treatment

#### `kat_pharma_fnc_treatmentAdvanced_CaffeineLocal`
- **Author:** Miss Heda
- **File Path:** [fnc_treatmentAdvanced_CaffeineLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_CaffeineLocal.sqf)
- **Description:** 

#### `kat_pharma_fnc_treatmentAdvanced_Carbonate`
- **Author:** Mazinski.H
- **File Path:** [fnc_treatmentAdvanced_Carbonate.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_Carbonate.sqf)
- **Description:** Begins Carbonate Treatment

#### `kat_pharma_fnc_treatmentAdvanced_CarbonateLocal`
- **Author:** Mazinski.H, Blue
- **File Path:** [fnc_treatmentAdvanced_CarbonateLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_CarbonateLocal.sqf)
- **Description:** Checks for Carbonate Wakeup values to restore consciousness

#### `kat_pharma_fnc_treatmentAdvanced_CheckCoag`
- **Author:** Miss Heda
- **File Path:** [fnc_treatmentAdvanced_CheckCoag.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_CheckCoag.sqf)
- **Description:** Checks the Coag Factors and displays it to the player

#### `kat_pharma_fnc_treatmentAdvanced_Dialysis`
- **Author:** Mazinski
- **File Path:** [fnc_treatmentAdvanced_Dialysis.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_Dialysis.sqf)
- **Description:** Treatment call for dialysis procedure

#### `kat_pharma_fnc_treatmentAdvanced_DialysisLocal`
- **Author:** 1LT.Mazinski.H
- **File Path:** [fnc_treatmentAdvanced_DialysisLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_DialysisLocal.sqf)
- **Description:** Local treatment call for dialysis procedure

#### `kat_pharma_fnc_treatmentAdvanced_EACALocal`
- **Author:** 2LT.Mazinski
- **File Path:** [fnc_treatmentAdvanced_EACALocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_EACALocal.sqf)
- **Description:** Local function for EACA treatment

#### `kat_pharma_fnc_treatmentAdvanced_FentanylLocal`
- **Author:** Miss Heda
- **File Path:** [fnc_treatmentAdvanced_FentanylLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_FentanylLocal.sqf)
- **Description:** Modified: Mazinski

#### `kat_pharma_fnc_treatmentAdvanced_FlumazenilLocal`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_treatmentAdvanced_FlumazenilLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_FlumazenilLocal.sqf)
- **Description:** Begins Flumazenil unsedating process

#### `kat_pharma_fnc_treatmentAdvanced_Flush`
- **Author:** 2LT.Mazinski
- **File Path:** [fnc_treatmentAdvanced_Flush.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_Flush.sqf)
- **Description:** Flushing IV access with saline

#### `kat_pharma_fnc_treatmentAdvanced_FlushLocal`
- **Author:** 2LT.Mazinski
- **File Path:** [fnc_treatmentAdvanced_FlushLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_FlushLocal.sqf)
- **Description:** Flushing IV access with saline

#### `kat_pharma_fnc_treatmentAdvanced_LorazepamLocal`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_treatmentAdvanced_LorazepamLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_LorazepamLocal.sqf)
- **Description:** Begins Lorazepam sedating process

#### `kat_pharma_fnc_treatmentAdvanced_MorphineLocal`
- **Author:** Mazinski
- **File Path:** [fnc_treatmentAdvanced_MorphineLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_MorphineLocal.sqf)
- **Description:** Applies the opioid factor from Morphine

#### `kat_pharma_fnc_treatmentAdvanced_NalbuphineLocal`
- **Author:** Mazinski
- **File Path:** [fnc_treatmentAdvanced_NalbuphineLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_NalbuphineLocal.sqf)
- **Description:** Applies the opioid factor from Nalbuphine

#### `kat_pharma_fnc_treatmentAdvanced_Naloxone`
- **Author:** Mazinski.H
- **File Path:** [fnc_treatmentAdvanced_Naloxone.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_Naloxone.sqf)
- **Description:** Begins Naloxone Treatment

#### `kat_pharma_fnc_treatmentAdvanced_NaloxoneLocal`
- **Author:** Mazinski.H
- **File Path:** [fnc_treatmentAdvanced_NaloxoneLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_NaloxoneLocal.sqf)
- **Description:** Locates and Removes one opioid after the administration of Naloxone.

#### `kat_pharma_fnc_treatmentAdvanced_Penthrox`
- **Author:** Blue
- **File Path:** [fnc_treatmentAdvanced_Penthrox.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_Penthrox.sqf)
- **Description:** Begins Penthrox Inhaler use

#### `kat_pharma_fnc_treatmentAdvanced_Pervitin`
- **Author:** Miss Heda
- **File Path:** [fnc_treatmentAdvanced_Pervitin.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_Pervitin.sqf)
- **Description:** Begins Pervitin Treatment

#### `kat_pharma_fnc_treatmentAdvanced_PervitinLocal`
- **Author:** Miss Heda,
- **File Path:** [fnc_treatmentAdvanced_PervitinLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_PervitinLocal.sqf)
- **Description:** Contributers: YonV, MiszczuZPolski

#### `kat_pharma_fnc_treatmentAdvanced_Reorientation`
- **Author:** Mazinski.H
- **File Path:** [fnc_treatmentAdvanced_Reorientation.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_Reorientation.sqf)
- **Description:** Begins Reorientation Treatment

#### `kat_pharma_fnc_treatmentAdvanced_ReorientationLocal`
- **Author:** Mazinski.H, Blue
- **File Path:** [fnc_treatmentAdvanced_ReorientationLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_ReorientationLocal.sqf)
- **Description:** Checks for Reorientation Wakeup values to restore consciousness

#### `kat_pharma_fnc_treatmentAdvanced_TXALocal`
- **Author:** Mazinski
- **File Path:** [fnc_treatmentAdvanced_TXALocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_treatmentAdvanced_TXALocal.sqf)
- **Description:** Begins TXA bandaging process

#### `kat_pharma_fnc_vehicleCheckDialysis`
- **Author:** Mazinski
- **File Path:** [fnc_vehicleCheckDialysis.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\pharma\functions\fnc_vehicleCheckDialysis.sqf)
- **Description:** Allows for dialysis to occur around medical vehicles

---

## Addon: `stretcher`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Stretchers & Evacuation
**Overview:** Implements foldable stretchers, mounting casualties onto vehicles/aircraft, carrying stretchers, and heliborne stretcher winching.

### Functions List:

#### `kat_stretcher_fnc_assemble_canDeployStretcher`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_assemble_canDeployStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_assemble_canDeployStretcher.sqf)
- **Description:** Checks if the player can deploy the stretcher.

#### `kat_stretcher_fnc_assemble_deployStretcher`
- **Author:** tcvm
- **File Path:** [fnc_assemble_deployStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_assemble_deployStretcher.sqf)
- **Description:** Deploys the stretcher

#### `kat_stretcher_fnc_attachHeliStretcher`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_attachHeliStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_attachHeliStretcher.sqf)
- **Description:** Attaches helistretcher to helicopter

#### `kat_stretcher_fnc_attachStretcher`
- **Author:** Katalam
- **File Path:** [fnc_attachStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_attachStretcher.sqf)
- **Description:** Children action for attaching stretcher

#### `kat_stretcher_fnc_canAdjustRopes`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_canAdjustRopes.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_canAdjustRopes.sqf)
- **Description:** Checks if ropes can be adjusted

#### `kat_stretcher_fnc_canAttachHeliStretcher`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_canAttachHeliStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_canAttachHeliStretcher.sqf)
- **Description:** Checks if player can attach helistretcher to helicopter

#### `kat_stretcher_fnc_canDeployHeliStretcher`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_canDeployHeliStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_canDeployHeliStretcher.sqf)
- **Description:** Checks if attached helistretcher can be deployed

#### `kat_stretcher_fnc_canDetachHeliStretcher`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_canDetachHeliStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_canDetachHeliStretcher.sqf)
- **Description:** Checks if player can detach helistretcher to helicopter

#### `kat_stretcher_fnc_canPackIntoBackpack`
- **Author:** MiszczuPolski
- **File Path:** [fnc_canPackIntoBackpack.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_canPackIntoBackpack.sqf)
- **Description:** Checks if stretcher can be packed into backpack

#### `kat_stretcher_fnc_canPackIntoBag`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_canPackIntoBag.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_canPackIntoBag.sqf)
- **Description:** Checks if stretcher can be packed into bag

#### `kat_stretcher_fnc_deployHeliStretcher`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_deployHeliStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_deployHeliStretcher.sqf)
- **Description:** Deploys helistretcher attached below helicopter

#### `kat_stretcher_fnc_detachHeliStretcher`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_detachHeliStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_detachHeliStretcher.sqf)
- **Description:** Detaches helistretcher from helicopter

#### `kat_stretcher_fnc_lowerHeliStretcher`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_lowerHeliStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_lowerHeliStretcher.sqf)
- **Description:** Lowers helistretcher by 10m

#### `kat_stretcher_fnc_packIntoBackpack`
- **Author:** Katalam
- **File Path:** [fnc_packIntoBackpack.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_packIntoBackpack.sqf)
- **Description:** Children action for attaching stretcher

#### `kat_stretcher_fnc_packIntoBag`
- **Author:** tcvm
- **File Path:** [fnc_packIntoBag.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_packIntoBag.sqf)
- **Description:** Modified by MiszczuZPolski

#### `kat_stretcher_fnc_raiseHeliStretcher`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_raiseHeliStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_raiseHeliStretcher.sqf)
- **Description:** Raises helistretcher by 10m

#### `kat_stretcher_fnc_retractHeliStretcher`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_retractHeliStretcher.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\stretcher\functions\fnc_retractHeliStretcher.sqf)
- **Description:** Retracts helistretcher back to heli, and moves crew back to heli

---

## Addon: `surgery`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Invasive Trauma Surgery
**Overview:** Models surgical draping, bone reduction (fixing fractures), suturing, wound packing, and surgical tools.

**Key Mechanics:**
- **Fracture Reduction:** Open or closed surgical reduction is required to fix compound bone fractures.
- **Wound Packing & Suturing:** Closes deep arterial wounds that tourniquets cannot control.

### Functions List:

#### `kat_surgery_fnc_canNPWT`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_canNPWT.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_canNPWT.sqf)
- **Description:** Check if patient's body part can be treated by NPWT

#### `kat_surgery_fnc_closedReduction`
- **Author:** Mazinski
- **File Path:** [fnc_closedReduction.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_closedReduction.sqf)
- **Description:** Fully heals a fracture on the selected limb.

#### `kat_surgery_fnc_closedReductionLocal`
- **Author:** Mazinski
- **File Path:** [fnc_closedReductionLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_closedReductionLocal.sqf)
- **Description:** Local call for fully healing a fracture.

#### `kat_surgery_fnc_fractureCheck`
- **Author:** Mazinski
- **File Path:** [fnc_fractureCheck.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_fractureCheck.sqf)
- **Description:** Checks if the patient has a fracture

#### `kat_surgery_fnc_fractureSelect`
- **Author:** Mazinski
- **File Path:** [fnc_fractureSelect.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_fractureSelect.sqf)
- **Description:** Selects the patient's fracture state

#### `kat_surgery_fnc_fractureSelectLocal`
- **Author:** Mazinski
- **File Path:** [fnc_fractureSelectLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_fractureSelectLocal.sqf)
- **Description:** Local call to select the patient's fracture state

#### `kat_surgery_fnc_fullHealLocal`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_fullHealLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_fullHealLocal.sqf)
- **Description:** Local callback for fully healing a patient.

#### `kat_surgery_fnc_getNPWTTime`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_getNPWTTime.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_getNPWTTime.sqf)
- **Description:** Calculates the Debride treatment time based on the amount of debridable wounds.

#### `kat_surgery_fnc_gui_updateInjuryListPart`
- **Author:** AtrixZockt
- **File Path:** [fnc_gui_updateInjuryListPart.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_gui_updateInjuryListPart.sqf)
- **Description:** Updates injury list for given body part for the target.

#### `kat_surgery_fnc_handleRespawn`
- **Author:** YetheSamartaka, Brett Mayson
- **File Path:** [fnc_handleRespawn.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_handleRespawn.sqf)
- **Description:** Ensures proper initial values reset on respawn

#### `kat_surgery_fnc_hasAdditionalTourniquetAppliedTo`
- **Author:** Glowbal
- **File Path:** [fnc_hasAdditionalTourniquetAppliedTo.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_hasAdditionalTourniquetAppliedTo.sqf)
- **Description:** Modified: Mazinski

#### `kat_surgery_fnc_hasTourniquetAppliedToAdditional`
- **Author:** Glowbal
- **File Path:** [fnc_hasTourniquetAppliedToAdditional.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_hasTourniquetAppliedToAdditional.sqf)
- **Description:** Modified: Mazinski

#### `kat_surgery_fnc_incision`
- **Author:** Mazinski
- **File Path:** [fnc_incision.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_incision.sqf)
- **Description:** Starts the surgical process for a fracture

#### `kat_surgery_fnc_incisionLocal`
- **Author:** Mazinski
- **File Path:** [fnc_incisionLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_incisionLocal.sqf)
- **Description:** Local call to start the surgical process for a fracture

#### `kat_surgery_fnc_init`
- **Author:** 2LT.Mazinski
- **File Path:** [fnc_init.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_init.sqf)
- **Description:** Initializes unit variables.

#### `kat_surgery_fnc_npwtTreatmentProgress`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_npwtTreatmentProgress.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_npwtTreatmentProgress.sqf)
- **Description:** Local call for clearing all wounds on a patient

#### `kat_surgery_fnc_openReduction`
- **Author:** Mazinski
- **File Path:** [fnc_openReduction.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_openReduction.sqf)
- **Description:** Removes the fracture status from an open fracture

#### `kat_surgery_fnc_openReductionCheck`
- **Author:** Mazinski
- **File Path:** [fnc_openReductionCheck.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_openReductionCheck.sqf)
- **Description:** Local call to check if a patient has a complex fracture

#### `kat_surgery_fnc_openReductionLocal`
- **Author:** Mazinski
- **File Path:** [fnc_openReductionLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_openReductionLocal.sqf)
- **Description:** Local call to remove the fracture status from an open fracture

#### `kat_surgery_fnc_openReductionProgress`
- **Author:** Mazinski
- **File Path:** [fnc_openReductionProgress.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_openReductionProgress.sqf)
- **Description:** Progresses the treatment process for a complex fracture

#### `kat_surgery_fnc_openReductionProgressLocal`
- **Author:** Mazinski
- **File Path:** [fnc_openReductionProgressLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_openReductionProgressLocal.sqf)
- **Description:** Progresses the treatment process for a complex fracture

#### `kat_surgery_fnc_pericardialTap`
- **Author:** Mazinski
- **File Path:** [fnc_pericardialTap.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_pericardialTap.sqf)
- **Description:** Runs the Pericardial Tap.

#### `kat_surgery_fnc_pericardialTapLocal`
- **Author:** Mazinski
- **File Path:** [fnc_pericardialTapLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_pericardialTapLocal.sqf)
- **Description:** Local call for running the Pericardial Tap.

#### `kat_surgery_fnc_reboaApply`
- **Author:** Mazinski
- **File Path:** [fnc_reboaApply.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_reboaApply.sqf)
- **Description:** Applies the REBOA function.

#### `kat_surgery_fnc_reboaApplyLocal`
- **Author:** Mazinski
- **File Path:** [fnc_reboaApplyLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_reboaApplyLocal.sqf)
- **Description:** Local call for applying REBOA.

#### `kat_surgery_fnc_reboaDeepApply`
- **Author:** Mazinski
- **File Path:** [fnc_reboaDeepApply.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_reboaDeepApply.sqf)
- **Description:** Applies the Deep REBOA function.

#### `kat_surgery_fnc_reboaDeepApplyLocal`
- **Author:** Mazinski
- **File Path:** [fnc_reboaDeepApplyLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_reboaDeepApplyLocal.sqf)
- **Description:** Local call for applying Deep REBOA.

#### `kat_surgery_fnc_reboaRemove`
- **Author:** Mazinski
- **File Path:** [fnc_reboaRemove.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_reboaRemove.sqf)
- **Description:** Removes the REBOA from the patient.

#### `kat_surgery_fnc_reboaRemoveLocal`
- **Author:** Mazinski
- **File Path:** [fnc_reboaRemoveLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_reboaRemoveLocal.sqf)
- **Description:** Local call for removing REBOA.

#### `kat_surgery_fnc_reboaVolume`
- **Author:** Mazinski
- **File Path:** [fnc_reboaVolume.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_reboaVolume.sqf)
- **Description:** Checks blood volume protected by REBOA

#### `kat_surgery_fnc_ultraAssessment`
- **Author:** Mazinski
- **File Path:** [fnc_ultraAssessment.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_ultraAssessment.sqf)
- **Description:** Runs the Ultrasound Assessment.

#### `kat_surgery_fnc_ultraAssessmentLocal`
- **Author:** Mazinski
- **File Path:** [fnc_ultraAssessmentLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\surgery\functions\fnc_ultraAssessmentLocal.sqf)
- **Description:** Local call for running the Ultrasound Assessment.

---

## Addon: `vitals`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Core Physiological Engine
**Overview:** The main physiological simulation engine integrating cardiac output (Frank-Starling, baroreflex, hypoxia chemoreflex, autonomic lag), respiration gases (Bohr effect Kelman P50 shift, Hill SpO2 dissociation), Newton's temperature, renal filtration MAP, and unconscious casualty hypoventilation.

**State Variables:**
- `VAR_BLOOD_GAS` (array) - Core blood gas panel values.
- `VAR_VASOCONSTRICTION` (number) - Current blood vessel constriction multiplier.

**Key Mechanics:**
- **Frank-Starling Law:** Scales stroke volume directly with venous return (blood volume).
- **Baroreflex & Chemoreflex:** Heart rate compensates for low blood pressure and hypoxemia, capped at 160 bpm.
- **Bohr O2 Affinity:** kelman $P_{50}$ model shifts hemoglobin oxygen binding curves based on temperature, CO2, and pH.
- **Unconscious Degradation:** Comatose casualties experience 25% lower metabolism, hypoventilation (low tidal volume), and mechanical airway tongue collapse.

### Functions List:

#### `kat_vitals_fnc_addMedicationAdjustment`
- **Author:** BaerMitUmlaut, PabstMirror
- **File Path:** [fnc_addMedicationAdjustment.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_addMedicationAdjustment.sqf)
- **Description:** Adds a medication and it's effects

#### `kat_vitals_fnc_basicDiagnostic`
- **Author:** Mazinski
- **File Path:** [fnc_basicDiagnostic.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_basicDiagnostic.sqf)
- **Description:** Checks all basic patient vitals (HR/BP/RR)

#### `kat_vitals_fnc_basicDiagnosticLocal`
- **Author:** Mazinski
- **File Path:** [fnc_basicDiagnosticLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_basicDiagnosticLocal.sqf)
- **Description:** Local callback for checking all basic patient vitals (HR/BP/RR)

#### `kat_vitals_fnc_fullHealLocal`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_fullHealLocal.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_fullHealLocal.sqf)
- **Description:** Local callback for fully healing a patient.

#### `kat_vitals_fnc_handleCardiacFunction`
- **Author:** Glowbal, Mazinski
- **File Path:** [fnc_handleCardiacFunction.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_handleCardiacFunction.sqf)
- **Description:** Update heart rate

#### `kat_vitals_fnc_handleOxygenFunction`
- **Author:** Mazinski
- **File Path:** [fnc_handleOxygenFunction.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_handleOxygenFunction.sqf)
- **Description:** Updates the respiratory variables

#### `kat_vitals_fnc_handleRespawn`
- **Author:** MiszczuZPolski
- **File Path:** [fnc_handleRespawn.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_handleRespawn.sqf)
- **Description:** Local callback for fully healing a patient.

#### `kat_vitals_fnc_handleSimpleVitals`
- **Author:** Glowbal, Mazinski
- **File Path:** [fnc_handleSimpleVitals.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_handleSimpleVitals.sqf)
- **Description:** Updates the vitals for simple AI. Called from the statemachine's onState functions.

#### `kat_vitals_fnc_handleTemperatureFunction`
- **Author:** Mazinski
- **File Path:** [fnc_handleTemperatureFunction.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_handleTemperatureFunction.sqf)
- **Description:** Update the temperature of the patient

#### `kat_vitals_fnc_handleUnitVitals`
- **Author:** Glowbal, Mazinski
- **File Path:** [fnc_handleUnitVitals.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_handleUnitVitals.sqf)
- **Description:** Updates the vitals. Called from the statemachine's onState functions.

#### `kat_vitals_fnc_hasStableVitals`
- **Author:** Ruthberg
- **File Path:** [fnc_hasStableVitals.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_hasStableVitals.sqf)
- **Description:** Check if a unit has stable vitals (required to become conscious)

#### `kat_vitals_fnc_init`
- **Author:** Mazinski
- **File Path:** [fnc_init.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_init.sqf)
- **Description:** Initializes unit variables.

#### `kat_vitals_fnc_returnFatigue`
- **Author:** Mazinski
- **File Path:** [fnc_returnFatigue.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_returnFatigue.sqf)
- **Description:** Local callback for checking ACE Fatigue values

#### `kat_vitals_fnc_updateOpioidEffect`
- **Author:** Glowbal
- **File Path:** [fnc_updateOpioidEffect.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_updateOpioidEffect.sqf)
- **Description:** Update the opioid effect

#### `kat_vitals_fnc_updateOpioidRelief`
- **Author:** Glowbal, modified by Cplhardcore
- **File Path:** [fnc_updateOpioidRelief.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\vitals\functions\fnc_updateOpioidRelief.sqf)
- **Description:** Update the opioid relief effect

---

## Addon: `watch`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Wristwatches & Telemetry Wearables
**Overview:** Implements wristwatches that display real-time patient telemetry (heart rate, SpO2, and temperature) when checked.

### Functions List:

#### `kat_watch_fnc_handleRespawn`
- **Author:** YetheSamartaka
- **File Path:** [fnc_handleRespawn.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\watch\functions\fnc_handleRespawn.sqf)
- **Description:** Edited: Mazinski

#### `kat_watch_fnc_hideCWatch`
- **Author:** Garth 'L-H' de Wet
- **File Path:** [fnc_hideCWatch.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\watch\functions\fnc_hideCWatch.sqf)
- **Description:** Modified: Mazinski

#### `kat_watch_fnc_hideKWatch`
- **Author:** Garth 'L-H' de Wet
- **File Path:** [fnc_hideKWatch.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\watch\functions\fnc_hideKWatch.sqf)
- **Description:** Modified: Mazinski

#### `kat_watch_fnc_hideRWatch`
- **Author:** Garth 'L-H' de Wet
- **File Path:** [fnc_hideRWatch.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\watch\functions\fnc_hideRWatch.sqf)
- **Description:** Modified: Mazinski

#### `kat_watch_fnc_hideSWatch`
- **Author:** Garth 'L-H' de Wet
- **File Path:** [fnc_hideSWatch.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\watch\functions\fnc_hideSWatch.sqf)
- **Description:** Modified: Mazinski

#### `kat_watch_fnc_init`
- **Author:** Katalam
- **File Path:** [fnc_init.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\watch\functions\fnc_init.sqf)
- **Description:** Initializes unit variables.

#### `kat_watch_fnc_showCWatch`
- **Author:** Garth 'L-H' de Wet
- **File Path:** [fnc_showCWatch.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\watch\functions\fnc_showCWatch.sqf)
- **Description:** Modified: Mazinski

#### `kat_watch_fnc_showKWatch`
- **Author:** Garth 'L-H' de Wet
- **File Path:** [fnc_showKWatch.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\watch\functions\fnc_showKWatch.sqf)
- **Description:** Modified: Mazinski

#### `kat_watch_fnc_showRWatch`
- **Author:** Garth 'L-H' de Wet
- **File Path:** [fnc_showRWatch.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\watch\functions\fnc_showRWatch.sqf)
- **Description:** Modified: Mazinski

#### `kat_watch_fnc_showSWatch`
- **Author:** Garth 'L-H' de Wet
- **File Path:** [fnc_showSWatch.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\watch\functions\fnc_showSWatch.sqf)
- **Description:** Modified: Mazinski

#### `kat_watch_fnc_startWatchTimer`
- **Author:** Katalam
- **File Path:** [fnc_startWatchTimer.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\watch\functions\fnc_startWatchTimer.sqf)
- **Description:** Initializes unit variables.

---

## Addon: `zeus`

- **Configuration:** Contains `config.cpp` defining CfgVehicles, CfgWeapons, or treatment actions.

### Zeus Gamemaster Controls
**Overview:** Provides Zeus interface panels, diagnostic tools, and modules to force airway obstructions, adjust SpO2 values, inject chemical agents, or check blood groups.

### Functions List:

#### `kat_zeus_fnc_emptyFunction`
- **Author:** DiGi
- **File Path:** [fnc_emptyFunction.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\zeus\functions\fnc_emptyFunction.sqf)
- **Description:** A empty function that does nothing.

#### `kat_zeus_fnc_showMessage`
- **Author:** 654wak654
- **File Path:** [fnc_showMessage.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\zeus\functions\fnc_showMessage.sqf)
- **Description:** Shows a Zeus message through the BIS function, handles localization.

#### `kat_zeus_fnc_toggleAIDeathModule`
- **Author:** Blue
- **File Path:** [fnc_toggleAIDeathModule.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\zeus\functions\fnc_toggleAIDeathModule.sqf)
- **Description:** Toggle whether AI unit can die instantly from fatal injury

#### `kat_zeus_fnc_ui_changeBloodType`
- **Author:** DiGi
- **File Path:** [fnc_ui_changeBloodType.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\zeus\functions\fnc_ui_changeBloodType.sqf)
- **Description:** Initalizes the "Manage Airways" Zeus module.

#### `kat_zeus_fnc_ui_changeCardiacState`
- **Author:** DiGi, Blue
- **File Path:** [fnc_ui_changeCardiacState.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\zeus\functions\fnc_ui_changeCardiacState.sqf)
- **Description:** Initalizes the "Change Cardiac State" Zeus module.

#### `kat_zeus_fnc_ui_manageAirway`
- **Author:** DiGi
- **File Path:** [fnc_ui_manageAirway.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\zeus\functions\fnc_ui_manageAirway.sqf)
- **Description:** Initalizes the "Manage Airways" Zeus module.

#### `kat_zeus_fnc_zeusAttributes`
- **Author:** PabstMirror
- **File Path:** [fnc_zeusAttributes.sqf](file:///C:/Users/bartl/Documents/GitHub/KAM/addons\zeus\functions\fnc_zeusAttributes.sqf)
- **Description:** Dummy function to include BIS script file.

---

