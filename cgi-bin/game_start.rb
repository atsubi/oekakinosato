#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

#スタートボタンを押したプレイヤのステートを変更する 1 => 2


require 'cgi'
require 'cgi/session'

m = Mutex.new

m.synchronize {

  p_file = "entry.dat" #アクセス状況監視ファイル
  pHash = Hash.new()
  cgi = CGI.new
  header = cgi.header( {"charset"=>"UTF-8"} )
  puts header
  session = CGI::Session.new(cgi)
  p = session['number'].to_i

  #

  
  #アクセステーブル読み込み
  File.open( p_file, "r" ) do |f|
    f.each do |line|
      tmp = line.split(",")
      pHash[tmp[0].strip.to_i] = tmp[1].strip.to_i
    end
  end

  #アクセスフラグを立てる
  if pHash[p] == 1 then
    pHash[p] = 2
  else
    exit(10)
  end


  #アクセステーブル読み込み
  fp = open( p_file, "w" )
  pHash.each{ |pl, state|
    fp.print "#{pl},#{state}\n"
  }
  fp.close

}

