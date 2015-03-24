--16�� �������

require "Account"

--lua��ʵ����,�̳еĸ�����ͨ�����prototype��ʵ��

--���������b��Ϊa��prototype

a={};
b={age=30}

setmetatable(a,{__index=b}); --��������a��û�е��� ������__index��(b)�в��� ����Ϊʵ���˼̳й���

print("a.age=",a.age) -- 30




--�̳���Account
SpecialAccount = Account:new();

S = SpecialAccount:new{limit = 1000.00}; --ʵ��ϵ���ø���Account:new

--��д����ķ���
function SpecialAccount:withdraw(v)
	if v - self.balance >= self:getLimit() then
		error("insufficient founds")
	end
	self.balance =  self.balance - v
end

function SpecialAccount:getLimit()
	return self.limit or 0;
end


print("S.balance=",S.balance)

S:deposit(100);

print("S.balance=",S.balance)

print("SpecialAccount.balance=",SpecialAccount.balance)


--���ؼ̳�

print("--------------���ؼ̳�-----------------")

--���б���������Ҫ���ʵ���ı�
local function search(k,plist)
	local n = table.getn(plist)
	for i=1,n do
		local v = plist[i][k]
		if v then return v end
	end

end

--����һ���̳ж����ı� (��)
function createClass(...)
	local c = {}
	setmetatable(c,{__index=function (t,k)
			return search(k,arg);
		end
	})

	c.__index=c;

	function c:new(o)
		o = o or {}
		setmetatable(o,c)
		return o;
	end
	return c;
end

NameAccount = createClass(Account,Named);

account = NameAccount:new({name="paul"})

print(account.name,account.balance)


--ʵ��getter������setter���� (�հ�ʵ��)

print("--------- ʵ��getter������setter���� -----")

function newObject(value)
	return function (action,v)
		if action=="get" then return value
		elseif action=="set" then value = v
		else error("invalid action") end

	end
end

d = newObject(110)
print(d("get")) --110
d("set",1000)
print(d("get")) --110

















