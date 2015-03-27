--µÚÊ®ÈıÕÂ
--Metatable Metamethed

require "CommonFunc"

--ÀûÓÃ +ÔËËã·ûÖ´ĞĞ¼¯ºÏ²¢²Ù×÷
Set={};

Set.mt={};

function Set.new(t)
	local set = {}
	setmetatable(set,Set.mt);
	for _,l in ipairs(t) do set[l] = true end
	return set;
end

function Set.union(a,b)
	local res = Set.new{};

	for k in pairs(a) do res[k] = true end;
	for k in pairs(b) do res[k] = true end;

	for i in pairs(res) do
		print("union i=",i,res[i])
	end

	return res;
end

function Set.tostring(set)
	local s = "{"
	local sep = ""
	for e in pairs(set) do
		s = s .. sep .. e
		sep = ", "
	end
	return s .. "}"
end

function Set.print(s)
	print(Set.tostring(s));
end



--ÕâÊ±ºòÀûÓÃSet.new´´½¨µÄËùÓĞ¼¯ºÏ¶¼ÓĞÍ¬Ò»¸ömetatable
s1 = Set.new{10,20,30,50};
s2 = Set.new{30,1};

print(getmetatable(s1));
print(getmetatable(s2));

Set.mt.__add = Set.union; --¸ømetatableÔö¼Ó__addº¯Êı

--[[
s3 = s1 + s2;

Set.print(s3);

--]]


--[[
¶ÔÓÚÃ¿Ò»¸öËãÊõÔËËã·û£¬metatable¶¼ÓĞ¶ÔÓ¦µÄÓòÃûÓëÆä¶ÔÓ¦£¬³ıÁË__add,__mulÍâ£¬
»¹ÓĞ__sub(¼õ),__div(³ı),__unm(¸º),__pow(Ãİ)£¬
ÎÒÃÇÒ²¿ÉÒÔ¶¨Òå__concat¶¨ÒåÁ¬½ÓĞĞÎª¡
-]]


--¼¯ºÏµÄËãÊõ²Ù×÷

--[[

__eq£¨µÈÓÚ£©£¬__lt£¨Ğ¡ÓÚ£©£¬ºÍ__le£¨Ğ¡ÓÚµÈÓÚ£©¸ø¹ØÏµÔËËã·û¸³ÓèÌØÊâµÄº¬Òå


--]]

--Ğ¡ÓÚµÈÓÚ
Set.mt.__le = function (a,b)
	print('-----le----')
	for k in pairs(a) do
		if not b[k] then return false end;
	end
	return true
end

--´óÓÚºÍĞ¡ÓÚ
Set.mt.__lt = function (a,b)
	print('-----lt----')
	return a <=b and not (b<=a)
end

--µÈÓÚ
Set.mt.__eq = function (a,b)
	print('-----eq----')
	return a <= b and b<=a
end


s1 = Set.new{2, 4}
s2 = Set.new{4, 10, 2}
--print(s1 <= s2) --> true
--print(s1 < s2) --> true
--print(s1 >= s1) --> true
--print(s1 > s1) --> false
print(s1 == s2) --> false


--print(s1 == s2 * s1) --> true

Window = {};

Window.mt={}; --metatable

--´°¿ÚµÄÔ­ĞÍ
Window.prototype = {x=0,y=0,width=100,height=100};

function Window.new(o)
	setmetatable(o,Window.mt);

	return o;
end;

--¶¨Òåindex metatable
Window.mt.__index = function (tab,key)

	return Window.prototype[key];
end;

w = Window.new{x=10,y=20};
print(w.width); -- w²»´æÔÚwidthÓò lua¾Í»áÍ¨¹ı__indexÓòµÄmetatable·ÃÎÊ __index metamethod»ñÈ¡È±ÉÙµÄÓò


--¸Ä±äÄ¬ÈÏÖµ

print("----------¸Ä±äÄ¬ÈÏÖµ-----------")

function setDefault(t,d)
	local mt = {__index = function () return d end}
	setmetatable(t,mt);
end

tab1 = {x=10,y=20}

print(tab1.x,tab1.z);
--Global.PrintTabKV(tab1)

setDefault(tab1,0);


print(tab1.x,tab1.z);

setDefault(tab1,100);


print(tab1.x,tab1.z);

--¼à¿Ø±í

print("-------------------++++++¼à¿Ø±í++++++----------------");

t = {};
local _t = t;

t = {};
--Í¨¹ımetatableµÄ__indexÓòºÍ__newindex·Ö±ğ¼à¿Ø tµÄ ·ÃÎÊºÍĞŞ¸Ä ²Ù×÷
local mt = {

	--·ÃÎÊÄ¬ÈÏÖµ
	__index = function (t,k)
		print("*access to element " .. tostring(k))
		return _t[k];
	end
	,
	--¸üĞÂÄ¬ÈÏÖµ
	__newindex = function (t,k,v)
		print("*update of element " .. tostring(k) .. " to " .. tostring(v))
		_t[k]=v;
	end

}

setmetatable(t,mt);

--t[2] = "hello"; --µ÷ÓÃ__newindexÓò

--print(t[2]) --µ÷ÓÃ__indexÓò

-- +++++++++++++++++++++++ ¸Ä½øºóµÄ¼à¿Ø±í²Ù×÷

print("-- +++++++++++++++++++++++ ¸Ä½øºóµÄ¼à¿Ø±í²Ù×÷")

local index = {};

t2 = {};

local mt2 = {

	--·ÃÎÊÄ¬ÈÏÖµ
	__index = function (t,k)
		print("*access to element " .. tostring(k))
		return t2[k];
	end
	,
	--¸üĞÂÄ¬ÈÏÖµ
	__newindex = function (t,k,v)
		print("*update of element " .. tostring(k) .. " to " .. tostring(v))
		t2[k]=v;
	end

}


function track(t)
	local proxy = {};
	proxy[index] = t2;
	setmetatable(proxy,mt2)
	return proxy

end


index = track(index);

index[3] = "aa";
print(index[3])

newTab={};

newTab=track(newTab)
newTab[3]="2222";
print(newTab[3])

print(index[3])

--´´½¨Ö»¶Á±í , ÒòÎªĞŞ¸Ä±íÖ÷ÒªÏµÍ¨¹ıÆä__newindexÓòĞŞ¸Ä£¬ËùÒÔÎÒÃÇÖ»ĞèÔÚ__newindexÓòÅ×³ö´íÎó¼´¿É

print("+++++++++--·µ»ØÒ»¸öÖ»¶Á±í++++++++++")
--·µ»ØÒ»¸öÖ»¶Á±í
function readyOnly(t)
	local proxy={};
	local mt = {
		__index=t;
		__newindex=function (t,k,v)
			error("attempt to update a ready-only table",2);
		end
	}
	setmetatable(proxy,mt);
	return proxy;

end

days=readyOnly{"Sunday","Monday","Tuesday","Wednesday"};

print(days[1])
days[2] = "Noday"; --Å×³ö´íÎó




