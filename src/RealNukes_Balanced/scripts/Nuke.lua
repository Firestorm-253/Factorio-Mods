local projectiles = require("scripts/Projectiles")

local nuke = {}

local function calculateRadiusScaling(W_base, W_new)
	return (W_new / W_base)^(1/3)
end
nuke.calculateRadiusScaling = calculateRadiusScaling

local function calculateBlastDamage(r, W)
	base_damage = 5000 * 15
	factor_energy = W^(1.4 / 3)
	
	--factor_distance = (1 / math.max(r, 1))^1.4
	--factor_distance = 1 / (1 + (1 / 0.95)^r)
	factor_distance = (1 / (math.max(r, 1) + 1))^1.4
	
	--game.print(string.format("factor_distance: %f", factor_distance))
	--game.print(string.format("factor_energy: %f", factor_energy))
	
	--return base_damage * factor_energy * factor_distance
	return math.max(0, (base_damage * factor_energy * factor_distance) - 1500)
end

local function calculateRingDamage(r_inner, r_outer, energy)
    local damage = r_outer
		and (calculateBlastDamage(r_inner, energy) - calculateBlastDamage(r_outer, energy))
		or  calculateBlastDamage(r_inner, energy) -- last ring gets all remaining energy
	return damage
end

local function trigger_fusion_explosion(energy, radius_factor, surface, center_pos, firing_force, firing_turret)
	--game.print(string.format("trigger_fusion_explosion %dT TNT", energy))
	
	table.insert(global.pending_explosions, {
		surface = surface,
		position = center_pos,
		firing_force = firing_force,
		firing_turret = firing_turret,
		start_tick = game.tick,
		current_ring = 1,
		ring_step = 1,
		energy = energy,
		radius_factor = radius_factor,
		tick_interval = 5,  -- how many ticks between rings
		last_processed_tick = game.tick,
	})
	

	-- Example dynamic radius_factor (you’d compute from your yield)
	local radius_factor = 1.25  

	for _, def in ipairs(projectiles.ring_defs) do
		local radius_tiles = def.base_radius * radius_factor
		local count = math.min(
		  1000,
		  def.density * (radius_factor ^ 2)
		)
		projectiles.spawn_ring(surface, center_pos, radius_tiles, count, def, 0)
	end
end

function nuke.handle_explosions(event)
  if not global then
    --game.print("Warning: global is nil at on_tick!")
    global = {}
  end
  if not global.pending_explosions then
    --game.print("Initializing pending_explosions")
    global.pending_explosions = {}
  end

  if not global.pending_explosions then return end

  for i = #global.pending_explosions, 1, -1 do
    local e = global.pending_explosions[i]

	local ammo_bonus = e.firing_force.get_ammo_damage_modifier("artillery-shell") or 0
	local turret_bonus = e.firing_force.get_turret_attack_modifier(e.firing_turret)    or 0
	local bonus = ammo_bonus + turret_bonus
	final_dmg = nil
	
	--game.print(string.format("bonus: %f", bonus))
	
    if event.tick - e.last_processed_tick >= e.tick_interval then
		local r_inner = (e.current_ring - 1) * e.ring_step * e.radius_factor
		local r_outer = e.current_ring * e.ring_step * e.radius_factor

		local area = {
			{e.position.x - r_outer, e.position.y - r_outer},
			{e.position.x + r_outer, e.position.y + r_outer}
		}

		local entities = e.surface.find_entities_filtered{area = area}
		for _, entity in pairs(entities) do
			if entity.valid and entity.health then
			  local dx = entity.position.x - e.position.x
			  local dy = entity.position.y - e.position.y
			  local distance = math.sqrt(dx * dx + dy * dy)
			  
			  if distance >= r_inner and distance < r_outer then
				local dmg = calculateBlastDamage((r_inner + r_outer) / 2, e.energy)
				final_dmg = dmg * (1 + bonus)
				
				--game.print(string.format("ring-damage (%d, %d): %d -> %d", r_inner, r_outer, dmg, final_dmg))
				
				if entity.valid and entity.health and entity.health > 0 then
					entity.damage(final_dmg, e.firing_force.name, "explosion")
				end
			  end
			end
		end

		e.current_ring = e.current_ring + 1
		e.last_processed_tick = event.tick

		if final_dmg and final_dmg < 100 then
			--game.print("removed")
			--game.print(final_dmg)
			table.remove(global.pending_explosions, i)
		end
    end
  end
end

function nuke.trigger_explosion(event)
	--game.print("on_script_trigger_effect")
	--game.print(string.format("Id: %s", event.effect_id))

	local src = event.source_entity
	local firing_force = (src and src.valid) and src.force or game.forces.player

	if event.effect_id == "my-custom-nuke-explosion-effect-260T" then
		trigger_fusion_explosion(
			260,
			calculateRadiusScaling(260, 260),
			event.source_entity.surface,
			event.target_position,
			firing_force,
			src
		)
	elseif event.effect_id == "my-custom-nuke-explosion-effect-10000T" then
		trigger_fusion_explosion(
			10000,
			calculateRadiusScaling(260, 10000),
			event.source_entity.surface,
			event.target_position,
			firing_force,
			src
		)
	end
end

return nuke
