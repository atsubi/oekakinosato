#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require 'cgi'

p_file = "entry.dat"
pn_file = "entry_name.dat"

cgi = CGI.new


#IDファイルを読み込んでハッシュを生成 
pHash = Hash.new()

begin
  File.open( p_file, "r" ) do |f|
    f.each do |line|
      tmp = line.split(",")
      pHash[tmp[0].strip.to_i] = tmp[1].strip.to_i
    end
  end
rescue
  cgi.out{ "error" }
  pHash = { }
end

#アクセス中のユーザを取得
pnHash = Hash.new()

begin

  File.open( pn_file, "r:eucJP" ) do |f|
    f.each do |line|
      tmp = line.split(",")
      pnHash[tmp[0].strip.to_i] = tmp[1].strip
    end
  end

rescue
  cgi.out{ "error" }
  pnHash = { }
end

#プログラム処理中のid取得


#現在の入場数をカウント
#アクセス中のユーザ名とプレイヤ番号を返す
count = 0
players =""
begin
  pHash.each { |pl, state|
    if state != 0 then
      count = count + 1
    end
  }
  pnHash.each{ |pl, name| 
    players = players + "#{pl},#{name},"
  }
  players[-1] = ""
  cgi.out{ "#{count},#{players}" }
rescue
  cgi.out{ "error" }
end



