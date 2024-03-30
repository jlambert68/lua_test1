local function getOS()
    if os.getenv("WINDIR") then
        return "Windows"
    elseif os.getenv("HOME") then
        return "Unix-like"
    else
        return "Unknown"
    end
end

local osType = getOS()
print("Operating System:", osType)
