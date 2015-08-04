#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require "cgi"
request_param = Hash.new
query = ENV['QUERY_STRING']
for q in query.sprit("&") do
k,v = q.sprit("=",2)
request_param[k] = CGI.unescape(v)
end
cgi.out{"request_param"}
