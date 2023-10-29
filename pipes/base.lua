minetest.register_node(":factorized:pipe_base", {
    description = "test class for pipe nodes",
    groups = { crumbly = 1 },
    --drawtype = "glasslike",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {0.25, 0.25, 0.25, -0.25, -0.25, -0.25}
        },
        --connect_top     = 
        --connect_bottom  = 
        --connect_front   = 
        --connect_left    = 
        --connect_back    = 
        --connect_right   = 
    },
    tiles = { "dev_pipe.png" },
})