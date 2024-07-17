
local addonName, lib = ...;

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

lib.LOGD = LOGD
lib.LOGW = LOGW
lib.LOGE = LOGE
lib.toBoolStr = toBoolStr
