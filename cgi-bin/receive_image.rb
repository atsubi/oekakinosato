#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

#ライブラリ読み込み
require 'cgi'
require 'cgi/session'
require 'base64'

begin
  #cgiの処理
  cgi = CGI.new
  session = CGI::Session.new(cgi)
  number = session['number'].to_i
  
  filename = "Images/image" + number.to_s + ".png"
 
  if cgi.request_method == "POST"  then
    File.open(filename, 'wb') do |f|
      cgi.out{ "a:#{filename}" }
      f.write(Base64.decode64(cgi.params.keys[0].gsub(/-/, '+').gsub(/_/, '/')))
    end        
  end
rescue
 
end




