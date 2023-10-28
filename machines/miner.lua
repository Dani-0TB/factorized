minetest.register_node(":facotrized:miner", {
  description = "miner",
  tiles = { "factorized_miner_tb.png",
            "factorized_miner_tb.png",
            "factorized_miner_s.png",
            "factorized_miner_s.png",
            "factorized_miner_s.png",
            "factorized_miner_f.png",
          },
  groups = {oddly_breakable_by_hand = 3},
  paramtype2 = "facedir"
})