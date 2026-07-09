#include "..\script_component.hpp"
/*
 * Author: Mazinski
 * Update the temperature of the patient
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Temperature Adjustments <NUMBER>
 * 2: Blood Volume <NUMBER>
 * 3: Time since last update <NUMBER>
 * 4: Sync value? <BOOL>
 *
 * ReturnValue:
 * Current Temperature <NUMBER>
 *
 * Example:
 * [player, 0, 6, 1, false] call kat_vitals_fnc_handleTemperatureFunction;
 *
 * Public: No
 */

params ["_unit", "_altitudeAdjustment", "_bloodVolume", "_deltaT", "_syncValue"];

private _positionTemperature = EGVAR(hypothermia,positionTemperature);
_positionTemperature params ["_lattitude", "_projectedTemperature"];

// Diurnal ambient temperature calculations
private _mapTemperature = _projectedTemperature - ((linearConversion [0, 90, _lattitude, 15, 5, true]) * (linearConversion [0, 1, sunOrMoon, 1, 0, true]));
private _ambientTemp = _mapTemperature + _altitudeAdjustment;

// Get current body temperature (stored state variable)
private _currentTemperature = _unit getVariable [QEGVAR(hypothermia,unitTemperature), DEFAULT_TEMPERATURE];

// Active warming from transfused fluids (instant mixing effect)
private _warmingImpact = _unit getVariable [QEGVAR(hypothermia,warmingImpact), 0];
if (_warmingImpact != 0) then {
    // warmingImpact is fluid-degree value, divide by ML_TO_LITERS to convert to core temp shift
    _currentTemperature = _currentTemperature + (_warmingImpact / ML_TO_LITERS);
    _unit setVariable [QEGVAR(hypothermia,warmingImpact), 0, true];
};

// Calculate heat contribution from active hand warmers
private _handWarmers = _unit getVariable [QEGVAR(hypothermia,handWarmers), [0,0,0,0,0,0]];
private _activeWarmersCount = { _x > 0 } count _handWarmers;
private _rateWarmers = _activeWarmersCount * 0.00015; // each warmer generates 0.00015 C/s

// Newton's Law of Cooling: cooling rate increases as blood volume (thermal mass) falls
private _kEnv = 0.00008 * (6 / (_bloodVolume max 1));
private _rateEnv = - _kEnv * (_currentTemperature - _ambientTemp);

// Metabolic heat production: body strives to maintain 37C setpoint.
// Metabolic efficiency falls with hemorrhagic shock (blood loss) and unconsciousness.
private _isAwake = [_unit] call ACEFUNC(common,isAwake);
private _awakeFactor = [0.75, 1.0] select _isAwake;
private _rateMetabolic = 0.00025 * (DEFAULT_TEMPERATURE - _currentTemperature) * ((_bloodVolume / 6) max 0) * _awakeFactor;

// Integrate rates over deltaT
_currentTemperature = _currentTemperature + ((_rateEnv + _rateMetabolic + _rateWarmers) * _deltaT);

// Clamp to survivable physiological limits (25C to 43C)
_currentTemperature = 25 max (43 min _currentTemperature);

_unit setVariable [QEGVAR(hypothermia,unitTemperature), _currentTemperature, _syncValue];

_currentTemperature
