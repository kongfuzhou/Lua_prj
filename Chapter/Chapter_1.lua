
--��һ��
print("hello world");

--���� ��������
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

--�ַ���
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

--�ַ������ӷ� ..

print(10 .. 24);

-- ������ ~=

if 10 ~= 101 then

	print("yes ........... ");
end;

a and b -- ���aΪfalse���򷵻�a�����򷵻�b
a or b -- ���aΪtrue���򷵻�a�����򷵻�b

