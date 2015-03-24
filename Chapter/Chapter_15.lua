--15�� ��

--Lua��Ҫ��ͨ����������package

require "packageTest"
require "packageTest1"


packageTest.sayHello();
packageTest1.sayNow();

local P = {};

complex = P;

--����˽�к��� ͨ��local�ؼ�������ʵ��
local function checkComplex(c)
	if not (type(c) == "table") and tonumber(c.r) and tonumber(c.i) then
		error(" bad complex number	",3)
	end
end

function P.new(r,i)
	return {r=r,i=i}
end

function P.add(c1,c2)
	checkComplex(c1);
	checkComplex(c2);
	return P.new(c1.r+c2.r,c1.i+c2.i);
end

return complex;
