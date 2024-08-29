local addonName, lib = ...;

local _G = _G

local gEquipmentSet

-- Doney Mod
function fixCUnit()
    if C_EquipmentSet ~= nil then
        gEquipmentSet = C_EquipmentSet
    else
        return
    end

    if GetNumEquipmentSets == nil then
        GetNumEquipmentSets = gEquipmentSet.GetNumEquipmentSets
    end
    if GetEquipmentSetInfo == nil then
        GetEquipmentSetInfo = gEquipmentSet.GetEquipmentSetInfo
    end
end

fixCUnit()
