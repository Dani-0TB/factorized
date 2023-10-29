minetest.register_node(":facotrized:miner", {
  description = "miner",
  tiles = { "factorized_miner_tb.png",
            "factorized_miner_tb.png",
            "factorized_miner_s.png",
            "factorized_miner_s.png",
            "factorized_miner_s.png",
            "factorized_miner_f.png", -- front
          },
  groups = {oddly_breakable_by_hand = 3},
  paramtype2 = "facedir",
  on_construct = function(pos, node)
    local meta = minetest.get_meta(pos)
    meta:set_int("is_on", 0)
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
      minetest.chat_send_all("Miner on")
    else
      minetest.chat_send_all("Miner off")
    end
  end
})