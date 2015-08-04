#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require 'cgi'
require 'cgi/session'

cgi = CGI.new

odai = ""

begin
  File::open("odai.txt", "r") { |f|
    odai = f.gets.chomp
  }
  cgi.out{ "#{odai}" }
rescue
  cgi.out{ "error" }
end
