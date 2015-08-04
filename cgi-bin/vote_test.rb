#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

# ボタンを押した回数を十の桁、正解が押された回数を一の桁で表現
# ex) 21 のときボタンが二回押され、一回正解判定を受けている
# 変数countは正解の場合"1", 不正解の場合"0"が入っている
# 受け取った数値及び状態を保存しているテキストの値をint型にし,
# それぞれの総和とボタンが押された判定で+10する
# テキストファイルを開き、rewindでファイルポインタを先頭にして
# 現在の値を入力する。後に、truncateで現在のポインタ以降を切り捨てる
# そして、ボタンを押された回数が3回(30)以上になったら値を返す 


require "cgi"
cgi = CGI.new
header = cgi.header( {"charset"=>"UTF-8"} )
count = cgi['ct']
stored_value = File.read("vote_test.txt")
stored_value2 = stored_value.to_i + count.to_i + 10

open("vote_test.txt" , "r+"){|f|
  f.flock(File::LOCK_EX)
  #body = f.read
  body = stored_value2
  f.rewind
  f.puts body
  f.truncate(f.tell)
}

if stored_value2 >= 30 then
#  print "Content-Type: text/plain\r\n\r\n"
#  print stored_value2.to_s
  cgi.out{stored_value2.to_s}
else
  cgi.out{"0"}
end
