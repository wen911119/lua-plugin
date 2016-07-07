
--版本20160315下午18点

function QMPlugin.writeFunction()

    function main(x1,x2,x3)
		local sql=""
		if x2==nil then
			--执行sql
			sql=x1
		elseif x3==0 then
		    --读取表
			x2=string.gsub(x2,","," AND ")
			local sql="SELECT * FROM "..x1.." WHERE "..x2
		
		elseif x3==1 then
			--写入表
			x2=x2..","
			local kv=""
			local keys=""
			local values=""
			local key=""
			local value=""
			local k=0
			local i=0
			while true do
				i=string.find(x2,",",k)
				if i == nil then break end
				kv=string.sub(t,k,i-1)
				print(kv)	
				_, _, key, value = string.find(kv, "(.+)%s*=%s*(.+)")
				
				keys=keys..key..","
				values=values..value..","
				
				k=i+1
			end
			sql="INSERT INTO "..x1.." ("..keys..") VALUES("..values..")"
		elseif x3==2 then
			--删除数据
			local targetStr=x2=string.gsub(x2,","," AND ")
			sql="DELETE FROM "..x1.." WHERE "..targetStr
		
		else 
			--更新表
			local targetStr=string.gsub(x2,","," AND ")
			local newDataStr=x3
			sql="UPDATE "..x1.." SET "..newDataStr.." WHERE "..targetStr
			
		end
		sql=string.gsub(sql," ","&nbsp")
		return LuaAuxLib.URL_OperationGet("http://120.25.248.135:3000/dbOpreate/"..sql)
    end
 
    local s=string.dump(main)
    local file=io.open(__MQM_RUNNER_LOCAL_PATH_GLOBAL_NAME__.."dbPlugin.mysql","w")
    file:write(s)
    file:close()
end