-- Copyright (C) 2022  veden

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.


local technologies = {}

local technologyUtils = require("utils/TechnologyUtils")

local makeTechnology = technologyUtils.makeTechnology

local constants = require("__RampantArsenalFork_Firestorm__/libs/Constants")

function technologies.enable()

    local capsuleTurretTech = makeTechnology({
            name = "capsule-turret",
            prerequisites = {"gun-turret", "military-3", "explosives"},
            icon = "__RampantArsenalFork_Firestorm__/graphics/technology/capsule-turrets.png",
            effects = {},
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1}
            },
            count = 250,
            time = 30
    })

    local shotgunTurretTech = makeTechnology({
            name = "shotgun",
            prerequisites = {"gun-turret","steel-processing","military"},
            icon = "__RampantArsenalFork_Firestorm__/graphics/technology/shotgun-turrets.png",
            effects = {},
            ingredients = {{"automation-science-pack", 1}},
            count = 60,
            time = 20
    })

    local rocketTurretTech = makeTechnology({
            name = "rocket-turret-1",
            prerequisites = {"gun-turret", "military-2", "rocketry"},
            icon = "__RampantArsenalFork_Firestorm__/graphics/technology/rocket-turrets.png",
            effects = {},
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"military-science-pack", 1}
            },
            count = 200,
            time = 30
    })

    makeTechnology({
            name = "rocket-turret-2",
            prerequisites = {"stronger-explosives-4", "explosive-rocketry", "efficiency-module-3", "military-3", rocketTurretTech, "engine"},
            icon = "__RampantArsenalFork_Firestorm__/graphics/technology/rocket-turrets.png",
            effects = {},
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1}
            },
            count = 300,
            time = 30
    })


    local cannonTech = makeTechnology({
            name = "cannon-turret-1",
            prerequisites = {"gun-turret","tank","concrete","steel-processing"},
            icon = "__RampantArsenalFork_Firestorm__/graphics/technology/cannon-turrets.png",
            effects = {},
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1}
            },
            count = 250,
            time = 30
    })

    makeTechnology({
            name = "cannon-turret-2",
            prerequisites = {"explosives", "stronger-explosives-4", "productivity-module-3", cannonTech},
            icon = "__RampantArsenalFork_Firestorm__/graphics/technology/cannon-turrets.png",
            effects = {},
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1},
                {"utility-science-pack", 1}
            },
            count = 400,
            time = 30
    })

        local cannonTurretDamage1 = makeTechnology({
                name = "cannon-turret-damage-1",
                prerequisites = {cannonTech},
                icon = "__RampantArsenalFork_Firestorm__/graphics/technology/cannon-turret-damage.png",
                upgrade = true,
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
					{"utility-science-pack", 1}
                },
                count = 250,
                time = 30,
                order = "e-z-a"
        })

        local cannonTurretDamage2 = makeTechnology({
                name = "cannon-turret-damage-2",
                prerequisites = {cannonTurretDamage1},
                icon = "__RampantArsenalFork_Firestorm__/graphics/technology/cannon-turret-damage.png",
                upgrade = true,
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
					{"utility-science-pack", 1}
                },
                count = 500,
                time = 45,
                order = "e-z-b"
        })

        local cannonTurretDamage3 = makeTechnology({
                name = "cannon-turret-damage-3",
                prerequisites = {cannonTurretDamage2},
                icon = "__RampantArsenalFork_Firestorm__/graphics/technology/cannon-turret-damage.png",
                upgrade = true,
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
					{"utility-science-pack", 1}
                },
                count = 1000,
                time = 50,
                order = "e-z-c"
        })

        local cannonTurretDamage4 = makeTechnology({
                name = "cannon-turret-damage-4",
                prerequisites = {cannonTurretDamage3},
                icon = "__RampantArsenalFork_Firestorm__/graphics/technology/cannon-turret-damage.png",
                upgrade = true,
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                count = 2000,
                time = 60,
                order = "e-z-d"
        })


        local cannonTurretDamage5 = makeTechnology({
                name = "cannon-turret-damage-5",
                prerequisites = {cannonTurretDamage4},
                icon = "__RampantArsenalFork_Firestorm__/graphics/technology/cannon-turret-damage.png",
                upgrade = true,
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                count = 4000,
                time = 60,
                order = "e-z-e"
        })

        local cannonTurretDamage6 = makeTechnology({
                name = "cannon-turret-damage-6",
                prerequisites = {cannonTurretDamage5},
                icon = "__RampantArsenalFork_Firestorm__/graphics/technology/cannon-turret-damage.png",
                upgrade = true,
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                count = 8000,
                time = 60,
                order = "e-z-f"
        })

		makeTechnology({
				name = "artillery-shell-damage-1",
				prerequisites = {"artillery", "space-science-pack"},
				icon = "__RampantArsenalFork_Firestorm__/graphics/technology/artillery-shell-damage.png",
				upgrade = true,
				maxLevel = "infinite",
				effects = {
					{
						type = "ammo-damage",
						ammo_category = "artillery-shell",
						modifier = 0.4
					}
				},
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"military-science-pack", 1},
					{"utility-science-pack", 1},
					{"space-science-pack", 1}
				},
				countForumla = "(L)*20000",
				time = 60,
				order = "e-z-f"
		})

		makeTechnology({
				name = "artillery-turret-damage-1",
				prerequisites = {"artillery", "space-science-pack"},
				icon = "__RampantArsenalFork_Firestorm__/graphics/technology/artillery-damage.png",
				upgrade = true,
				maxLevel = "infinite",
				effects = {
					{
						type = "turret-attack",
						turret_id = "artillery-wagon",
						modifier = 0.4
					},
					{
						type = "turret-attack",
						turret_id = "artillery-turret",
						modifier = 0.4
					}
				},
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"military-science-pack", 1},
					{"utility-science-pack", 1},
					{"space-science-pack", 1}
				},
				countForumla = "(L)*20000",
				time = 60,
				order = "e-z-f"
		})


    if settings.startup["rampant-arsenal-enableAmmoTypes"].value then
        local incendiary = makeTechnology({
                name="incendiary",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/incendiary.png",
                prerequisites = {"flamethrower"},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

        local napalm = makeTechnology({
                name="incendiary-napalm",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/incendiary-napalm.png",
                prerequisites = {incendiary, "sulfur-processing"},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

        local he = makeTechnology({
                name="high-explosives",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/he-ordnance.png",
                prerequisites = {"explosives"},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

        local bioweapons = makeTechnology({
                name="bio-weapons",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/biowarfare.png",
                prerequisites = {"military-3"},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

		makeTechnology({
				name = "paralysis",
				icon="__RampantArsenalFork_Firestorm__/graphics/technology/paralysis.png",
				prerequisites = {"military-4", bioweapons},
				effects = {},
				count = 75,
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"chemical-science-pack", 1},
					{"military-science-pack", 1}
				},
				time = 30
		})

        local bioCapsules = makeTechnology({
                name="bio-capsules",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/bio-capsules.png",
                prerequisites = {"military-4", "explosives", bioweapons},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                count = 100,
                time = 30
        })

        makeTechnology({
                name="incendiary-grenades",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/incendiary-grenades.png",
                prerequisites = {"explosives", "military-2", incendiary},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                count = 100,
                time = 30
        })

        makeTechnology({
                name="incendiary-landmine",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/incendiary-landmines.png",
                prerequisites = {"land-mine", incendiary},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                count = 100,
                time = 30
        })

        makeTechnology({
                name="bio-landmine",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/bio-landmines.png",
                prerequisites = {"land-mine", bioweapons},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                count = 100,
                time = 30
        })

        makeTechnology({
                name="he-landmine",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/he-landmines.png",
                prerequisites = {"land-mine", he},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                count = 100,
                time = 30
        })

        makeTechnology({
                name="incendiary-cannon-shells",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/incendiary-cannon-shells.png",
                prerequisites = {"military-3", "tank", incendiary},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                count = 100,
                time = 30
        })

        makeTechnology({
                name="bio-cannon-shells",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/bio-cannon-shells.png",
                prerequisites = {"military-3", "tank", bioweapons},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                count = 100,
                time = 30
        })

        makeTechnology({
                name="he-cannon-shells",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/he-cannon-shells.png",
                prerequisites = {"military-3", "tank", he},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                count = 100,
                time = 30
        })

        makeTechnology({
                name="incendiary-artillery-shells",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/incendiary-artillery-shells.png",
                prerequisites = {"artillery", napalm},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                count = 2000,
                time = 30
        })

        makeTechnology({
                name="bio-artillery-shells",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/bio-artillery-shells.png",
                prerequisites = {bioCapsules, "artillery"},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                count = 2000,
                time = 30
        })


        local heGrenades = makeTechnology({
                name="he-grenades",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/he-grenades.png",
                prerequisites = {he, "military-2"},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                count = 100,
                time = 30
        })

        makeTechnology({
                name="he-artillery-shells",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/he-artillery-shells.png",
                prerequisites = {"artillery", heGrenades},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                count = 2000,
                time = 30
        })

        makeTechnology({
                name="bio-grenades",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/bio-grenades.png",
                prerequisites = {bioweapons, "military-2"},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                count = 100,
                time = 30
        })

        makeTechnology({
                name = "bio-bullets",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/bio-bullets.png",
                prerequisites = {bioweapons},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "bio-shotgun-shells",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/bio-shotgun-shells.png",
                prerequisites = {bioweapons},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "bio-rockets",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/bio-rockets.png",
                prerequisites = {bioweapons, "explosive-rocketry"},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })


        makeTechnology({
                name = "incendiary-bullets",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/incendiary-bullets.png",
                prerequisites = {incendiary},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "incendiary-shotgun-shells",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/incendiary-shotgun-shells.png",
                prerequisites = {incendiary},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "incendiary-rockets",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/incendiary-rockets.png",
                prerequisites = {incendiary, "explosive-rocketry"},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "he-bullets",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/he-bullets.png",
                prerequisites = {he},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "he-shotgun-shells",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/he-shotgun-shells.png",
                prerequisites = {he},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "he-rockets",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/he-rockets.png",
                prerequisites = {he, "explosive-rocketry"},
                effects = {},
                count = 75,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

    end

    makeTechnology({
            name = "flamethrower-2",
            prerequisites = {"refined-flammables-2", "military-3"},
            icon = "__base__/graphics/technology/flamethrower.png",
            iconSize=256,
            iconMipmaps=4,
            effects = {},
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1}
            },
            count = 1500,
            time = 30
    })

    makeTechnology({
            name = "flamethrower-3",
            prerequisites = {"refined-flammables-4", "military-4", "processing-unit", "concrete"},
            icon = "__base__/graphics/technology/flamethrower.png",
            iconSize=256,
            iconMipmaps=4,
            effects = {},
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1},
                {"utility-science-pack", 1}
            },
            count = 2000,
            time = 30
    })


    local lightningTurretTech = makeTechnology({
            name = "lightning",
            prerequisites = {"laser-turret", "military-3"},
            icon = "__RampantArsenalFork_Firestorm__/graphics/technology/lightning-turrets.png",
            effects = {},
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1}
            },
            count = 400,
            time = 30
    })

    local laserTurret = makeTechnology({
            name = "advanced-laser-turret-2",
            prerequisites = {"laser-turret", "laser-weapons-damage-3", "military-3"},
            icon = "__base__/graphics/technology/laser-turret.png",
            iconSize=256,
            iconMipmaps=4,
            effects = {},
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1}
            },
            count = 600,
            time = 30
    })

    makeTechnology({
            name = "advanced-laser-turret-3",
            icon = "__base__/graphics/technology/laser-turret.png",
            iconSize=256,
            iconMipmaps=4,
            prerequisites = {"laser-weapons-damage-6", laserTurret, "speed-module-3", "military-4"},
            effects = {},
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1},
                {"utility-science-pack", 1}
            },
            count = 2000,
            time = 30
    })

    makeTechnology({
            name = "boosters",
            icon="__RampantArsenalFork_Firestorm__/graphics/technology/boosters.png",
            prerequisites = {"military-2"},
            effects = {},
            count = 35,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"military-science-pack", 1}
            },
            time = 30
    })

    local regeneration = makeTechnology({
            name = "regeneration",
            icon="__RampantArsenalFork_Firestorm__/graphics/technology/regeneration.png",
            prerequisites = {"military-2", "advanced-circuit", "plastics"},
            effects = {},
            count = 200,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"military-science-pack", 1}
            },
            time = 30
    })

    makeTechnology({
            name = "regeneration-walls",
            icon="__RampantArsenalFork_Firestorm__/graphics/technology/mending-walls.png",
            prerequisites = {regeneration, "stone-wall", "gate", "military-3"},
            effects = {},
            count = 200,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1}
            },
            time = 30
    })

    makeTechnology({
            name = "regeneration-turrets",
            icon="__RampantArsenalFork_Firestorm__/graphics/technology/medic-turrets.png",
            prerequisites = {regeneration, "engine"},
            effects = {},
            count = 200,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"military-science-pack", 1}
            },
            time = 30
    })

    local turrets2 = makeTechnology({
            name = "turrets-2",
            icon="__RampantArsenalFork_Firestorm__/graphics/technology/turrets-2.png",
            prerequisites = {"gun-turret", "military-3", "physical-projectile-damage-4", "weapon-shooting-speed-4"},
            effects = {},
            count = 500,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1}
            },
            time = 30
    })

    makeTechnology({
            name = "lite-artillery",
            icons=
            {
                {
                    icon = "__base__/graphics/technology/artillery.png",
                    icon_size=256,
                    icon_mipmaps=4,
                    tint = { 0.5, 0.9, 0.5, 1 }
                }
            },
            prerequisites = {"tank", capsuleTurretTech, "concrete"},
            effects = {},
            count = 800,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1}
            },
            time = 60
    })

    if settings.startup["rampant-arsenal-enableVehicle"].value then
        makeTechnology({
                name = "nuclear-railway",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/nuclear-railway.png",
                prerequisites = {"nuclear-power", "railway", "processing-unit"},
                effects = {},
                count = 350,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 30
        })

        local tanks2 = makeTechnology({
                name = "tanks-2",
                icon="__base__/graphics/technology/tank.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"tank", "processing-unit", "military-4"},
                effects = {},
                count = 300,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "nuclear-tanks",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/nuclear-tanks.png",
                prerequisites = {"nuclear-power", tanks2},
                effects = {},
                count = 1000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"production-science-pack", 1}
                },
                time = 30
        })


        local cars2 = makeTechnology({
                name = "cars-2",
                icon="__base__/graphics/technology/automobilism.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"automobilism", "military-3", "processing-unit"},
                effects = {},
                count = 300,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "nuclear-cars",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/nuclear-cars.png",
                prerequisites = {"nuclear-power", "military-4", cars2},
                effects = {},
                count = 750,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 30
        })
    end

    if settings.startup["rampant-arsenal-enableEquipment"].value then
        makeTechnology({
                name = "power-armor-mk3",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/power-armor-mk3.png",
                prerequisites = {"power-armor-mk2", "nuclear-power"},
                effects = {},
                count = 600,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"production-science-pack", 1}
                },
                time = 30
        })

        local genMk2 = makeTechnology({
                name = "generator-equipment-2",
                icon="__base__/graphics/technology/fission-reactor-equipment.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"fission-reactor-equipment", "productivity-module-3"},
                effects = {},
                count = 600,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"production-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "generator-equipment-3",
                icon="__base__/graphics/technology/fission-reactor-equipment.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {genMk2, "nuclear-power"},
                effects = {},
                count = 800,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"production-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "shield-equipment-2",
                icon="__base__/graphics/technology/energy-shield-mk2-equipment.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"energy-shield-mk2-equipment", "speed-module-3"},
                effects = {},
                count = 400,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "battery-equipment-3",
                icon="__base__/graphics/technology/battery-mk2-equipment.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"battery-mk2-equipment", "efficiency-module-3"},
                effects = {},
                count = 400,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 30
        })
    end

    makeTechnology({
            name = "stone-walls-2",
            icon="__base__/graphics/technology/stone-wall.png",
            iconSize=256,
            iconMipmaps=4,
            prerequisites = {"military-3", "concrete", "stone-wall", "gate"},
            effects = {},
            count = 400,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1}
            },
            time = 30
    })
	
    makeTechnology({
            name = "stone-walls-3",
			icon = "__base__/graphics/technology/stone-wall.png",
			icon_size = 256,
            iconMipmaps=4,
			tint = constants.heavyWallsTint,
            prerequisites = {"rampant-arsenal-technology-stone-walls-2"},
            effects = {},
            count = 300,
			ingredients =
			{
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack",   1 },
				{ "chemical-science-pack",   1 },
				{ "military-science-pack",  1 },
			},
			time = 30
    })

    if (not mods["RPGsystem"]) then
        local characterHealthBonus1 = makeTechnology({
                name = "character-health-1",
                prerequisites = {regeneration},
                icon = "__RampantArsenalFork_Firestorm__/graphics/technology/character-bonus-health.png",
                upgrade = true,
                effects = {
                    {
                        type = "character-health-bonus",
                        modifier = 100
                    }
                },
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"military-science-pack", 1}
                },
                count = 50,
                time = 30,
                order = "e-z-a"
        })

		local characterHealthBonus2 = makeTechnology({
				name = "character-health-2",
				prerequisites = {characterHealthBonus1},
				icon = "__RampantArsenalFork_Firestorm__/graphics/technology/character-bonus-health.png",
				upgrade = true,
				effects = {
					{
						type = "character-health-bonus",
						modifier = 100
					}
				},
				ingredients = {
					{"automation-science-pack", 1},
					{"logistic-science-pack", 1},
					{"military-science-pack", 1}
				},
				count = 100,
				time = 45,
				order = "e-z-b"
		})

		if not mods["space-age"] then
			local characterHealthBonus3 = makeTechnology({
					name = "character-health-3",
					prerequisites = {characterHealthBonus2},
					icon = "__RampantArsenalFork_Firestorm__/graphics/technology/character-bonus-health.png",
					upgrade = true,
					effects = {
						{
							type = "character-health-bonus",
							modifier = 100
						}
					},
					ingredients = {
						{"automation-science-pack", 1},
						{"logistic-science-pack", 1},
						{"military-science-pack", 1}
					},
					count = 300,
					time = 50,
					order = "e-z-c"
			})

			local characterHealthBonus4 = makeTechnology({
					name = "character-health-4",
					prerequisites = {characterHealthBonus3},
					icon = "__RampantArsenalFork_Firestorm__/graphics/technology/character-bonus-health.png",
					upgrade = true,
					effects = {
						{
							type = "character-health-bonus",
							modifier = 100
						}
					},
					ingredients = {
						{"automation-science-pack", 1},
						{"logistic-science-pack", 1},
						{"military-science-pack", 1}
					},
					count = 300,
					time = 60,
					order = "e-z-d"
			})


			local characterHealthBonus5 = makeTechnology({
					name = "character-health-5",
					prerequisites = {characterHealthBonus4},
					icon = "__RampantArsenalFork_Firestorm__/graphics/technology/character-bonus-health.png",
					upgrade = true,
					effects = {
						{
							type = "character-health-bonus",
							modifier = 100
						}
					},
					ingredients = {
						{"automation-science-pack", 1},
						{"logistic-science-pack", 1},
						{"chemical-science-pack", 1},
						{"military-science-pack", 1}
					},
					count = 1000,
					time = 60,
					order = "e-z-e"
			})

			local characterHealthBonus6 = makeTechnology({
					name = "character-health-6",
					prerequisites = {characterHealthBonus5},
					icon = "__RampantArsenalFork_Firestorm__/graphics/technology/character-bonus-health.png",
					upgrade = true,
					effects = {
						{
							type = "character-health-bonus",
							modifier = 100
						}
					},
					ingredients = {
						{"automation-science-pack", 1},
						{"logistic-science-pack", 1},
						{"chemical-science-pack", 1},
						{"military-science-pack", 1},
						{"utility-science-pack", 1}
					},
					count = 3000,
					time = 60,
					order = "e-z-f"
			})

			if (settings.startup["rampant-arsenal-useInfiniteTechnologies"].value) then
				makeTechnology({
						name = "character-health-7",
						prerequisites = {characterHealthBonus6, "space-science-pack"},
						icon = "__RampantArsenalFork_Firestorm__/graphics/technology/character-bonus-health.png",
						upgrade = true,
						maxLevel = "infinite",
						effects = {
							{
								type = "character-health-bonus",
								modifier = 100
							}
						},
						ingredients = {
							{"automation-science-pack", 1},
							{"logistic-science-pack", 1},
							{"chemical-science-pack", 1},
							{"military-science-pack", 1},
							{"utility-science-pack", 1},
							{"space-science-pack", 1}
						},
						countForumla = "(L-6)*20000",
						time = 60,
						order = "e-z-f"
				})
			end
		end
    end

    if settings.startup["rampant-arsenal-enableEquipment"].value then
        makeTechnology({
                name = "personal-shotgun-defense",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/personal-shotgun-defense-equipment.png",
                prerequisites = {"personal-laser-defense-equipment",
                                 "processing-unit",
                                 "efficiency-module-2",
                                 shotgunTurretTech,
                                 "physical-projectile-damage-5"},
                effects = {},
                count = 400,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "personal-cannon-defense",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/personal-cannon-defense-equipment.png",
                prerequisites = {"personal-laser-defense-equipment",
                                 "military-4",
                                 "processing-unit",
                                 cannonTech,
                                 "productivity-module-2",
                                 "physical-projectile-damage-6"},
                effects = {},
                count = 400,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "personal-lightning-defense",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/personal-lightning-defense-equipment.png",
                prerequisites = {"personal-laser-defense-equipment",
                                 "military-4",
                                 "processing-unit",
                                 lightningTurretTech,
                                 "speed-module-2",
                                 "laser-weapons-damage-5"},
                effects = {},
                count = 400,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "personal-bullets-defense",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/personal-bullets-defense-equipment.png",
                prerequisites = {"personal-laser-defense-equipment", "military-4", "processing-unit", turrets2},
                effects = {},
                count = 400,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "personal-slow-defense",
                icon="__RampantArsenalFork_Firestorm__/graphics/technology/personal-slow-defense-equipment.png",
                prerequisites = {"personal-laser-defense-equipment", "military-4", capsuleTurretTech, "processing-unit"},
                effects = {},
                count = 400,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"military-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 30
        })
    end

    -- if settings.startup["rampant-arsenal-hideVanillaDamageTechnologies"].value then
        -- data.raw["technology"]["physical-projectile-damage-1"].hidden = true
        -- data.raw["technology"]["physical-projectile-damage-2"].hidden = true
        -- data.raw["technology"]["physical-projectile-damage-3"].hidden = true
        -- data.raw["technology"]["physical-projectile-damage-4"].hidden = true
        -- data.raw["technology"]["physical-projectile-damage-5"].hidden = true
        -- data.raw["technology"]["physical-projectile-damage-6"].hidden = true
        -- data.raw["technology"]["physical-projectile-damage-7"].hidden = true

        -- data.raw["technology"]["weapon-shooting-speed-1"].hidden = true
        -- data.raw["technology"]["weapon-shooting-speed-2"].hidden = true
        -- data.raw["technology"]["weapon-shooting-speed-3"].hidden = true
        -- data.raw["technology"]["weapon-shooting-speed-4"].hidden = true
        -- data.raw["technology"]["weapon-shooting-speed-5"].hidden = true
        -- data.raw["technology"]["weapon-shooting-speed-6"].hidden = true

        -- data.raw["technology"]["stronger-explosives-1"].hidden = true
        -- data.raw["technology"]["stronger-explosives-2"].hidden = true
        -- data.raw["technology"]["stronger-explosives-3"].hidden = true
        -- data.raw["technology"]["stronger-explosives-4"].hidden = true
        -- data.raw["technology"]["stronger-explosives-5"].hidden = true
        -- data.raw["technology"]["stronger-explosives-6"].hidden = true
        -- data.raw["technology"]["stronger-explosives-7"].hidden = true
    -- end
end

return technologies
