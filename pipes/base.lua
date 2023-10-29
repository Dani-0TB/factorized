minetest.register_node(":factorized:pipe_base", {
    description = "test class for pipe nodes",
    groups = { crumbly = 1 },
    paramtype = "light",
    --drawtype = "glasslike",
    drawtype = "nodebox",
    node_box = {
        type = "connected",
        fixed = { {0.25, 0.25, 0.25, -0.25, -0.25, -0.25} },
        connect_top     = {{0.25, 0.5, 0.25, -0.25, -0.25, -0.25}},
        connect_bottom  = {{0.25, 0.25, 0.25, -0.25, -0.5, -0.25}},
        connect_front   = {{0.25, 0.25, 0.25, -0.25, -0.25, -0.5}},
        connect_left    = {{0.25, 0.25, 0.25, -0.5, -0.25, -0.25}},
        connect_back    = {{0.25, 0.25, 0.5, -0.25, -0.25, -0.25}},
        connect_right   = {{0.5, 0.25, 0.25, -0.25, -0.25, -0.25}},
    },
    connects_to = { "factorized:pipe_base" }, 
    tiles = { "dev_pipe.png" },
})