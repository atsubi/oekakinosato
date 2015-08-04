#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require 'cgi'

cgi = CGI.new
answer_text = ""

begin
  File::open("answer_text.txt", "r") { |f|
    answer_text = f.gets.chomp
  }

  cgi.out{ "#{answer_text}" }
rescue
  cgi.out{ "" }
end



