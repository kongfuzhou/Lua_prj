
require "CommonFunc"

--18 �� math

print("--------------math��---------------");

radVal = math.rad(90); --�Ƕ�ת����

print(radVal);

degVal = math.deg(1.5); --����ת�Ƕ�

print(degVal);


-- 19�� table��

print("--------------table��---------------");

-- ���úͻ�ȡ����

tab1 = {1,2,4,x=100,y=200,89,"abc"};

print(table.getn(tab1));--�õ� 5 ��ֵ�ԵĲ����볤��



--table.setn(tab2,5) --�ú������°汾���Ѿ�����ʹ����

tab2={1,500,20};

print(table.getn(tab2))


table.insert(tab2,100); --�������������һ��Ԫ��
table.insert(tab2,2,800); --������ĵڶ���λ�ò���һ��Ԫ��

print("tab2=",table.getn(tab2)) --�� 0 ע�ⲻҪ�����±����Ԫ�� ��Ȼ��ȡ���ĳ�������


Global.PrintTabKV(tab2);

table.remove(tab2,2) --ɾ���ڶ���λ�õ�Ԫ��

table.remove(tab2);--ɾ�����һ��Ԫ��

print("------------------------")

table.sort(tab2); --Ĭ������������

Global.PrintTabKV(tab2);
print("-------------++++***+++++-----------")

tab3 = {"a",10,56,x=10,78,y=101};

for i in pairs(tab3) do  --����������table

	print(i,tab3[i])
end

print("-------------++++** ipairs *+++++-----------")

for j,k in ipairs(tab3) do --ֻ�������鲿�ֵ�Ԫ��

	print(j,k)
end

print("-------------++++** tttttt *+++++-----------")

tab4 = {200,1,50,50,90,6,4,70};

table.sort(tab4,cal); --��������������ͽ���

Global.PrintTabKV(tab4);

function cal(v1,v2)
 return v1>v2 --���ں� �ǽ��� С�ں�����
end

-- 20�� string��

print("~~~~~~~~~~~~~~~~ 20�� string�� ~~~~~~~~~~~~~~~~~~~~~~ !!!")

--��ȡ����

str1 = "hello world";

len1 = string.len(str1);

print(len1)

print(string.sub(str1,3,5)); --��ȡ������������ַ���
print(string.sub(str1,3,-2));

print(string.char(97,98)) --���ض��ascii���Ӧ���ַ���

print(string.byte("abc",3)) --�����ַ�����ascii�� Ĭ�Ϸ��ص�һ��


--��ʽ���ַ���
print(string.format("PI = %.4f",math.pi)); --С������汣����λ

print(string.format("n=%o",18))

--�ַ�������

str2 = "hello,world";

i,j,v =string.find(str2,",",0,true); --�ӵڶ���λ�ÿ�ʼ���� �����ַ����Ŀ�ʼλ�úͽ���λ�� û��ƥ�䷵��nil

print("i,j,v=",i,j,v)

print(string.sub(str2,i,j));

--�滻�ַ���
print(string.gsub(str2,"l","GG",2)) --������������ʾ�����滻�Ĵ��� 2 ��ʾֻ�滻ǰ������ƥ��Ĵ�

str3 = "a55|||a8y5fdsd444d0"

print(string.gsub(str3,"%z","*+"))

pair = "name = Anna"
a,a2,key, value = string.find(pair, "(%a+)%s*=%s*(%a+)")
print(key, value,a,a2) --> name Anna

--ȥ���ַ�����λ�Ŀո�
function trim(s)
	return (string.gsub(s,"%s*(.-)%s*$","%1"))
end







