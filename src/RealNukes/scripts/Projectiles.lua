local projectiles = {}

local nuke_shockwave_speed_dev = 0

projectiles.ring_defs = {
  {
    type          = "projectile",
    base_radius= 26,
    density       = 1000,
    name          = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
    speed_factor  = 0.5 * 0.7
  },
  {
    type          = "projectile",
    base_radius   = 4,
    density       = 700,
    name          = "atomic-bomb-wave-spawns-fire-smoke-explosion",
    speed_factor  = 0.5 * 0.65
  },
  {
    type          = "projectile",
    base_radius   = 8,
    density       = 1000,
    name          = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
    speed_factor  = 0.5 * 0.65
  },
  {
    type          = "projectile",
    base_radius   = 26,
    density       = 300,
    name          = "atomic-bomb-wave-spawns-nuclear-smoke",
    speed_factor  = 0.5 * 0.65
  },
  {
    type          = "instant",
    base_radius   = 8,
    density       = 10,
    name          = "nuclear-smouldering-smoke-source"
  }
}

function projectiles.spawn_ring(surface, center, radius_tiles, count, def, speed_dev)
	--game.print(def.name)
  for _ = 1, count do
    -- pick a random direction
    local v = 2 * math.pi * math.random()
    -- choose a random distance inside the circle
    local r_inner = radius_tiles * math.sqrt(math.random())
    -- compute a spawn target on the *edge*
    local target_pos = {
      x = center.x + radius_tiles * math.cos(v),
      y = center.y + radius_tiles * math.sin(v)
    }
    -- you can ignore r_inner if you want them all to start exactly at center:
    -- spawn all at center:
    local spawn_pos = { x = center.x, y = center.y }

	--game.print(string.format("%s, (%f, %f), (%f, %f), %f, %f", def.name, spawn_pos["x"], spawn_pos["y"], target_pos["x"], target_pos["y"], def.speed_factor, radius_tiles))
    if def.type == "projectile" then
      surface.create_entity{
        -- projectile prototypes ignore “type” key here
        name            = def.name,
        position        = spawn_pos,
        target = target_pos,
        force           = "neutral",
        speed           = def.speed_factor,
        speed_deviation = speed_dev or 0,
        max_range       = radius_tiles
      }
    else
      -- instant‑create is unchanged
      surface.create_entity{
        name                = def.name,
        position            = {
          x = center.x + r_inner * math.cos(v),
          y = center.y + r_inner * math.sin(v)
        },
        force               = "neutral",
        tile_collision_mask = { layers = { "water-tile" } }
      }
    end
  end
end


return projectiles
