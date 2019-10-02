default = ""

if #arg > 1 then
    default = arg[2]
end

if #arg > 0 then
    return os.getenv(arg[1]) or default
else
    return default
end