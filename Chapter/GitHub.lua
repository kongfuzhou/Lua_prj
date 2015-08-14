-- ≤‚ ‘ github
local w = nil

w = w or 100

print(w)

local str = "0xFFFFFF"

print(string.format("%d",str))

str ="16777215"

local ret=string.format("%#x",str)

print(ret)

print(string.gsub(ret,"0x","#"))


function c3bToHex(c3b)
	local hex = "#"
	hex = hex..dNumToHex(c3b.r)..dNumToHex(c3b.g)..dNumToHex(c3b.b)
	return hex
end

function dNumToHex(num)
	local temp = string.lower(string.format("%#x",num))
	temp = string.gsub(temp,"0x","")
	return temp
end


local color = c3bToHex({r=255,g=100,b=25})

print("color=",color)


