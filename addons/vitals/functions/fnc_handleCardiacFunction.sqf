#include "..\script_component.hpp"
/*
 * Author: Glowbal, Mazinski
 * Update heart rate
 
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Heart Rate Adjustments <NUMBER>
 * 2: Heart Rate Target <NUMBER>
 * 3: Blood Volume <NUMBER>
 * 4: ACE Fatigue <NUMBER>
 * 5: Time since last update <NUMBER>
 * 6: Sync value? <BOOL>
 *
 * ReturnValue:
 * Current Heart Rate <NUMBER>
 *
 * Example:
 * [player, 0, 80, 6, 0.1, 1, false] call kat_vitals_handleCardiacFunction;
 *
 * Public: No
 */

params ["_unit", "_hrTargetAdjustment", "_hrTarget", "_bloodVolume", "_aceAnFatigue", "_deltaT", "_syncValue"];

#define DEFAULT_STROKE_VOLUME 0.001583333323

private _actualHeartRate = _hrTarget;

if IN_CRDC_ARRST(_unit) then {
    if (alive (_unit getVariable [QACEGVAR(medical,CPR_provider), objNull])) then {
        if (_actualHeartRate == 0) then { _syncValue = true }; // always sync on large change
        _actualHeartRate = random [100, 110, 120];
    } else {
        if (_actualHeartRate != 0) then { _syncValue = true }; // always sync on large change
        _actualHeartRate = 0
    };
} else {
    private _painLevel = GET_PAIN_PERCEIVED(_unit);

    // Adjustments and Pain Levels are stripped from last cycle HR to isolate the baseline state
    private _lastCycleHeartRate = GET_HEART_RATE(_unit) - _hrTargetAdjustment - (10 * _painLevel) - (_aceAnFatigue * 40);

    // Frank-Starling Law: stroke volume depends on venous return (blood volume)
    private _strokeVolume = DEFAULT_STROKE_VOLUME * ((_bloodVolume / 6.0) ^ 1.2);

    // Conservation of Cardiac Output: heart rate increases to compensate for lower stroke volume
    private _modelHeartRate = DEFAULT_HEART_RATE * (DEFAULT_STROKE_VOLUME / (_strokeVolume max 0.0001));
    _modelHeartRate = _modelHeartRate min 160; // cap physiological compensatory tachycardia at 160 bpm

    // Chemoreflex: hypoxia (low SpO2) boosts heart rate to maintain oxygen delivery
    private _bloodGas = _unit getVariable [VAR_BLOOD_GAS, [40, 95, 0.98, 24, 7.4, 38]];
    private _o2Sat = _bloodGas select 2;
    private _hypoxiaBoost = 80 * (1 - _o2Sat);
    _modelHeartRate = _modelHeartRate + _hypoxiaBoost;

    // Terminal Decompensation: severe blood loss leads to cardiac bradycardia/failure
    private _decompensation = linearConversion [1.5, 2.5, _bloodVolume, 0.25, 1.0, true];
    _modelHeartRate = _modelHeartRate * _decompensation;

    // Autonomic transition filter: first-order lag filter smooths out heart rate shifts (first-order differential transition)
    _actualHeartRate = _lastCycleHeartRate + ((_modelHeartRate - _lastCycleHeartRate) * (0.15 * _deltaT));

    // Re-apply drugs, pain, and fatigue adjustments
    _actualHeartRate = _actualHeartRate + _hrTargetAdjustment + (10 * _painLevel) + (_aceAnFatigue * 40);
};

_unit setVariable [VAR_HEART_RATE, _actualHeartRate, _syncValue];

_actualHeartRate
