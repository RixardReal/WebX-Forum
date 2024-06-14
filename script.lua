-- Assuming this is part of your OpenResty configuration file

-- Handle HTTP requests
location /chat {
    content_by_lua_block {
        -- Lua code to handle chat logic
        ngx.header.content_type = "text/html; charset=utf-8"

        -- Initial username (default to "Anonymous")
        local username = "Anonymous"

        -- Retrieve posted message from request body
        ngx.req.read_body()
        local data = ngx.req.get_body_data()
        local message = data and ngx.unescape_uri(data) or ""

        -- Process message (save to database, etc.)
        if message ~= "" then
            -- Example: Save message to a file
            local file = io.open("/path/to/chatlog.txt", "a")
            if file then
                file:write(username .. ": " .. message .. "\n")
                file:close()
            end
        end

        -- Example response (can be HTML with chat messages)
        ngx.say("Message received: " .. message)
    }
}
