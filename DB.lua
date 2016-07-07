--writeTable("user","name=文君,age=24")
function QMPlugin.writeTable(tableName,data)
	local f=loadfile(__MQM_RUNNER_LOCAL_PATH_GLOBAL_NAME__.."dbPlugin.mysql")
	local re=f(tableName,data,1)
	return re
end
--updateTable("user","name=文君","age=25")
function QMPlugin.updateTable(tableName,target,newData)
	local f=loadfile(__MQM_RUNNER_LOCAL_PATH_GLOBAL_NAME__.."dbPlugin.mysql")
	local re=f(tableName,target,newData)
	return re
end
--readTable("user","name=文君")
function QMPlugin.readTable(tableName,target)
	local f=loadfile(__MQM_RUNNER_LOCAL_PATH_GLOBAL_NAME__.."dbPlugin.mysql")
	local re=f(tableName,target,0)
	return re
end
--deleteFromTable("user","name=文君")
function QMPlugin.deleteFromTable(tableName,target)
	local f=loadfile(__MQM_RUNNER_LOCAL_PATH_GLOBAL_NAME__.."dbPlugin.mysql")
	local re=f(tableName,target,2)
	return re
end
--excuteSql("select * from user where name='tom'")
function QMPlugin.excuteSql(sql)
	local f=loadfile(__MQM_RUNNER_LOCAL_PATH_GLOBAL_NAME__.."dbPlugin.mysql")
	local re=f(sql)
	return re
end


--local t="select * from user where name='文君'"
--t=string.gsub(t, " ", "&nbsp")
local t="name='文君',age=24"

t=t..","
local kv=""
local keys=""
local values=""
local key=""
local value=""
local k=0
local i=0
while true do
	i=string.find(t,",",k)
	if i == nil then break end
	kv=string.sub(t,k,i-1)
    print(kv)	
	_, _, key, value = string.find(kv, "(.+)%s*=%s*(.+)")
	
	keys=keys..key..","
	values=values..value..","
	
	k=i+1
end

print(keys)
print(values)




