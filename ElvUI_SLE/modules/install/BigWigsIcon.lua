local E, L, V, P, G, _ = unpack(ElvUI);
local AI = E:GetModule('AddonInstaller')

local ace3   = false              -- whether or not this database is a Ace3 profile
local name   = 'BigWigs'          -- the name of the addon
local dbname = 'BigWigs3IconDB'   -- name of the addon database

local function OnDemand(profile)  -- function that creates the "load on demand" database
	local database
	if profile == "Affinitii" then
		database = {
			["minimapPos"] = 158.126507574158,
			["hide"] = true,
		}
	end

	if profile == "Repooc" then
		-- No Settings
	end

	if profile == "Darth" then
		-- No Settings
	end  

	return database
end

-- register the profile with the engine
AI:RegisterAddonProfile(name, ace3, dbname, OnDemand)