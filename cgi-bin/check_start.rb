#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

#4人ともスタートボタンを押したかを確認する
#4人とも押している場合は1　押していない場合は2を返す

require 'cgi'

p_file = "entry.dat" #アクセス状況監視ファイル

cgi = CGI.new
pHash = Hash.new
m = Mutex.new

m.synchronize {

  #アクセステーブル読み込み
  File.open( p_file, "r" ) do |f|
    f.each do |line|
      tmp = line.split(",")
      pHash[tmp[0].strip.to_i] = tmp[1].strip.to_i
    end
  end
  
  #全プレイヤのステートを確認
  if pHash.select{ |pl, state|
      state != 2
  }.empty? then
    cgi.out{ "1" }
  else
    cgi.out{ "2" }
  end
  
}
