#!/root/.rbenv/shims/ruby
# -*- coding: utf-8 -*-

count = "1"
stored_value = File.read("vote_test.txt")
stored_int = stored_value.to_i
stored_value = stored_int + count.to_i + 10

open("vote_test.txt" , "r+"){|f|
  f.flock(File::LOCK_EX)
  #body = f.read
  body = stored_value
  f.rewind
  f.puts body
  f.truncate(f.tell)
}


print stored_value.to_s
