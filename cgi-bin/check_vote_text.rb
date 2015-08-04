#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require 'cgi'

cgi = CGI.new
vote_text = File.read("vote_test.txt")

if vote_text.to_i >= 30 then
  cgi.out{ vote_text.to_s }
else
  cgi.out{ "0" }
end



