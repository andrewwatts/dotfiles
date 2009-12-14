on run {MyTTY, MySettingsName}
	set TTYTab to my find_tab_for_tty(MyTTY)
	if TTYTab is missing value then
		return -- Bail if we got confused rather than making it worse
	end if
	
	tell application "Terminal"
		try
			-- Radar 7056159 Terminal's id-based reference for for 'setting set' seems broken
			-- This was working before, but for now, use a reference form to avoid the problem.
			set MySettings to a reference to settings set MySettingsName
		on error
			set MySettings to default settings -- use default settings if the name is bogus
		end try
		
		set current settings of TTYTab to MySettings
	end tell
	
end run

on find_tab_for_tty(MyTTY)
	-- Find the window/tab that has this tty.  Could use an application->tab relationship or possibbly a 'find tab by tty' command of some sort.
	tell application "Terminal"
		set MyWindowCount to count of windows
		repeat with MyWindowIndex from 1 to MyWindowCount
			set MyWindow to window MyWindowIndex
			try
				set MyTabCount to count of tabs of MyWindow
			on error
				set MyTabCount to 0 -- a non-Terminal window?
			end try
			repeat with MyTabIndex from 1 to MyTabCount
				set MyTab to tab MyTabIndex of MyWindow
				if MyTTY is (tty of MyTab) then
					return MyTab
				end if
			end repeat
		end repeat
	end tell
	
	return missing value
end find_tab_for_tty
