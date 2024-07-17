
local addonName, lib = ...;

local _G = _G

-- Doney Mod -->>
local function fixCItem()
    if C_Item.GetItemInfo == nil then
        lib.LOGD("Fix for C_Item ...")
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
