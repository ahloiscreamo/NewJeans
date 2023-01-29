-- based on https://github.com/rohieb/mpv-notify
-- https://unix.stackexchange.com/a/455198/119298
lastcommand = nil
function string.shellescape(str)
   return "'"..string.gsub(str, "'", "'\"'\"'").."'"
end
function do_notify(a,b)
-- local command = ("notify-send -a mpv -- %s %s %s"):format(a:shellescape(), 
    local command = ("/home/ahloi/.config/mpv/mpvnp"):format(b:shellescape())
   if command ~= lastcommand then
      os.execute(command)
      lastcommand = command
   end
end
function notify_current_track()
   data = mp.get_property_native("metadata")
   if data then
      local artist = (data["ARTIST"] or data["artist"] or " ")
      local title = (data["TITLE"] or data["title"] or " ")
      if artist..title~="  " then
         do_notify(artist, title)
         return
      end
   end
   local data = mp.get_property("path")
   if data then
      local file = data:gsub("^.-([^/]+)$","%1")
      file = file:gsub("%....$","") -- delete 3 char suffix
      local dir = data:gsub("^.-([^/]+)/[^/]*$","%1")
      do_notify(dir, file)
   end
end

mp.register_event("file-loaded", notify_current_track)

