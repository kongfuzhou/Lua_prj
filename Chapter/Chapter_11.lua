--��ʮһ�� ���ݽṹ

--����һ��n��m�еľ���

mt={}

n=4
m=3

--������������� ����һ��α��ά����
for i=1,n do
	for j=1,m do
	mt[i*m+j]='0-'..i..'-'..j
	end
end

for i in pairs(mt) do
	print('mt--: ',i,mt[i]);

end

print("--------");

--����

list={next={next={},value=2},value=1};


while list do
	print("list.value=",list.value);
	list=list.next
end

t1={"where","are","you",120,n={1,2}};

s1=table.concat(t1); --��table�е������ַ������ӳ�һ���ַ�
print(s1);

s2=table.concat(t1,"-");--��table�е������ַ������ӳ�һ���ַ�  ����ÿ���ַ���֮����"-"����
print(s2);




