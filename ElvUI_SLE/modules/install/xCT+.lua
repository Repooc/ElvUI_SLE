﻿local E, L, V, P, G, _ = unpack(ElvUI);
local AI = E:GetModule('AddonInstaller')

local ace3   = true               -- whether or not this database is a Ace3 profile
local name   = 'xCT+'             -- the name of the addon
local dbname = 'xCTSavedDB'       -- name of the addon database

local function OnDemand(profile)  -- function that creates the "load on demand" database
	local database
	if profile == "Affinitii" then
		database = {
			["blizzardFCT"] = {
				["font"] = "KGSmallTownSouthernGirl",
			},
			["spells"] = {
				["mergeCriticalsByThemselves"] = true,
				["mergeDontMergeCriticals"] = false,
			},
			["frames"] = {
				["general"] = {
					["showBuffs"] = false,
					["fontOutline"] = "2OUTLINE",
					["Width"] = 510,
					["font"] = "KGSmallTownSouthernGirl",
					["enabledFrame"] = false,
					["Height"] = 127,
				},
				["power"] = {
					["enabledFrame"] = false,
					["fontOutline"] = "2OUTLINE",
					["Width"] = 255,
					["font"] = "KGSmallTownSouthernGirl",
				},
				["healing"] = {
					["enabledFrame"] = false,
					["Width"] = 382,
					["Y"] = 89,
					["font"] = "KGSmallTownSouthernGirl",
					["Height"] = 143,
					["fontOutline"] = "2OUTLINE",
					["X"] = -319,
				},
				["outgoing"] = {
					["fontSize"] = 17,
					["fontOutline"] = "2OUTLINE",
					["enableScrollable"] = true,
					["Width"] = 149,
					["Y"] = -61,
					["X"] = 901,
					["iconsSize"] = 17,
					["font"] = "KGSmallTownSouthernGirl",
				},
				["critical"] = {
					["fontSize"] = 17,
					["iconsSize"] = 19,
					["fontOutline"] = "2OUTLINE",
					["Width"] = 149,
					["Y"] = 102,
					["font"] = "KGSmallTownSouthernGirl",
					["Height"] = 126,
					["X"] = 901,
				},
				["procs"] = {
					["enabledFrame"] = false,
					["enableScrollable"] = true,
					["Y"] = 101,
					["X"] = 1,
					["Height"] = 127,
					["font"] = "KGSmallTownSouthernGirl",
					["fontOutline"] = "2OUTLINE",
				},
				["loot"] = {
					["fontOutline"] = "2OUTLINE",
					["Width"] = 510,
					["Y"] = -223,
					["font"] = "KGSmallTownSouthernGirl",
					["Height"] = 126,
				},
				["class"] = {
					["fontOutline"] = "2OUTLINE",
					["font"] = "KGSmallTownSouthernGirl",
					["enabledFrame"] = false,
				},
				["damage"] = {
					["fontSize"] = 17,
					["X"] = 201,
					["Width"] = 133,
					["Y"] = -32,
					["font"] = "KGSmallTownSouthernGirl",
					["Height"] = 170,
					["fontOutline"] = "2OUTLINE",
				},
			},
		}
	end

	if profile == "Repooc" then
		-- No Settings
	end

	if profile == "Darth" then
		database = {
			["spells"] = {
				["items"] = {
					["Самоцветы"] = {
						["Особые"] = false,
						["Синие"] = false,
						["Простые"] = false,
						["Оранжевые"] = false,
						["Желтые"] = false,
						["Зеленые"] = false,
						["Зубчатое колесо"] = false,
						["Радужные"] = false,
						["Красные"] = false,
						["Фиолетовые"] = false,
					},
					["Сумки"] = {
						["Сумка начертателя"] = false,
						["Сумка для продуктов"] = false,
						["Сумка инженера"] = false,
						["Сумка шахтера"] = false,
						["Сумка кожевника"] = false,
						["Сумка зачаровывателя"] = false,
						["Сумка ювелира"] = false,
						["Сумка"] = false,
						["Сумка травника"] = false,
						["Ящик для рыболовных снастей"] = false,
					},
					["Доспехи"] = {
						["Тканевые"] = false,
						["Разное"] = false,
						["Кожаные"] = false,
						["Щиты"] = false,
						["Кольчужные"] = false,
						["Визуальный эффект"] = false,
						["Латные"] = false,
					},
					["Задания"] = {
						["Задания"] = true,
					},
					["Оружие"] = {
						["Древковое"] = false,
						["Метательное"] = false,
						["Кистевое"] = false,
						["Одноручное дробящее"] = false,
						["Двуручные топоры"] = false,
						["Огнестрельное"] = false,
						["Двуручное дробящее"] = false,
						["Одноручные топоры"] = false,
						["Арбалеты"] = false,
						["Разное"] = false,
						["Луки"] = false,
						["Посохи"] = false,
						["Двуручные мечи"] = false,
						["Удочки"] = false,
						["Жезлы"] = false,
						["Одноручные мечи"] = false,
						["Кинжалы"] = false,
					},
					["Расходуемые"] = {
						["Зелья"] = true,
						["Еда и напитки"] = true,
						["Другое"] = false,
						["Эликсиры"] = true,
						["Настойки"] = true,
						["Улучшения"] = false,
						["Бинты"] = false,
						["Свитки"] = false,
					},
					["version"] = 1,
					["Боевые питомцы"] = {
						["Гуманоид"] = false,
						["Нежить"] = false,
						["Элементаль"] = false,
						["Животное"] = false,
						["Дракон"] = false,
						["Зверек"] = false,
						["Магический"] = false,
						["Механизм"] = false,
						["Летающий"] = false,
						["Водный"] = false,
					},
					["Разное"] = {
						["Питомцы"] = false,
						["Праздничные предметы"] = true,
						["Реагенты"] = false,
						["Другое"] = false,
						["Верховые животные"] = false,
						["Хлам"] = false,
					},
					["Символы"] = {
						["Паладин"] = false,
						["Шаман"] = false,
						["Друид"] = false,
						["Жрец"] = false,
						["Разбойник"] = false,
						["Монах"] = false,
						["Воин"] = false,
						["Чернокнижник"] = false,
						["Охотник"] = false,
						["Маг"] = false,
						["Рыцарь смерти"] = false,
					},
					["Хозяйственные товары"] = {
						["Наложение чар"] = true,
						["Трава"] = true,
						["Кожа"] = true,
						["Материалы"] = true,
						["Металл и камень"] = true,
						["Стихии"] = true,
						["Ткань"] = true,
						["Кулинария"] = true,
						["Чары для предметов"] = true,
						["Детали"] = true,
						["Ювелирное дело"] = true,
						["Другое"] = true,
						["Устройства"] = true,
						["Взрывчатка"] = true,
					},
					["Рецепты"] = {
						["Рыбная ловля"] = false,
						["Инженерное дело"] = false,
						["Кожевничество"] = false,
						["Первая помощь"] = false,
						["Начертание"] = false,
						["Ювелирное дело"] = false,
						["Книга"] = false,
						["Кузнечное дело"] = false,
						["Наложение чар"] = false,
						["Кулинария"] = false,
						["Алхимия"] = false,
						["Портняжное дело"] = false,
					},
				},
			},
			["frames"] = {
				["general"] = {
					["fontSize"] = 14,
					["showBuffs"] = false,
					["showPartyKills"] = false,
					["showDebuffs"] = false,
					["font"] = "ElvUI Font",
					["fontOutline"] = "2OUTLINE",
				},
				["power"] = {
					["fontSize"] = 16,
					["fontOutline"] = "2OUTLINE",
					["font"] = "ElvUI Font",
					["Width"] = 116,
					["Y"] = -92,
					["X"] = 364,
					["Height"] = 151,
					["enabledFrame"] = false,
				},
				["healing"] = {
					["fontSize"] = 16,
					["showFriendlyHealers"] = false,
					["fontOutline"] = "2OUTLINE",
					["insertText"] = "top",
					["Width"] = 171,
					["Y"] = -94,
					["X"] = 219,
					["Height"] = 158,
					["font"] = "ElvUI Font",
				},
				["outgoing"] = {
					["fontSize"] = 16,
					["Height"] = 242,
					["fontOutline"] = "2OUTLINE",
					["insertText"] = "top",
					["Width"] = 121,
					["Y"] = -207,
					["font"] = "ElvUI Font",
					["iconsSize"] = 10,
					["X"] = 898,
				},
				["critical"] = {
					["fontSize"] = 20,
					["iconsSize"] = 14,
					["fontOutline"] = "2OUTLINE",
					["insertText"] = "top",
					["Width"] = 171,
					["Y"] = -156,
					["X"] = 751,
					["Height"] = 138,
					["font"] = "ElvUI Font",
				},
				["procs"] = {
					["enabledFrame"] = false,
					["Width"] = 254,
					["Y"] = -63,
					["Height"] = 126,
				},
				["loot"] = {
					["fontSize"] = 12,
					["filterItemQuality"] = 2,
					["X"] = -1,
					["fontOutline"] = "2OUTLINE",
					["Y"] = -94,
					["font"] = "ElvUI Font",
					["Height"] = 155,
					["Width"] = 283,
				},
				["class"] = {
					["enabledFrame"] = false,
				},
				["damage"] = {
					["fontSize"] = 16,
					["X"] = -204,
					["Width"] = 161,
					["Y"] = -96,
					["font"] = "ElvUI Font",
					["Height"] = 156,
					["fontOutline"] = "2OUTLINE",
				},
			},
		}
	end
	
	return database
end

-- register the profile with the engine
AI:RegisterAddonProfile(name, ace3, dbname, OnDemand)