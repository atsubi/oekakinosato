#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require 'cgi'

cgi = CGI.new

answer = ""

begin
  File::open("answer.txt", "r") { |f|
    answer = f.gets.chomp
  }
  cgi.out{ "#{answer}" }
rescue
  cgi.out{ "-1" }
end
