
--第一章
print("hello world");

--函数 代码例子
function fact(n)

	if n == 0 then
		return 1
	else
		return n * fact(n-1)
	end
end

print("enter a number:");

--a = io.read("*number");

--print(fact(a));

--字符串
page = [[
<HTML>
<HEAD>
<TITLE>An HTML Page</TITLE>
</HEAD>
<BODY>
Lua
</BODY>
</HTML>
]]

io.write(page);

--字符串链接符 ..

print(10 .. 24);

-- 不等于 ~=

if 10 ~= 101 then

	print("yes ........... ");
end;

a and b -- 如果a为false，则返回a，否则返回b
a or b -- 如果a为true，则返回a，否则返回b

