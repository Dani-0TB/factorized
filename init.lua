dofile(minetest.get_modpath("factorized").."/machines/miner.lua")

minetest.register_node(":facotirez:dev_fd", {
  description = "dev facedir",
  tiles = { "dev_ypos.png",
            "dev_yneg.png",
            "dev_xpos.png",
            "dev_xneg.png",
            "dev_zpos.png",
            "dev_zneg.png", -- front
          },
  groups = {oddly_breakable_by_hand = 3},
  paramtype2 = "facedir"
})

minetest.register_node(":facotirez:dev_nfd", {
  description = "dev NO facedir",
  tiles = { "dev_ypos.png",
            "dev_yneg.png",
            "dev_xpos.png",
            "dev_xneg.png",
            "dev_zpos.png",
            "dev_zneg.png", -- front
          },
  groups = {oddly_breakable_by_hand = 3},
})