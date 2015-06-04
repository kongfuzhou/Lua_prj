--[[
����ʱ�����ڹ�����
--]]
local TimeUtil = {}

TimeUtil.dateTimeKeys={
	{y="year",m="month",d="day",},
	{h="hour",m="min",s="sec",}
}

TimeUtil.chinese={
year="��",
month="��",
day="��",
hour="ʱ",
min="��",
sec="��"
}

function TimeUtil:getTimeNowStr(format,isChinese)
	return self:formatBySec(ClockManager:time(),format,isChinese)
end

--[[
@params second    ��Ҫ����(��)
@params format    ʱ���ʽ[������=ymd;ʱ����=hms;ymd��hms�����Ϊ����ĸ;�����Կո�ͷ]
        ��format��nil�Ĳ���isStander=false,��ʲô�ͷ���ʲô	�ο�@examples
@params isChinese �Ƿ����ĸ�ʽ(Ĭ��false)
@params ymdSplit  ��������֮��ķָ���(Ĭ��Ϊ:����format�еķָ���)
@params hmsSplit  ʱ������֮��ķָ���(Ĭ��Ϊ:����format�еķָ���)
@params space  ���ں�ʱ��֮��ķָ���(Ĭ��Ϊ�ո�)
@params isStander  �Ƿ��ǻ�ȡ��׼ʱ��(Ĭ��false,true��ʾ��ȡ��1970�꿪ʼ����ı�׼ʱ��)

@examples
TimeUtil:formatBySec(3600)  01:00:00
TimeUtil:formatBySec(906000490,"ymd-hms") == xxxx-xx-xx xx-xx-xx
TimeUtil:formatBySec(906000490,"ymd:hms") == xxxx:xx:xx xx:xx:xx
TimeUtil:formatBySec(906000490,"ymd:hms",false,"-") == xxxx-xx-xx xx:xx:xx
TimeUtil:formatBySec(906000490,"ymd",false,"-") == xxxx-xx-xx
TimeUtil:formatBySec(906000490,":hms",false,"-") ==  xx:xx:xx (:hmsǰ���ð�ŷָ���(�������������ĸ�ָ���)������)
--]]
function TimeUtil:formatBySec(second,format,isChinese,ymdSplit,hmsSplit,space,isStander)
	if space==nil then
		space = " "
	end
	local retStr = ""
	local split = ":" --���ּ��Ĭ�Ϸָ���
	local formatArr = {}
	format = string.lower(format) --���Դ�Сд
	if string.find(format,"%A",0) then --���ּ�ķָ���Ϊ����ĸ
		local i,j = string.find(format,"%A",0)
		split = string.sub(format,i,j)
		formatArr=string.split(format,split)
	else
		table.insert(formatArr,format)
	end
	if formatArr and #formatArr>0 then
		local length = #formatArr
		if length>2 then
			length = 2
		end
		local keys = self.dateTimeKeys
		local dateTab
		if isStander then
			dateTab = os.date("*t",second)
		else
			dateTab = TimeUtil:getDateInfoBySec(second)
		end
		for i=1,length do
			local strLen = string.len(formatArr[i])
			for j=1,strLen do
				local k= string.sub(formatArr[i],j,j)
				local key = keys[i][k]
				if not key then --������Ч��ʽ ���ؿմ�
					return ""
				end
				local timeNumStr = TimeUtil:getLengthNum(dateTab[key])
				if isChinese then
					retStr = retStr..timeNumStr..self.chinese[key]
				else
					retStr = retStr..timeNumStr
					if j<strLen then
						local tempSplit = split
						if i==1 and ymdSplit and type(ymdSplit)=="string" then
							tempSplit = ymdSplit --�Զ�������ַָ���
						elseif i==2 and hmsSplit and type(hmsSplit)=="string" then
							tempSplit = hmsSplit --�Զ�������ַָ���
						end
						retStr = retStr..tempSplit
					end
				end

			end -- end of for
			if length == 2 and i<length and formatArr[2] ~="" then
				retStr = retStr..space
			end

		end -- end of for

	end -- end of if

	return retStr
