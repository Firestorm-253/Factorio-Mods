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


local medic = {}

local sounds = require("__base__.prototypes.entity.sounds")
local recipeUtils = require("utils/RecipeUtils")
local technologyUtils = require("utils/TechnologyUtils")
local projectileUtils = require("utils/ProjectileUtils")
local ammoUtils = require("utils/AmmoUtils")
local turretUtils = require("utils/TurretUtils")

local makeAmmoTurret = turretUtils.makeAmmoTurret
local makeBombWave = projectileUtils.makeBombWave
local makeAmmo = ammoUtils.makeAmmo
local addEffectToTech = technologyUtils.addEffectToTech
local makeRecipe = recipeUtils.makeRecipe

local function medicSheet()
    return
        {
            layers =
                {
                    {
                        filename = "__RampantArsenalFork_Firestorm__/graphics/yuokiTani/entities/zone-expander.png",
                        priority = "high",
                        width = 96,
                        height = 128,
                        line_length = 4,
                        scale = 1,
                        run_mode = "forward",
                        direction_count = 1,
                        frame_count = 16,
                        shift = {-0.2, -1},
                    }
                }
        }
end


function medic.enable()

    data:extend(
        {
            {
                type = "ammo-category",
                name = "turret-capsule",
            }
    })

    local medicTurretAttributes = {
        name = "medic",
        icon = "__RampantArsenalFork_Firestorm__/graphics/icons/zone-expander.png",
        miningTime = 1,
        health = 1000,
        order = "b[turret]-a[zzzzmedic-turret]",
        collisionBox = {{-1, -1 }, {1, 1}},
        selectionBox = {{-1.2, -1.2 }, {1, 1}},
        hasBaseDirection = true,
        foldedAnimation = medicSheet(),
        foldingAnimation = medicSheet(),
        preparedAnimation = medicSheet(),
        preparingAnimation = medicSheet(),
        resistances = {
            {
                type = "fire",
                percent = 60
            },
            {
                type = "impact",
                percent = 30
            },
            {
                type = "explosion",
                percent = 30
            },
            {
                type = "physical",
                percent = 30
            },
            {
                type = "acid",
                percent = 30
            },
            {
                type = "electric",
                percent = 60
            },
            {
                type = "laser",
                percent = 60
            },
            {
                type = "poison",
                percent = 30
            }
        }
    }
    local medicTurret,medicTurretItem = makeAmmoTurret(medicTurretAttributes,
                                                       {
                                                           type = "projectile",
                                                           ammo_category = "turret-capsule",
                                                           cooldown = 1340,
                                                           warmup = 100,
                                                           projectile_creation_distance = 1,
                                                           damage_modifier = 1,
                                                           projectile_center = {0, 0},
                                                           range = 12,
                                                           sound = sounds.light_gunshot,
    })

    makeRecipe({
            name = medicTurretItem,
            icon = "__RampantArsenalFork_Firestorm__/graphics/icons/zone-expander.png",
            enabled = false,
            category = "crafting",
            ingredients = {
                {type = "item", name = "engine-unit", amount = 5},
                {type = "item", name = "advanced-circuit", amount = 5},
                {type = "item", name = "steel-plate", amount = 15}
            },
            result = medicTurretItem
    })


    local repairCapsules = makeAmmo({
            name = "self-repair-capsule",
            icon = "__RampantArsenalFork_Firestorm__/graphics/icons/medic-repair-pack.png",
            subgroup = "launcher-capsule",
            order = "y[turret-capsule]",
            magSize = 25,
            stackSize = 200,
			ammo_category = "turret-capsule",
            ammoType = {
                category = "turret-capsule",
                target_type = "position",
                clamp_position = true,

                action =
                    {
                        type = "direct",					
                        action_delivery =
                            {
                                type = "projectile",
                                max_range = 40,
                                starting_speed = 1,
                                projectile = makeBombWave(
                                    {
                                        name = "repair"
                                    },
                                    {
                                        type = "direct",
                                        action_delivery =
                                            {
                                                type = "instant",												
                                                source_effects =
                                                    {
                                                        {
                                                            type = "create-entity",
															affects_target = true,
                                                            entity_name = "big-repair-cloud-rampant-arsenal",
                                                            show_in_tooltip = true
                                                        }
                                                    }
                                            }
                                })
                            }
                    }
    }})

    makeRecipe({
            name = repairCapsules,
            icon = "__RampantArsenalFork_Firestorm__/graphics/icons/medic-repair-pack.png",
            enabled = false,
            ingredients = {
                {type = "item", name = "copper-plate", amount = 2},
                {type = "item", name = "repair-capsule-rampant-arsenal", amount = 5},
                {type = "item", name = "advanced-circuit", amount = 2}
            },
            result = repairCapsules
    })

    addEffectToTech("regeneration-turrets",
                    {
                        type = "unlock-recipe",
                        recipe = medicTurretItem
    })

    addEffectToTech("regeneration-turrets",
                    {
                        type = "unlock-recipe",
                        recipe = repairCapsules
    })


end

return medic
