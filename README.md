# oekakinosato

## 遊び方
お使いの環境に合わせていくつかのファイルを編集しなければなりません．

cgi-bin/direct_to_game_Q.rbの7行目付近

    print "Location: http://動かす環境のipアドレス/base_Q.html\n\n"


cgi-bin/direct_to_game_A.rbの7行目付近

    print "Location: http://動かす環境のipアドレス/base_A.html\n\n"


html/index.htmlの230行目付近

    document.location.href = "http://動かす環境のipアドレス/cgi-bin/direct_to_game_Q.rb"


html/base_Q.htmlの行目付近

    document.location.href = "http://動かす環境のipアドレス/cgi-bin/direct_to_game_A.rb"

----------------