end

function TimeUtil:getDateInfoBySec(second)
	local dateTab={
		year=0,
		month=0,
		day=0,
		hour=0,
		min=0,
		sec=0,
	}

	local minSec = 60
	local hourSec = 3600
	local daySec = hourSec*24
	local monSec = daySec*30
	local yearSec =monSec*12

	local function toint2(v)
		return math.floor(tonumber(v))
	end

	dateTab.year = toint2(second/yearSec)
	local leftMs = second%yearSec
	dateTab.month = toint2(leftMs/monSec)
	local leftDs = leftMs%monSec
	dateTab.day = toint2(leftDs/daySec)
	local leftHs = leftDs%daySec
	dateTab.hour = toint2(leftHs/hourSec)
	local leftminS = leftHs%hourSec
	dateTab.min = toint2(leftminS/minSec)
	dateTab.sec = toint2(leftminS%minSec)
	return dateTab
end

function TimeUtil:formatSecond(second,formatstr)
	local dateTab = self:getDateInfoBySec(second)
	local retStr = ""
	if formatstr == nil then
		formatstr=self:getFormat(dateTab)
	end

	local strLen = string.len(formatstr)
	for j=1,strLen do
		local k= string.sub(formatstr,j,j)
		local key = TimeUtil.dateTimeKeys[2][k]
		retStr = retStr..self:getLengthNum(dateTab[key])
		if j<strLen then
			retStr = retStr..":"
		end
	end -- end of for
	return retStr
end

--�����޹��̵�ˢ��ʱ��������
function TimeUtil:getLimitShopUpdt(updt)
	local timeNow = ClockManager:time()
	local dateNow = ClockManager:date()
	local timeArr = string.split(updt,"#")
	if not timeArr then
		timeArr = {}
		if string.find(str, "#") then
			table.insert(timeArr,str)
		end
	end
	local ret = {year=dateNow.year, month=dateNow.month, day=dateNow.day,hour=dateNow.hour,min=dateNow.min, sec=dateNow.sec}
	local len = #timeArr
	if  len > 0 then
		for k,v in pairs(timeArr) do
			local updArr = string.split(v,":")
			if ret.hour < toint(updArr[1]) then
				ret.hour = toint(updArr[1])
				ret.min = toint(updArr[2])
				ret.sec = 0
				break
			elseif ret.hour == toint(updArr[1]) and ret.min<toint(updArr[2]) then
				ret.hour = toint(updArr[1])
				ret.min = toint(updArr[2])
				ret.sec = 0
				break
			else
				if k==len then --�ڶ���ˢ��
					updArr = string.split(timeArr[1],":")
					ret.day = ret.day+1
					ret.hour = toint(updArr[1])
					ret.min = toint(updArr[2])
					ret.sec = 0
				end
			end
		end
	end
	--print_r(ret)
	return os.time(ret)
end


--[[
��ȡ��ʽ
--]]
function TimeUtil:getFormat(dateTab)
	local format = ""
	local index = 1
	local ymdArr = {"y","m","d"}
	local hmsArr = {"h","m","s"}

	local keys = TimeUtil.dateTimeKeys

	for k,v in pairs(ymdArr) do
		if format=="" then
			if dateTab[keys[1][v]] > 0 then
				index = index+1
				format = format..v
			end
		else
			format = format..v
		end

	end
	format = format..":"
	for k,v in pairs(hmsArr) do
		if format=="" then
			if dateTab[keys[2][v]] > 0 then
				index = index+1
				format = format..v
			end
		else
			format = format..v
		end

	end

	return format
end

function TimeUtil:getLengthNum(num)
	if tonumber(num)>=10 then
		return tostring(num)
	else
		return "0"..num
	end
end

return TimeUtil
