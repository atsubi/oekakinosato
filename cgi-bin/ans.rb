#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

require "cgi"
cgi = CGI.new
header = cgi.header( {"charset"=>"UTF-8"} )
answer = cgi['answer']
answer = CGI.escapeHTML(answer)
File.write("answer_text.txt", answer)
cgi.out{"#{answer}"}
