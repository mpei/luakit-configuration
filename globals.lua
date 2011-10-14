-- Global variables for luakit
globals = {
   homepage = "https://encrypted.google.com/",
   scroll_step = 40,
   zoom_step = 0.1,
   max_cmd_history = 100,
   max_srch_history = 100,
   default_window_size = "800x600",
}
                               
-- Make useragent
local arch = string.match(({luakit.spawn_sync("uname -sm")})[2], "([^\n]*)")
local lkv = string.format("luakit/%s", luakit.version)
local wkv = string.format("WebKitGTK+/%d.%d.%d", luakit.webkit_major_version, luakit.webkit_minor_version, luakit.webkit_micro_version)
local awkv = string.format("AppleWebKit/%s.%s+", luakit.webkit_user_agent_major_version, luakit.webkit_user_agent_minor_version)
globals.useragent = string.format("Mozilla/5.0 (%s) %s %s %s", arch, awkv, wkv, lkv)

-- list of predefined user-agents
globals.available_useragents = {
    default = globals.useragent,
    chrome = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/42.0.000.00 Safari/535.1",
    firefox = "Mozilla/5.0 (X11; Linux i686 on x86_64; rv:42) Gecko/20110524 Firefox/42.0",
    ie = "Mozilla/5.0 (compatible; MSIE 42.0; Windows NT 6.1; WOW64; Trident/6.0)",
}

globals.useragent = globals.available_useragents.chrome

search_engines = {
    g = "https://encrypted.google.com/search?hl=en&q=%s",
    s = "http://scholar.google.de/scholar?q=%s",
    go = "http://www.google.com/search?q=%s",
    so = "http://stackoverflow.com/search?q=%s",
    wa = "http://www.wolframalpha.com/input/?i=%s",
    wen = "http://en.wikipedia.org/w/index.php?title=Special:Search&search=%s",
    yt = "http://www.youtube.com/results?search_query=%s",
}
