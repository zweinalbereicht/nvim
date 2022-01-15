local a= "Hello World"
print(a)
do
	local a = 2
	print(a)
end
print(a)

function myprint(a)
	print(a)
	return
end

t1={v1="lala"
	,v2=true
	,v3=2}

for key,val in pairs(t1)
do
	print(key,val)
end


