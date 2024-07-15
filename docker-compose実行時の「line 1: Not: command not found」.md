# 問題
## line 1: Not: command not found

M1Macを使ってdockerで環境構築している際にエラーで困っていたので備忘録として残します


'''
/usr/local/bin » docker-compose -v
/usr/local/bin/docker-compose: line 1: Not: command not found
'''

コンテナを立ち上げようとした際にググったサイト通りにコマンドを入れてみましたがエラー？が帰ってきて困っていました

# 解決策
## バージョンの違い

https://www.konosumi.net/entry/2023/02/26/142508


上記記事がとても参考になりました

要はdocker-composeのバージョンで書き方が違うようです

ver1

docker-compose

ver2

docker compose

