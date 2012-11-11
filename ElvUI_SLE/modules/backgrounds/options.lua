﻿local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local BG = E:GetModule('BackGrounds')

local drop = {
	--Group name = {short name, order, minimum width}
	["Bottom BG"] = {"bottom", 1, 200},
	["Left BG"] = {"left", 2, 150},
	["Right BG"] = {"right", 3, 150},
	["Actionbar BG"] = {"action", 4, 200},
}

--Options for additional background frames. Main group
E.Options.args.sle.args.backgrounds = {
	type = "group",
	name = L["Backgrounds"],
	order = 9,
	childGroups = "select",
	args = {
		header = {
			order = 1,
			type = "header",
			name = L["Additional Background Panels"],
		},
		intro = {
			order = 2,
			type = "description",
			name = L["BG_DESC"]
		},
		bottom_enabled = {
			order = 3,
			type = "toggle",
			name = L["Bottom BG"],
			desc = L["Show/Hide this frame."],
			get = function(info) return E.db.sle.backgrounds.bottom.enabled end,
			set = function(info, value) E.db.sle.backgrounds.bottom.enabled = value; BG:FramesVisibility() end
		},
		left_enabled = {
			order = 4,
			type = "toggle",
			name = L["Left BG"],
			desc = L["Show/Hide this frame."],
			get = function(info) return E.db.sle.backgrounds.left.enabled end,
			set = function(info, value) E.db.sle.backgrounds.left.enabled = value; BG:FramesVisibility() end
		},
		spacer = {
			order = 5,
			type = "description",
			name = "",
		},
		right_enabled = {
			order = 6,
			type = "toggle",
			name = L["Right BG"],
			desc = L["Show/Hide this frame."],
			get = function(info) return E.db.sle.backgrounds.right.enabled end,
			set = function(info, value) E.db.sle.backgrounds.right.enabled = value; BG:FramesVisibility() end
		},
		action_enabled = {
			order = 7,
			type = "toggle",
			name = L["Actionbar BG"],
			desc = L["Show/Hide this frame."],
			get = function(info) return E.db.sle.backgrounds.action.enabled end,
			set = function(info, value) E.db.sle.backgrounds.action.enabled = value; BG:FramesVisibility() end
		},
	}
}

--Subgroups
for k,v in pairs(drop) do
	E.Options.args.sle.args.backgrounds.args[v[1]] = {
		type = "group",
		name = L[k],
		order = v[2],
		get = function(info) return E.db.sle.backgrounds[v[1]][ info[#info] ] end,
		disabled = function() return not E.db.sle.backgrounds[v[1]].enabled end,
		args = {
			width = { --setting width (obviously)
				order = 1,
				type = "range",
				name = L['Width'],
				desc = L["Sets width of the frame"],
				min = v[3], max = E.screenwidth, step = 1,
				set = function(info, value) E.db.sle.backgrounds[v[1]].width = value; BG:FramesSize() end,
			},
			height = {
				order = 2,
				type = "range",
				name = L['Height'],
				desc = L["Sets height of the frame"],
				min = 50, max = E.screenheight/2, step = 1,
				set = function(info, value) E.db.sle.backgrounds[v[1]].height = value; BG:FramesSize() end,
			},
			spacer = { --Empty slot for making sliders move to next line
				order = 3,
				type = "description",
				name = "",
			},
			xoffset = {
				order = 4,
				type = "range",
				name = L['X Offset'],
				desc = L["Sets X offset of the frame"],
				min = -E.screenwidth/2, max = E.screenwidth/2, step = 1,
				set = function(info, value) E.db.sle.backgrounds[v[1]].xoffset = value; BG:FramesPositions() end,
			},
			yoffset = {
				order = 5,
				type = "range",
				name = L['Y Offset'],
				desc = L["Sets Y offset of the frame"],
				min = -21, max = E.screenheight, step = 1,
				set = function(info, value) E.db.sle.backgrounds[v[1]].yoffset = value; BG:FramesPositions() end,
			},
			--Setting custom texture for those who like it
			texture = {
				order = 6,
				type = 'input',
				width = 'full',
				name = L["Texture"],
				desc = L["Set the texture to use in this frame.  Requirements are the same as the chat textures."],
				set = function(info, value) 
					E.db.sle.backgrounds[v[1]].texture = value
					E:UpdateMedia()
					BG:UpdateTex()
				end,
			},
			template = {
				order = 7,
				type = "select",
				name = L["Backdrop Template"],
				desc = L["Change the template used for this backdrop."],
				get = function(info) return E.private.sle.backgrounds[v[1]].template end,
				set = function(info, value) E.private.sle.backgrounds[v[1]].template = value; E:StaticPopup_Show("PRIVATE_RL") end,
				values = {
					['Default'] = L["Default"],
					['Transparent'] = L["Transparent"],
				},
			},
			pethide = {
				order = 8,
				type = "toggle",
				name = L["Hide in Pet Batlle"],
				desc = L["Show/Hide this frame during Pet Battles."],
				set = function(info, value) E.db.sle.backgrounds[v[1]].pethide = value; BG:RegisterHide() end
			},
		},
	}
end
