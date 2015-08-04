#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

m = Mutex.new

#ここの処理は排他制御を行う
m.synchronize {
  
  #アクセス数を格納するデータ
  c_file = "entry.dat"
  pn_file = "entry_name.dat"
  
  require 'cgi'
  require 'cgi/session'
  
  cgi = CGI.new
  header = cgi.header( {"charset"=>"UTF-8"} )
  puts header
  session = CGI::Session.new(cgi)
  p = session['number'].to_i
  session.delete
  
  #IDファイルとカウンタの値を読み取る
  pHash = { }
  pnHash = { }
  
  
  File.open( c_file, "r" ) do |f|
    f.each do |line|
      tmp = line.split(',')
      pHash[tmp[0].strip.to_i] = tmp[1].strip.to_i
    end
  end
  
  File.open( pn_file, "r" ) do |f|
    f.each do |line|
      tmp = line.split(',')
      pnHash[tmp[0].strip.to_i] = tmp[1].strip
    end
  end
  
  #更新
  pHash[p] = 0
  pnHash.delete( p )
  
  #ファイル書き込み
  fp = open( c_file, "w" ) 
  pHash.each{ |pl, bool|
    fp.print "#{pl},#{bool}\n"
  }
  fp.close
  
  fp = open( pn_file, "w" )
  pnHash.each{ |pl, name|
    fp.print "#{pl},#{name}\n"
  }
  fp.close
}
#ここまでーーーー
