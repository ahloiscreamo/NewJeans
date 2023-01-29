local utils = require 'mp.utils'

local pid = utils.getpid()

local function center_floating_mpv()
   mpv_window_id = io.popen("xdotool search --pid " .. pid):read()

   -- mpv can have a slight delay in launching a window, or be called without one at all
   if mpv_window_id == nil then return end

   floating = io.popen("xprop -id " .. mpv_window_id):read("*a")
   if string.match(floating, "FLOATING") then
      os.execute("i3-msg -q '[id=" .. mpv_window_id  .. "]' move position center")
   end
end

mp.register_event("playback-restart", center_floating_mpv)
-- mpv should still be centered when fullscreen is toggled
mp.observe_property("fullscreen", "bool", center_floating_mpv)

