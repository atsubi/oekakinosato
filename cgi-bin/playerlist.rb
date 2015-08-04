#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require 'cgi'

cgi = CGI.new

pn_file = "entry_name.dat"
array = []

begin
  File.open( pn_file, "r:eucJP'" ) do |f|
    f.each do |line|
      tmp = line.split(",")
      array.push( tmp[1].strip )
    end
  end

  players =""
  array.each { |name|
    players = players + "#{name},"     
  }
  players[-1] = ""
  cgi.out{ "#{players}" }

rescue
  cgi.out{ "error" }
end


