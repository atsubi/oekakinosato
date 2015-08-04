#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

#新規アクセスに対してIDを付与する
#名前をentry_name.datに追加する

require 'cgi'
require 'cgi/session'

m = Mutex.new;

#同時に複数のプロセスが
#entry.datとentry_name.datにアクセスしないようにする
m.synchronize {

  p_file = "entry.dat"  #アクセス状況監視ファイル
  pn_file = "entry_name.dat" #アクセスしている名前の一覧
  cgi = CGI.new
  name = cgi['name']

  #名前の長さを調べる
  if name.length > 10 then
    cgi.out{ "-1" }
    exit(10)
  end

  pHash = Hash.new()
  pnHash = Hash.new()

  begin
    #IDテーブルを読み込んでハッシュを生成  
    File.open( p_file, "r" ) do |f|
      f.each do |line|
        tmp = line.split(",")
        pHash[tmp[0].strip.to_i] = tmp[1].strip.to_i
      end
    end
  rescue
    cgi.out{ "-2" }
    pHash = { }
  end

  begin

    #IDテーブルを更新
    hash = pHash.select{ |pl, bool|
      bool == 0
    }
    if hash.empty? then #既に満席ならその旨を返す
      cgi.out{ "-10" }
      exit(10)
    else
      p = hash.first[0] #
      pHash[p] = 1

      #名前テーブルを読み込んでハッシュテーブルを生成
      File.open( "entry_name.dat", "r" ) do |f|
        f.each do |line|
          tmp = line.split(",")
          pnHash[tmp[0].strip.to_i] = tmp[1].strip
        end
      end

      #名前テーブルを更新
      pnHash[p] = name

      #名前テーブルをソート
      pnArray = pnHash.sort{ |(pl1, p_name1), (pl2, p_name2)|
        pl1 <=> pl2
      } 
      

    end

  rescue 
    cgi.out{ "-20" }
    exit(10)
  end

  
  begin

    #IDテーブルを書き込む
    fp = open( p_file, "w" )
    pHash.each{  |pl, state|
      fp.print "#{pl},#{state}\n"
    }
    fp.close


    #名前テーブルを書き込む
    fp = open( pn_file, "w" )
    pnArray.each{ |pl|
      fp.print "#{pl[0]},#{pl[1]}\n"
    }
    fp.close
    
    session = CGI::Session.new(cgi)
    session['name'] = name
    session['number'] = p

    if  p == 1 then
      themed = ["魚", "車", "哺乳類", "果物", "鳥", "ガラス製品", "爬虫類", "電化製品"]
      s = themed.sample(1)
      File.write("odai.txt", s.join)
      player_mun = [ 1, 2, 3, 4 ]
      ans = player_mun.sample
      fp = File.open("answer.txt", "w")
      fp.print "#{ans}"
      fp.close
    end

    cgi.out{ p.to_s }

  rescue
    cgi.out{ "-30" }
    exit(10)
  end
}



