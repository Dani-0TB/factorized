factorized = {}

-- Toggle a boolean value
factorized.toggleOn = function(boolean)
  if boolean == 0 then
    return 1
  else
    return 0
  end
end

mod_path = minetest.get_modpath("factorized")

-- Dev Blocks
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

dofile(mod_path.."/machines/header.lua")