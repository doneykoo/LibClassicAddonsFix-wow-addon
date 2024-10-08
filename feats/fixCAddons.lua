
local addonName, lib = ...;

local _G = _G

-- Doney Mod -->>
local gCAddons = {}

local function g_GetAddOnEnableState(char, addon)
    return C_AddOns.GetAddOnEnableState(char, addon)
end
local function _GetAddOnEnableState(arg1, arg2)
    local char = arg1
    local addon = arg2
    if arg2 == nil then
        -- for those only pass addon name as 1st param
        char = UnitName("player")
        addon = arg1
    end
    if arg2 == UnitName("player") then
        char = arg2
        addon = arg1
    end
    return g_GetAddOnEnableState(char, addon)
end

local function fixTargetCAddons(t)
    if t.IsAddOnLoaded == nil then
        t.IsAddOnLoaded = gCAddons.IsAddOnLoaded or IsAddOnLoaded
    end
    if t.IsAddOnExist == nil then
        t.IsAddOnExist = gCAddons.IsAddOnExist or IsAddOnExist
    end
    if t.DisableAddOn == nil then
        t.DisableAddOn = gCAddons.DisableAddOn or DisableAddOn
    end
    if t.EnableAddOn == nil then
        t.EnableAddOn = gCAddons.EnableAddOn or EnableAddOn
    end
    if t.GetAddOnInfo == nil then
        t.GetAddOnInfo = gCAddons.GetAddOnInfo or GetAddOnInfo
    end
    if t.GetAddOnMetadata == nil then
        t.GetAddOnMetadata = gCAddons.GetAddOnMetadata or GetAddOnMetadata
    end
    g_GetAddOnEnableState = gCAddons.GetAddOnEnableState or GetAddOnEnableState
    if t.GetAddOnEnableState == nil then
        t.GetAddOnEnableState = _GetAddOnEnableState
    end
    if t.GetNumAddOns == nil then
        t.GetNumAddOns = gCAddons.GetNumAddOns or GetNumAddOns
    end
    if t.LoadAddOn == nil then
        t.LoadAddOn = gCAddons.LoadAddOn or LoadAddOn
    end
end

local function fixCAddons()
    lib.LOGD("IsAddOnLoaded: " .. type(IsAddOnLoaded))
    lib.LOGD("C_Addons: " .. type(C_Addons))
    lib.LOGD("C_AddOns: " .. type(C_AddOns))
    if C_Addons ~= nil then
        lib.LOGD("C_Addons.IsAddOnLoaded: " .. type(C_Addons.IsAddOnLoaded))
    end
    if C_AddOns ~= nil then
        lib.LOGD("C_AddOns.IsAddOnLoaded: " .. type(C_AddOns.IsAddOnLoaded))
    end

    if IsAddOnLoaded ~= nil then
        gCAddons = _G
    elseif C_AddOns ~= nil then
        gCAddons = C_AddOns
    elseif C_Addons ~= nil then
        gCAddons = C_Addons
    else
        LOGE("error: 无法修复`IsAddOnLoaded`，找不到可用函数")
    end

    if C_AddOns == nil or C_AddOns.IsAddOnLoaded == nil then
        lib.LOGD("Fix for C_AddOns ...")
        if C_AddOns == nil then
            _G.C_AddOns = {}
        end
        fixTargetCAddons(_G.C_AddOns)
    end
end

fixCAddons();
-- Doney Mod <<--