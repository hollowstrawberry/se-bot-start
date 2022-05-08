function se_simple_bot_start_run (event)
	local player = game.players[event.player_index]
	
	if (player.controller_type==defines.controllers.character) then
		local items
		local armor

		items = {
			{"power-armor", 1},
			{"construction-robot", 50},
		}
		armor = {
			{"se-rtg-equipment"},
			{"personal-roboport-equipment"},
			{"battery-equipment"},
			{"personal-roboport-equipment"},
			{"battery-equipment"},
			{"night-vision-equipment"},
			{"se-adaptive-armour-equipment-1"},
			{"personal-roboport-equipment"},
			{"battery-equipment"},
			{"belt-immunity-equipment"},
			{"solar-panel-equipment"},
			{"solar-panel-equipment"},
			{"solar-panel-equipment"},
			{"solar-panel-equipment"},
			{"solar-panel-equipment"},
			{"solar-panel-equipment"},
		}

		for i, v in pairs(items) do
			player.insert{name = v[1], count = v[2]}
		end

		local grid = player.get_inventory(defines.inventory.character_armor)[1].grid
		for  i, v in pairs(armor) do
			grid.put({name = v[1]})
		end

		player.force.technologies["worker-robots-speed-1"].researched = true
		player.force.technologies["worker-robots-speed-2"].researched = true
	end
end

script.on_event(defines.events.on_player_created, se_simple_bot_start_run)
script.on_event(defines.events.on_cutscene_cancelled, se_simple_bot_start_run)