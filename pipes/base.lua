minetest.register_node(":factorized:pipe_base", {
    description = "test class for pipe nodes",
    groups = { crumbly = 1 },
    paramtype = "light",
    drawtype = "nodebox",
    node_box = {
        type = "connected",
        -- for every 'connect_x' it makes four planes depending on the direction
        -- simmulating a square of four faces, aka, a tube
        connect_top     = {
            { 0.25, 0.5, 0.25,-0.25, 0.25, 0.25},
            { 0.25, 0.5, 0.25, 0.25, 0.25,-0.25},
            {-0.25, 0.5,-0.25,-0.25, 0.25, 0.25},
            {-0.25, 0.5,-0.25, 0.25, 0.25,-0.25},
        },
        connect_bottom  = {
            { 0.25,-0.5, 0.25,-0.25,-0.25, 0.25},
            { 0.25,-0.5, 0.25, 0.25,-0.25,-0.25},
            {-0.25,-0.5,-0.25,-0.25,-0.25, 0.25},
            {-0.25,-0.5,-0.25, 0.25,-0.25,-0.25},
        },
        connect_front   = {
            { 0.25, 0.25,-0.5,-0.25, 0.25,-0.25,},
            { 0.25, 0.25,-0.5, 0.25,-0.25,-0.25,},
            {-0.25,-0.25,-0.5,-0.25, 0.25,-0.25,},
            {-0.25,-0.25,-0.5, 0.25,-0.25,-0.25,},
        },
        connect_left    = {
            {-0.5, 0.25, 0.25,-0.25,-0.25, 0.25},
            {-0.5, 0.25, 0.25,-0.25, 0.25,-0.25},
            {-0.5,-0.25,-0.25,-0.25,-0.25, 0.25},
            {-0.5,-0.25,-0.25,-0.25, 0.25,-0.25},
        },
        connect_back    = {
            { 0.25, 0.25, 0.5,-0.25, 0.25, 0.25},
            { 0.25, 0.25, 0.5, 0.25,-0.25, 0.25},
            {-0.25,-0.25, 0.5,-0.25, 0.25, 0.25},
            {-0.25,-0.25, 0.5, 0.25,-0.25, 0.25},
        },
        connect_right   = {
            {0.5, 0.25, 0.25, 0.25,-0.25, 0.25},
            {0.5, 0.25, 0.25, 0.25, 0.25,-0.25},
            {0.5,-0.25,-0.25, 0.25,-0.25, 0.25},
            {0.5,-0.25,-0.25, 0.25, 0.25,-0.25},
        },
        -- for every 'disconnect_x' it makes a single plane for the axis it belongs
        disconnected_top    = {{ 0.25, 0.25, 0.25,-0.25, 0.25,-0.25}},
        disconnected_bottom = {{ 0.25,-0.25, 0.25,-0.25,-0.25,-0.25}},
        disconnected_front  = {{-0.25, 0.25,-0.25, 0.25,-0.25,-0.25}},
        disconnected_left   = {{-0.25, 0.25, 0.25,-0.25,-0.25,-0.25}},
        disconnected_back   = {{ 0.25, 0.25, 0.25,-0.25,-0.25, 0.25}},
        disconnected_right  = {{ 0.25, 0.25, 0.25, 0.25,-0.25,-0.25}},
    },
    connects_to = { "factorized:pipe_base" }, 
    tiles = { "pipe_minimalist.png" },
})