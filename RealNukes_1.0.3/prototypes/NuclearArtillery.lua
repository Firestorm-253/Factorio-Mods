local artillery = {}

local sounds = require("__base__.prototypes.entity.sounds")

local recipeUtils = require("utils/RecipeUtils")
local technologyUtils = require("utils/TechnologyUtils")
local projectileUtils = require("utils/ProjectileUtils")
local ammoUtils = require("utils/AmmoUtils")

local makeAmmo = ammoUtils.makeAmmo
local addEffectToTech = technologyUtils.addEffectToTech
local makeArtilleryShell = projectileUtils.makeArtilleryShell
local makeRecipe = recipeUtils.makeRecipe

local nuke = require("__RealNukes__/scripts/Nuke")

local MAX_REPETITIONS = 1000



local function makeNuclearArtilleryShellAmmo(W, ingredients, energy_required, crafting_category, tech, icon)
	local radius_factor = nuke.calculateRadiusScaling(260, W)
	
    local nuclearArtilleryShellAmmo = makeAmmo({
            name = string.format("nuclear-artillery-%dT", W),
            icon = icon,
            order = "d[explosive-cannon-shell]-d[nuclear]",
            magSize = 1,
            stackSize = 1,
			ammo_category = "artillery-shell",			
            ammoType = {
                category = "artillery-shell",
                target_type = "position",
                action =
                    {
                        type = "direct",
                        action_delivery =
                            {
                                type = "artillery",
                                projectile = makeArtilleryShell(
                                    {
                                        name = string.format("nuclear-%dT", W)
                                    },
                                    {
                                        type = "direct",
                                        action_delivery =
                                            {
                                                type = "instant",
                                                target_effects =
                                                    {
														{
															type      = "script",
															effect_id = string.format("my-custom-nuke-explosion-effect-%dT", W)
														},
                                                        {
                                                            type = "set-tile",
                                                            tile_name = "nuclear-ground",
                                                            radius = 12 * radius_factor,
                                                            apply_projection = true,
                                                            tile_collision_mask = {layers={water_tile = true}},
                                                        },
                                                        {
                                                            type = "destroy-cliffs",
                                                            radius = 9 * radius_factor,
                                                            explosion = "explosion"
                                                        },
                                                        {
                                                            type = "create-entity",
                                                            entity_name = "nuke-explosion"
                                                        },
                                                        {
                                                            type = "camera-effect",
                                                            effect = "screen-burn",
                                                            duration = math.min(255, 60 * radius_factor),
                                                            ease_in_duration = 5,
                                                            ease_out_duration = 60,
                                                            delay = 0,
                                                            strength = 6,
                                                            full_strength_max_distance = 200 * radius_factor,
                                                            max_distance = 800 * radius_factor
                                                        },
                                                        {
                                                            type = "play-sound",
                                                            sound = sounds.nuclear_explosion(0.9),
                                                            play_on_target_position = false,
                                                            -- min_distance = 200,
                                                            max_distance = 1000 * radius_factor,
                                                            -- volume_modifier = 1,
                                                            audible_distance_modifier = 3
                                                        },
                                                        {
                                                            type = "play-sound",
                                                            sound = sounds.nuclear_explosion_aftershock(0.4),
                                                            play_on_target_position = false,
                                                            -- min_distance = 200,
                                                            max_distance = 1000 * radius_factor,
                                                            -- volume_modifier = 1,
                                                            audible_distance_modifier = 3
                                                        },
                                                        {
                                                            type = "create-entity",
                                                            entity_name = "huge-scorchmark",
                                                            check_buildability = true,
                                                        },
                                                        {
                                                            type = "invoke-tile-trigger",
                                                            repeat_count = 1,
                                                        },
                                                        {
                                                            type = "destroy-decoratives",
                                                            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
                                                            include_decals = true,
                                                            invoke_decorative_trigger = true,
                                                            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
                                                            radius = 14 * radius_factor -- large radius for demostrative purposes
                                                        },
                                                        {
                                                            type = "create-decorative",
                                                            decorative = "nuclear-ground-patch",
                                                            spawn_min_radius = 11.5,
                                                            spawn_max_radius = 12.5,
                                                            spawn_min = 30,
                                                            spawn_max = 40,
                                                            apply_projection = true,
                                                            spread_evenly = true
                                                        },
														--[[{
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    target_entities = true,
                                                                    trigger_from_target = true,
                                                                    radius = 2 * radius_factor,
                                                                    action_delivery =
																		{
																			type = "projectile",
																			projectile    = "nuke-delay-proj-R2-W" .. W,
                                                                            starting_speed = 0.5 * 0.65,
                                                                            starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
																		},
                                                                }
                                                        },
														{
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    target_entities = true,
                                                                    trigger_from_target = true,
                                                                    radius = 4 * radius_factor,
                                                                    action_delivery =
																		{
																			type = "projectile",
																			projectile    = "nuke-delay-proj-R4-W" .. W,
                                                                            starting_speed = 0.5 * 0.65,
                                                                            starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
																		},
                                                                }
                                                        },
														{
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    target_entities = true,
                                                                    trigger_from_target = true,
                                                                    radius = 7 * radius_factor,
                                                                    action_delivery =
																		{
																			type = "projectile",
																			projectile    = "nuke-delay-proj-R7-W" .. W,
                                                                            starting_speed = 0.5 * 0.65,
                                                                            starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
																		},
                                                                }
                                                        },
														{
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    target_entities = true,
                                                                    trigger_from_target = true,
                                                                    radius = 9 * radius_factor,
                                                                    action_delivery =
																		{
																			type = "projectile",
																			projectile    = "nuke-delay-proj-R9-W" .. W,
                                                                            starting_speed = 0.5 * 0.65,
                                                                            starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
																		},
                                                                }
                                                        },
														{
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    target_entities = true,
                                                                    trigger_from_target = true,
                                                                    radius = 15 * radius_factor,
                                                                    action_delivery =
																		{
																			type = "projectile",
																			projectile    = "nuke-delay-proj-R15-W" .. W,
                                                                            starting_speed = 0.5 * 0.65,
                                                                            starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
																		},
                                                                }
                                                        },
														{
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    target_entities = true,
                                                                    trigger_from_target = true,
                                                                    radius = 23 * radius_factor,
                                                                    action_delivery =
																		{
																			type = "projectile",
																			projectile    = "nuke-delay-proj-R23-W" .. W,
                                                                            starting_speed = 0.5 * 0.65,
                                                                            starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
																		},
                                                                }
                                                        },
														{
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    target_entities = true,
                                                                    trigger_from_target = true,
                                                                    radius = 35 * radius_factor,
                                                                    action_delivery =
																		{
																			type = "projectile",
																			projectile    = "nuke-delay-proj-R35-W" .. W,
                                                                            starting_speed = 0.5 * 0.65,
                                                                            starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
																		},
                                                                }
                                                        },]]
														
                                                        --[[{
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    show_in_tooltip = false,
                                                                    target_entities = false,
                                                                    trigger_from_target = true,
                                                                    repeat_count = math.min(MAX_REPETITIONS, 1000 * (radius_factor ^ 2)),
                                                                    radius = 26 * radius_factor,
                                                                    action_delivery =
                                                                        {
                                                                            type = "projectile",
                                                                            projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                                                                            starting_speed = 0.5 * 0.7,
                                                                            starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
                                                                        }
                                                                }
                                                        },
                                                        {
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    show_in_tooltip = false,
                                                                    target_entities = false,
                                                                    trigger_from_target = true,
                                                                    repeat_count = math.min(MAX_REPETITIONS, 700 * (radius_factor ^ 2)),
                                                                    radius = 4 * radius_factor,
                                                                    action_delivery =
                                                                        {
                                                                            type = "projectile",
                                                                            projectile = "atomic-bomb-wave-spawns-fire-smoke-explosion",
                                                                            starting_speed = 0.5 * 0.65,
                                                                            starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
                                                                        }
                                                                }
                                                        },
                                                        {
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    show_in_tooltip = false,
                                                                    target_entities = false,
                                                                    trigger_from_target = true,
                                                                    repeat_count = math.min(MAX_REPETITIONS, 1000 * (radius_factor ^ 2)),
                                                                    radius = 8,-- * radius_factor,
                                                                    action_delivery =
                                                                        {
                                                                            type = "projectile",
                                                                            projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
                                                                            starting_speed = 0.5 * 0.65,
                                                                            starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
                                                                        }
                                                                }
                                                        },
                                                        {
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    show_in_tooltip = false,
                                                                    target_entities = false,
                                                                    trigger_from_target = true,
                                                                    repeat_count = math.min(MAX_REPETITIONS, 300 * (radius_factor ^ 2)),
                                                                    radius = 26 * radius_factor,
                                                                    action_delivery =
                                                                        {
                                                                            type = "projectile",
                                                                            projectile = "atomic-bomb-wave-spawns-nuclear-smoke",
                                                                            starting_speed = 0.5 * 0.65,
                                                                            starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
                                                                        }
                                                                }
                                                        },
                                                        {
                                                            type = "nested-result",
                                                            action =
                                                                {
                                                                    type = "area",
                                                                    show_in_tooltip = false,
                                                                    target_entities = false,
                                                                    trigger_from_target = true,
                                                                    repeat_count = math.min(MAX_REPETITIONS, 10 * (radius_factor ^ 2)),
                                                                    radius = 8 * radius_factor,
                                                                    action_delivery =
                                                                        {
                                                                            type = "instant",
                                                                            target_effects =
                                                                                {
                                                                                    {
                                                                                        type = "create-entity",
                                                                                        entity_name = "nuclear-smouldering-smoke-source",
                                                                                        tile_collision_mask = {layers={water_tile = true}}
                                                                                    }
                                                                                }
                                                                        }
                                                                }
                                                        }]]
                                                    }
                                            }
                                }),
                                starting_speed = 1,
                                direction_deviation = 0,
                                range_deviation = 0,
                                source_effects =
                                    {
                                        type = "create-explosion",
                                        entity_name = "artillery-cannon-muzzle-flash"
                                    },
                            }
                    },
            }
    })

    makeRecipe({
		name = nuclearArtilleryShellAmmo,
		icon = icon,
		enabled = false,
		category = crafting_category,
		ingredients = ingredients,
		result = nuclearArtilleryShellAmmo,
		energy_required = energy_required
    })

    addEffectToTech(tech,
	{
		type = "unlock-recipe",
		recipe = nuclearArtilleryShellAmmo,
    })
end


makeNuclearArtilleryShellAmmo(
	260,
	{
		{type = "item", name = "artillery-shell", amount = 1},
		{type = "item", name = "atomic-bomb", amount = 1}
	},
	50,
	"crafting",
	"atomic-bomb",
	"__RealNukes__/graphics/icons/nuclear-artillery-shell.png"
)

makeNuclearArtilleryShellAmmo(
	10000,
	{
		{type = "item", name = "artillery-shell", amount = 1},
		{type = "item", name = "atomic-bomb", amount = 1},
		{type = "item", name = "fusion-power-cell", amount = 1000},
		{type = "item", name = "quantum-processor", amount = 10},
		{type = "item", name = "carbon-fiber", amount = 100},
		{type = "item", name = "tungsten-plate", amount = 100},
		{type = "item", name = "superconductor", amount = 100},
		{type = "fluid", name = "fluoroketone-cold", amount = 50}
	},
	360,
	"cryogenics",
	"fusion-reactor",
	"__RealNukes__/graphics/icons/fusion-artillery-shell.png"
)
