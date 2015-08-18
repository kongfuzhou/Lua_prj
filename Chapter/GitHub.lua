-- ²âÊÔ github
local w = nil

w = w or 100

print(w)

local str = "0x0"

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


function utfstrlen(str)
	local len = #str;
	local left = len;
	local cnt = 0;
	local arr={0,0xc0,0xe0,0xf0,0xf8,0xfc};
	while left ~= 0 do
	local tmp=string.byte(str,-left);
	local i=#arr;
	while arr[i] do
	if tmp>=arr[i] then left=left-i;break;end
	i=i-1;
	end
	cnt=cnt+1;
	end
	return cnt;
end


