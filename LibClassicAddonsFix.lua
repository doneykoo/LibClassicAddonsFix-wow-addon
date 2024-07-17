local _G = _G

local ENABLE_DEBUG_DONEY = true
local function LOGD(msg)
    if (ENABLE_DEBUG_DONEY) then
        DEFAULT_CHAT_FRAME:AddMessage("[|c4040ffffLibClassicAddonsFix|r/|cffffffffD|r] "..msg);
    end
end
local function LOGW(msg)
    DEFAULT_CHAT_FRAME:AddMessage("[|c4040ffffLibClassicAddonsFix|r/|cb0a040ffW|r] "..msg);
end
local function LOGE(msg)
    DEFAULT_CHAT_FRAME:AddMessage("[|c4040ffffLibClassicAddonsFix|r/|cfff040ffE|r] "..msg);
end
local function toBoolStr(value)
    return value and "true" or "false";
end

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
end

local function fixCAddons()
    LOGD("IsAddOnLoaded: " .. type(IsAddOnLoaded))
    LOGD("C_Addons: " .. type(C_Addons))
    LOGD("C_AddOns: " .. type(C_AddOns))
    if C_Addons ~= nil then
        LOGD("C_Addons.IsAddOnLoaded: " .. type(C_Addons.IsAddOnLoaded))
    end
    if C_AddOns ~= nil then
        LOGD("C_AddOns.IsAddOnLoaded: " .. type(C_AddOns.IsAddOnLoaded))
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
        LOGD("Fix for C_AddOns ...")
        if C_AddOns == nil then
            _G.C_AddOns = {}
        end
        fixTargetCAddons(_G.C_AddOns)
    end

    if C_Addons == nil or C_Addons.IsAddOnLoaded == nil then
        LOGD("Fix for C_Addons ...")
        if C_Addons == nil then
            _G.C_Addons = {}
        end
        fixTargetCAddons(_G.C_Addons)
    end
end

fixCAddons();
-- Doney Mod <<--

-- Doney Mod -->>
local function fixCItem()
    if C_Item.GetItemInfo == nil then
        LOGD("Fix for C_Item ...")
        C_Item.GetItemInfo = GetItemInfo
    end
    if C_Item.GetItemClassInfo == nil then
        C_Item.GetItemClassInfo = GetItemClassInfo
    end
    if C_Item.GetItemInfoInstant == nil then
        C_Item.GetItemInfoInstant = GetItemInfoInstant
    end
    if C_Item.GetDetailedItemLevelInfo == nil then
        C_Item.GetDetailedItemLevelInfo = GetDetailedItemLevelInfo
    end
    if C_Item.GetItemSubClassInfo == nil then
        C_Item.GetItemSubClassInfo = GetItemSubClassInfo
    end
    if C_Item.GetItemInventorySlotInfo == nil then
        C_Item.GetItemInventorySlotInfo = GetItemInventorySlotInfo
    end
    if C_Item.GetItemSpell == nil then
        C_Item.GetItemSpell = GetItemSpell
    end
    if C_Item.GetItemFamily == nil then
        C_Item.GetItemFamily = GetItemFamily
    end
    if C_Item.IsItemInRange == nil then
        C_Item.IsItemInRange = IsItemInRange
    end
    if C_Item.GetItemQualityColor == nil then
        C_Item.GetItemQualityColor = GetItemQualityColor
    end
end

fixCItem();
-- Doney Mod <<--
