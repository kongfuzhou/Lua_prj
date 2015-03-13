--�ھ��� Эͬ����

--����Эͬ����

co = coroutine.create(
	function () print('coroutine create') end

); --����״̬

--�鿴״̬

print("�鿴״̬=",coroutine.status(co)); --������ϵ����״̬


--�ӹ����Ϊ����
coroutine.resume(co); --��Ϊ����


print("�鿴״̬=",coroutine.status(co)); --��Ϊֹͣ

corou1=coroutine.create(
	function ()
		i=0
		i=i+1;
		coroutine.yield(); --���԰������и�Эͬ�������
	end);


--��ӡһ������Ԫ�ص���������
function peremgen(a,n)
	if n == 0 then
		printResult(a);
	else

		for i=1,n do
			a[n],a[i] = a[i],a[n]; --����ֵ
			peremgen(a,n-1);
			a[n],a[i] = a[i],a[n]; --����ֵ
		end
	end

end;

function printResult (a)
	for i,v in ipairs(a) do
		io.write(v, " ")
	end
	io.write("\n")
end

--peremgen ({1,2,3,4}, 4);

--ʹ��Эͬʵ��ʵ��һ�������� �Ӷ�ʵ�����湦��
function peremgen_cor(a,n)
	if n == 0 then
		coroutine.yield(a);
	else
		for i=1,n do
		a[n],a[i] = a[i],a[n]; --����ֵ
		peremgen(a,n-1);
		a[n],a[i] = a[i],a[n]; --����ֵ
		end
	end
end

--�����������
function perm(a)
	local n = table.getn(a);
	local co = coroutine.create(
		function ()
			peremgen_cor(a,n);
		end
	)

	return function ()
		local code,res =coroutine.resume(co);
		return res;
		end;
end

--ͨ��forѭ����ӡ����Ԫ������
for p in perm{"a","b","c"} do
	printResult(p);
end

