local status_ok, tz = pcall(require, "true-zen")

if not status_ok then
    print('trueZen not found')
    return
end

tz.setup {}
