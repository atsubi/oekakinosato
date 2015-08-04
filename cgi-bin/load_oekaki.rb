#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require 'cgi'

cgi = CGI.new
#header = cgi.header( {"charset"=>"UTF-8"} )
#puts header

html = "test"
begin
  File::open("paint.html", "r") { |f|
    html = f.read
  }
  cgi.out{ "#{html}" }
rescue
  cgi.out{ "eroor" }
end
