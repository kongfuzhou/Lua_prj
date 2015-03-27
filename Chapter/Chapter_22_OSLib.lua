-- 22章

require "COmmonFunc"

local glb = Global;

now = os.time();

print(now);

t= os.date("*t",now);

print(t)
Global.PrintTabKV(t)

print(os.date("%c"))

print(os.clock()) --返回代码执行到该处 花费的时间
