#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

Themed = ["魚", "車", "哺乳類", "果物", "鳥", "ガラス製品", "爬虫類", "電化製品"]

s = Themed.sample(1)

puts s

File.write("odai.txt", s.join)




