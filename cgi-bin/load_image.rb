#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require 'cgi'
require 'cgi/session'

cgi = CGI.new
player_num = cgi['id']

#cgi.out( "image/png" ){ open("Images/image.png", "rb").read }
cgi.out( "image/png" ){ open("Images/image" + player_num + ".png", "rb").read }


