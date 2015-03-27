--stringUtil

function strToArr(s,split)
	arr = {};
	i = 0
	start = 1;
	endindex = 1
	while true do
		i = string.find(s,split,i+1);
		if i == nil then
			break
		else

			if i>1 then
				endindex = i-1
				table.insert(arr,string.sub(s,start,endindex));
				start=endindex+2
			end
		end

	end
	return arr
end
