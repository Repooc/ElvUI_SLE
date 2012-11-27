local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local DT = E:GetModule('DataTexts')

local displayNumberString = ''
local lastPanel;

local function OnEvent(self, event, unit)
	if event == "UNIT_AURA" and unit ~= 'player' then return end
	lastPanel = self
	
	local baseMR, castingMR = GetManaRegen()
	if InCombatLockdown() then
		self.text:SetFormattedText(displayNumberString, "MP5", castingMR*5)
	else
		self.text:SetFormattedText(displayNumberString, "MP5", baseMR*5)
	end
end

local function ValueColorUpdate(hex, r, g, b)
	displayNumberString = string.join("", "%s: ", hex, "%.2f|r")
	
	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true

--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc, onLeaveFunc)
	
	name - name of the datatext (required)
	events - must be a table with string values of event names to register 
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
	onLeaveFunc - function to fire OnLeave, if not provided one will be set for you that hides the tooltip.
]]
DT:RegisterDatatext('MP5', {"UNIT_STATS", "UNIT_AURA", "FORGE_MASTER_ITEM_CHANGED", "ACTIVE_TALENT_GROUP_CHANGED", "PLAYER_TALENT_UPDATE"}, OnEvent)