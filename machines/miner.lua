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
    minetest.chat_send_all("node hp: ".. meta:get_int("hp"))
  end,
  on_punch = function(pos,node,puncher,pointed_thing)
    local meta = minetest.get_meta(pos)
    local hp = meta:get_int("hp")
    hp = hp - 1
    meta:set_int("hp", hp)
    minetest.chat_send_all("node hp: ".. meta:get_int("hp"))
    if hp < 1 then
      minetest.set_node(pos, {name="air"})
    end
  end
})