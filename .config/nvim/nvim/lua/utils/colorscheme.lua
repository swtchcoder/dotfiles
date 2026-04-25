return function()
	local hour = tonumber(os.date("%H"))
	if hour >= 7 and hour < 19 then
		return "ayu-mirage"
	else
		return "moonfly"
	end
end
