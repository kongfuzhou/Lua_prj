--14�� ���� Ҳ����lua�еĻ�������

require "CommonFunc";

--��ӡ����ǰ�����е�����ȫ�ֱ���

abc = "����� boy";

--Global.PrintTabKV(_G); -- _G�����ŵ�ǰ�����е�����ȫ�ֱ���


--����һ������

function setField(f,v)
	local t = _G;
	for w,d in string.gfind(f,"([%w_]+)(.?)") do
		if d == "." then
			t[w]= t[w] or {};
			t = t[w];
		else
			t[w] = v;
		end
	end
end

setField("t.x.y",10)

print(t.x.y)

a = 1

setfenv(1,{});

print(a); --�״�







