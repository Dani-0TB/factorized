miner = {}

minetest.register_node(":factorized:miner", {
  description = "Mining Drill",
  tiles = { "factorized_miner_tb.png",
            "factorized_miner_tb.png",
            "factorized_miner_s.png",
            "factorized_miner_s.png",
            "factorized_miner_s.png",
            "factorized_miner_f.png", -- front
          },
  groups = {oddly_breakable_by_hand = 3},
  is_ground_content=false,
  paramtype2 = "facedir",
  on_construct = function(pos, node)
    local meta = minetest.get_meta(pos)
    meta:set_int("is_on", 0)
    meta:set_int("depth", 1)
    if (is_on == 0) then
      minetest.chat_send_all("Miner on")
    else
      minetest.chat_send_all("Miner off")
    end
  end,
  on_punch = function(pos,node,puncher,pointed_thing)
    local meta = minetest.get_meta(pos)
    local is_on = meta:get_int("is_on")
    meta:set_int("is_on", factorized.toggleOn(is_on))
    if (is_on == 0) then
      local timer = minetest.get_node_timer(pos)
      timer:start(5.0)
      minetest.chat_send_all("Miner on")
      
    else
      minetest.chat_send_all("Miner off")
    end
  end,
  on_timer = function(pos)
    local meta = minetest.get_meta(pos)
    if (meta:get_int("is_on") == 0) then
      return
    end
    local depth = meta:get_int("depth")
    local drill_pos = {x = pos.x, y = pos.y - depth, z = pos.z}
    minetest.set_node(drill_pos, {name="DrillHead"})
    depth = depth + 1
    meta:set_int("depth", depth)
    local timer = minetest.get_node_timer(pos)
    timer:start(5.0)
  end
})

minetest.register_node(":factorized:miner_drill_head", {
  description = "Drill Head",
  tiles = { "factorized_drill_tb.png",
            "factorized_drill_tb.png",
            "factorized_drill_s.png",
            "factorized_drill_s.png",
            "factorized_drill_s.png",
            "factorized_drill_s.png", -- front
          },
  groups = {oddly_breakable_by_hand = 3},
  is_ground_content = false,
  in_creative_inventory = false
})

minetest.register_craft({
  output = "factorized:miner",
  recipe = {
    {"steel_ingot","steel_ingot","steel_ingot"},
    {"steel_ingot","SteelPick","steel_ingot"},
    {"steel_ingot","steel_ingot","steel_ingot"}
  }
})