#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

#アクセス数を格納するデータ



c_file = "entry.dat"
require 'cgi'
cgi = CGI.new



sleep(3)
#カウンタの値を読み取り現在のアクセス数をカウントする
#ここの処理は排他制御を行う
begin
  fp = open( c_file, "r" )
  counter = fp.gets.to_i + 1
  fp.close
rescue
  counter = 0
end


#ここまでーーーー
fp = open( c_file, "w" )
fp.print counter
fp.close



puts "Content-type: text/html"
puts
puts "通信完了 #{counter}"





