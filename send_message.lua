-- Example send_message.lua (simplified)
local message = ngx.var.arg_messageInput

-- Store message in database (pseudocode)
if message then
    -- Store message in chatroom database
    ngx.say("Message sent!")
else
    ngx.say("Message sending failed.")
end
