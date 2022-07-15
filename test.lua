--[[ local fileexec = {
    lua = 1,
    py = 2
}


for key, _ in pairs(fileexec) do
    print("*." .. key)
end ]]

local p = io.popen("ls . | grep lua") --Open directory look for files, save data in p. By giving '-type f' as parameter, it returns all files.
local counter = 0
for _ in p:lines() do
    counter = counter + 1
end
p:close()
print('nb of entries ' .. counter)

