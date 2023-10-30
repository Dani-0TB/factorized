

miner = {}

-- model
function miner.createBlank()
  local miner = {
    depth = 0,
    isOn = false
  }
  return miner
end

function miner.create(depth, isOn)
  local miner = {
    depth = depth,
    isOn = isOn
  }
  return miner
end

function miner.toggleIsOn(miner)
  miner.isOn = not miner.isOn
  return miner
end

--controller


--view
function miner.getNodeAtDepth(pos, miner)
  local nodePos = {x=pos.x, y=pos.y-miner.depth,z=pos.z}
  return minetest.get_node(nodePos)
end

function miner.setDrillHead(pos, miner)
  local nodePos = {x=pos.x, y=pos.y-miner.depth,z=pos.z}
  minetest.set_node(nodePos,{name="DrillHead"})
end

function miner.placeMiner(pos)
  local newMiner = miner.createBlank()
  local isOn = boolToNumber(newMiner.isOn)
  local meta = minetest.get_meta(pos)
  meta:set_int("depth", newMiner.depth)
  meta:set_int("isOn", isOn)
end

function miner.getMiner(pos)
  local meta = minetest.get_meta(pos)
  local depth = meta:get_int("depth")
  local isOn = meta:get_int("isOn")
  return miner.create(depth, numberToBool(isOn))
end

function miner.updateMiner(pos, miner)
  local isOn = boolToNumber(miner.isOn)
  local meta = minetest.get_meta(pos)
  meta:set_int("depth", miner.depth)
  meta:set_int("isOn", isOn)
end


function numberToBool(number)
  return not (number == 0)
end

function boolToNumber(bool)
  if bool then
    return 1
  else
    return 0
  end
end

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
  on_construct = function(pos)
    miner.placeMiner(pos)
  end,
  on_punch = function(pos,node,puncher,pointed_thing)
    local worldMiner = miner.getMiner(pos)
    local newMiner = miner.toggleIsOn(worldMiner)
    newMiner.depth = 0;
    miner.updateMiner(pos, newMiner)
    
    if worldMiner.isOn then
      minetest.chat_send_all("Miner is ON")
      local timer = minetest.get_node_timer(pos)
      timer:start(2)
    else

      minetest.chat_send_all("Miner is OFF")
    end
  end,
  on_timer = function(pos)
    local timer = minetest.get_node_timer(pos)
    local worldMiner = miner.getMiner(pos)
    worldMiner.depth = 0;
    if worldMiner.isOn then
      --mining controller
      worldMiner.depth = worldMiner.depth + 1
      local nodeAtDepth = miner.getNodeAtDepth(pos, worldMiner)
      
      while nodeAtDepth.name == "air" or nodeAtDepth.name == "factorized:miner_drill_head" do
        if nodeAtDepth.name == "air" then
          miner.setDrillHead(pos, worldMiner)
          worldMiner.depth = worldMiner.depth + 1
        end
        if nodeAtDepth.name == "factorized:miner_drill_head" then
          worldMiner.depth = worldMiner.depth + 1
        end
        nodeAtDepth = miner.getNodeAtDepth(pos, worldMiner)
      end

      miner.setDrillHead(pos, worldMiner)
      minetest.chat_send_all("Mined: "..nodeAtDepth.name)
      miner.updateMiner(pos, worldMiner)
      
      timer:start(5.0)
    end
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
