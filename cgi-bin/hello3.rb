#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require "cgi"
cgi = CGI.new
odai = "null"
name = ENV['QUERY_STRING']
name = CGI.escapeHTML(name)
puts "Content-type: text/html"
puts
puts "こんにちは、#{odai} さん！"
