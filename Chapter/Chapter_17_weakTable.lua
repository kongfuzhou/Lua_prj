--��ʮ���� weak��

--����weak table
a = {};
b = {};

setmetatable(a,b); --

b.__mode= "k"  --b��a��weak table b��__mode�����ַ��� k �������� weak keys���͵�weak table

key = {};
a[key] = 1;

key = {};
a[key] = 2
collectgarbage(); --ǿ�ƻ���

for k,v in pairs(a) do print(v,k) end


--���亯��

local results = {};
setmetatable(results,{__mode="kv"}); --��������,���������������յ�ǰʱ����û�б�ʹ�õĽ��
function mem_loadString(s)

	if results[s] then
		return results[S];
	else
		local res = loadstring(s);
		results[s] = res;
		return res;
	end
end

--����weak table����Ĭ��ֵ

local defaults= {};
setmetatable(defaults,{__mode="k"});
local mt = {__index = function (t) return defaults[t] end};
function setDefault(t,d)
	defaults[t] = d;
	setmetatable(t,mt);
end

--����weak table�ͼ��亯������Ĭ��ֵ

local metas = {}

setmetatable(metas,{__mode = "v"});

function setDefault2(t,d)
	local mt = metas[d]
	if mt == nil then
		mt = {__index = function () return d end};
		metas[d]=mt;
	end
	setmetatable(t,mt);
end





