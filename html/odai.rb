#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require "cgi"
require 'cgi/session'

cgi = CGI.new
session = CGI::Session.new(cgi)
player_name = session['name']
player_num = session['number']
odai = "null"
path = File.expand_path('../html/que.txt', '/var/www/html')
#cgi.out { path }
File::open(path, "r") { |f|
  odai = f.gets
}
odai = CGI.escapeHTML(odai)
#puts "Content-type: text/html"
#puts
#puts "お題：#{player_name} "
cgi.out{ "お題: #{odai}" }
