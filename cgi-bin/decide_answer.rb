#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*- 

player_mun = [ 1, 2, 3, 4 ]

p = player_mun.sample

puts p

fp = File.open("answer.txt", "w")
fp.print "#{p}"
fp.close
