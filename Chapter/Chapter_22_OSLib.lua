-- 22��

require "COmmonFunc"

local glb = Global;

now = os.time();

print(now);

t= os.date("*t",now);

print(t)
Global.PrintTabKV(t)

print(os.date("%c"))

print(os.clock()) --���ش���ִ�е��ô� ���ѵ�ʱ��
