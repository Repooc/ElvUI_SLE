--Credit to Repooc.
--Remade his auto release featule to module which allows profile setting of the function not the global one.
local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local AR = E:NewModule('AutoRelease', 'AceHook-3.0', 'AceEvent-3.0');
local myclass = E.myclass
local IsInInstance = IsInInstance
local soulstone = GetSpellInfo(20707)
local UnitLevel = UnitLevel
local GetSpellCooldown = GetSpellCooldown
local level = 0
local cd
local GetTime = GetTime
local RepopMe = RepopMe

local function Check(level, cd)
	if ((myclass ~= "SHAMAN") and not (soulstone and UnitBuff("player", soulstone))) then
		RepopMe()
	elseif myclass == "SHAMAN" and (level < 32 or cd > 0) then
		RepopMe()
	end
end

function AR:Releasing()
	local inInstance, instanceType = IsInInstance()
	if myclass == "SHAMAN" then 
		level = UnitLevel("player") 
		local start, duration = GetSpellCooldown(20608)
		if duration == nil then duration = 0 end
		cd = (start + duration - GetTime())
	end
	if (inInstance and (instanceType == "pvp")) then
		if E.db.sle.pvpautorelease then Check(level, cd) end
	end
	
	-- auto resurrection for world PvP area...when active
	if E.db.sle.pvpautorelease then 
		for index = 1, GetNumWorldPVPAreas() do
			local _, localizedName, isActive = GetWorldPVPAreaInfo(index)
			if (GetRealZoneText() == localizedName and isActive) then Check(level, cd) end
		end
	end
end

function AR:Initialize()
	ShowUIPanel(GhostFrame)
	E:CreateMover(GhostFrame, "GhostFrameMover", L["Ghost Frame"], nil, nil, nil, "ALL,S&L,S&L MISC")
	HideUIPanel(GhostFrame)
	self:RegisterEvent("PLAYER_DEAD", "Releasing");
end

E:RegisterModule(AR:GetName())