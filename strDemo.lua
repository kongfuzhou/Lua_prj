
print("hello")

Global={}

function Global.PrintTabKV(t)
	for i in pairs(t) do
		print("key=",i," val=",t[i])
	end
end

local str = "����ӿ����<MsgObj>PLAYER,0</MsgObj>��<MsgObj>ITEM,{$1}</MsgObj>�ɹ�����Ϊ<MsgObj>ITEM,{$2}</MsgObj>����װ������˭������"


local pos,arr = 0, {}
local delimiter ="<MsgObj>.-</MsgObj>"

print("ddddd = ",string.find(str,delimiter, pos,true))

-- for each divider found
for st,sp in function() return string.find(str,delimiter, pos,true) end do
	print("st sp",st,sp)
	table.insert(arr, string.sub(str, pos, st - 1))
	pos = sp + 1
end



print("---------ffffffff ")



par = "/%*.-%*/" -- /%*.-%*/ ���� '.-' ��Ϊ���ƥ�䣬��ƥ�� "/*" ��ʼ����һ�� "*/"  ֮ǰ�Ĳ���

par = "<MsgObj>.-</MsgObj>"




print(string.gsub(str,par , "|"))

print(string.gmatch(str,par))





function getParttemContent(str,parttem)

	parttem="<MsgObj>.-</MsgObj>"
	local ret = {}
	for name,value in string.gmatch(str,parttem) do  --string.gmatch����������һ�������������ڵ������г����ڸ����ַ����е�ƥ���ַ���

		--print("getParttemContent name=",name,"value=",value)

		local target = string.gsub(name,"/", "")
		target = string.gsub(target,"<MsgObj>", "")
		--print("target=",target)
		table.insert(ret,target)
	end
	return ret
end


function transform(str)

	local arr= {}

	local par = "<MsgObj>.-</MsgObj>"
	local pCnt = getParttemContent(str)

	local delimiter = "|"

	local replaceStr=string.gsub(str,par,delimiter)
	print("transform str=",str)
	print("transform replaceStr=",replaceStr)

	local cIndex = 0
	local pos = 0
	for st,sp in function() return string.find(replaceStr,delimiter,pos,true) end do
		local s = string.sub(replaceStr, pos, st - 1)
		print("st sp",st,sp,"s=",s)
		table.insert(arr, s)
		pos = sp + 1
		cIndex = cIndex + 1
		if cIndex<= #pCnt then
			table.insert(arr,pCnt[cIndex])
		end

	end
	return arr
end

local ret = transform(str)


print("------------ transform is my target ----------------")

--Global.PrintTabKV(ret)


local myStr = "color,2,{$1}"

myStr = string.gsub(myStr,"[$]", "")

print("myStr=",myStr)



local s= "COLOR,2,{$1}"

print(string.find(s,"COLOR"))


local StringUtil = {}

--[[
�滻ռλ��������
@str ����ռλ���磺{1}���ַ���
--]]
function StringUtil:replaceParams(str, ...)
    --�滻����
    local arg = {...}
    for i,v in ipairs(arg) do
        str = string.gsub(str, "{"..i.."}", v)
    end
    return str
end

function StringUtil:split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    local i = 1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

s = "����˭��˭��{1}�ȼ�"

local ret = StringUtil:replaceParams(s,"<�滻����>")
print("-----------------ret---------------")

print(ret)


print("-----------------ret--22-------------")

local ret = StringUtil:split("1001#", "#")

Global.PrintTabKV(ret)








