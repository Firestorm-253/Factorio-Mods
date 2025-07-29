local nuke = require("scripts/Nuke")
local projectiles = require("scripts/Projectiles")

script.on_event(defines.events.on_tick, nuke.handle_explosions)
script.on_event(defines.events.on_script_trigger_effect, nuke.trigger_explosion)
