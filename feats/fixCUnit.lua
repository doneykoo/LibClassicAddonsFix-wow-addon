local addonName, lib = ...;

local _G = _G

local gCUnitAuras = {}

local gUnitAura = C_UnitAuras and C_UnitAuras.GetAuraDataByIndex or _G.UnitAura

-- Doney Mod
function fixCUnit()
    if C_UnitAuras ~= nil then
        gCUnitAuras = C_UnitAuras
        return
    end

    C_UnitAuras = gCUnitAuras
    C_UnitAuras.GetAuraDataByIndex = gUnitAura
end

fixCUnit()
