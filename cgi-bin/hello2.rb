#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-


require "cgi"
cgi = CGI.new
name = cgi['name']
name = CGI.escapeHTML(name)
puts "Content-type: text/html"
puts
puts "こんにちは、#{name} さん！"
puts "<h1>ランランルー</h1>"
