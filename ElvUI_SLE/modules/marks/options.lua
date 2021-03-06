﻿local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local RM = E:GetModule('RaidMarks')
local RF = E:GetModule('RaidFlares')
local function configTable()

--Main options group
E.Options.args.sle.args.marks = {
	order = 90,
	type = "group",
	name = L["Raid Marks"],
	args = {
		marksheader = {
			order = 1,
			type = "header",
			name = L["Raid Marks"],
		},
		enabled = {
			order = 2,
			type = "toggle",
			name = L["Enable"],
			desc = L["Show/Hide raid marks."],
			get = function(info) return E.db.sle.marks.enabled end,
			set = function(info, value) E.db.sle.marks.enabled = value; RM:UpdateVisibility() end
		},
		backdrop = {
			order = 3,
			type = "toggle",
			name = L["Backdrop"],
			disabled = function() return not E.db.sle.marks.enabled end,
			get = function(info) return E.db.sle.marks.backdrop end,
			set = function(info, value) E.db.sle.marks.backdrop = value; RM:Backdrop() end
		},
		Reset = {
			order = 4,
			type = 'execute',
			name = L['Restore Defaults'],
			desc = L["Reset these options to defaults"],
			disabled = function() return not E.db.sle.marks.enabled end,
			func = function() E:GetModule('SLE'):Reset(nil, nil, nil, nil, true) end,
		},
		spacer = {
			order = 5,
			type = 'description',
			name = "",
		},
		showinside = {
			order = 6,
			type = "toggle",
			name = L["Show only in instances"],
			desc = L["Selecting this option will have the Raid Markers appear only while in a raid or dungeon."],
			disabled = function() return not E.db.sle.marks.enabled end,
			get = function(info) return E.db.sle.marks.showinside end,
			set = function(info, value) E.db.sle.marks.showinside = value; RM:UpdateVisibility() end
		},
		size = {
			order = 7,
			type = "range",
			name = L['Size'],
			desc = L["Sets size of buttons"],
			disabled = function() return not E.db.sle.marks.enabled end,
			min = 15, max = 30, step = 1,
			get = function(info) return E.db.sle.marks.size end,
			set = function(info, value) E.db.sle.marks.size = value; RM:FrameButtonsGrowth(); RM:FrameButtonsSize() end,
		},
		growth = {
			order = 8,
			type = "select",
			name = L["Direction"],
			desc = L["Change the direction of buttons growth from the skull marker"],
			disabled = function() return not E.db.sle.marks.enabled end,
			get = function(info) return E.db.sle.marks.growth end,
			set = function(info, value) E.db.sle.marks.growth = value; RM:FrameButtonsGrowth() end,
			values = {
				['RIGHT'] = L["Right"],
				['LEFT'] = L["Left"],
				['UP'] = L["Up"],
				['DOWN'] = L["Down"],
			},
		},
	},
}
E.Options.args.sle.args.flares = {
	order = 90,
	type = "group",
	name = L["Raid Flares"],
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["Raid Flares"],
		},
		enabled = {
			order = 2,
			type = "toggle",
			name = L["Enable"],
			desc = L["Show/Hide Raid Flares."],
			get = function(info) return E.db.sle.flares.enabled end,
			set = function(info, value) E.db.sle.flares.enabled = value; RF:UpdateVisibility() end
		},
		backdrop = {
			order = 3,
			type = "toggle",
			name = L["Backdrop"],
			disabled = function() return not E.db.sle.flares.enabled end,
			get = function(info) return E.db.sle.flares.backdrop end,
			set = function(info, value) E.db.sle.flares.backdrop = value; RF:Backdrop() end
		},
		--Reset = {
			--order = 4,
			--type = 'execute',
			--name = L['Restore Defaults'],
			--desc = L["Reset these options to defaults"],
			--disabled = function() return not E.db.sle.flares.enabled end,
			--func = function() E:GetModule('SLE'):Reset(nil, nil, nil, nil, true) end,
		--},
		spacer = {
			order = 5,
			type = 'description',
			name = "",
		},
		showinside = {
			order = 6,
			type = "toggle",
			name = L["Show only in instances"],
			desc = L["Selecting this option will have the Raid Flares appear only while in a raid or dungeon."],
			disabled = function() return not E.db.sle.flares.enabled end,
			get = function(info) return E.db.sle.flares.showinside end,
			set = function(info, value) E.db.sle.flares.showinside = value; RF:UpdateVisibility() end
		},
		tooltips = {
			order = 7,
			type = "toggle",
			name = L["Show Tooltip"],
			disabled = function() return not E.db.sle.flares.enabled end,
			get = function(info) return E.db.sle.flares.tooltips end,
			set = function(info, value) E.db.sle.flares.tooltips = value; end
		},
		size = {
			order = 8,
			type = "range",
			name = L['Size'],
			desc = L["Sets size of buttons"],
			disabled = function() return not E.db.sle.flares.enabled end,
			min = 15, max = 30, step = 1,
			get = function(info) return E.db.sle.flares.size end,
			set = function(info, value) E.db.sle.flares.size = value; RF:FrameButtonsGrowth(); RF:FrameButtonsSize() end,
		},
		growth = {
			order = 9,
			type = "select",
			name = L["Direction"],
			desc = L["Change the direction of buttons growth from the square marker"],
			disabled = function() return not E.db.sle.flares.enabled end,
			get = function(info) return E.db.sle.flares.growth end,
			set = function(info, value) E.db.sle.flares.growth = value; RF:FrameButtonsGrowth() end,
			values = {
				['RIGHT'] = L["Right"],
				['LEFT'] = L["Left"],
				['UP'] = L["Up"],
				['DOWN'] = L["Down"],
			},
		},
	},
}
end

table.insert(E.SLEConfigs, configTable)