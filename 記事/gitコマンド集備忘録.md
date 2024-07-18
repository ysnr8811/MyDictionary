# gitのコマンド備忘録

gitのコマンドを忘れてもいいように記事に残します



# ブランチ確認
git branch

# ブランチを作って作ったブランチに移動
git checkout -b ブランチ名

# 全てのファイルをステージングへあげる
git add .

# ステージングのファイルをメッセージ付きでコミット
git commit -m 'message'

# プッシュ
git push

# ローカルブランチ削除
git branch -d ブランチ名

# リモートブランチ削除
git push origin :ブランチ名


# ステージング、コミット、プッシュまでまとめたシェル
```shell:git-add-commit-push.sh
#!/bin/zsh

# git add .
git add .

# コミットメッセージの入力を求める
read -p "Enter commit message: " commit_message

# git commit -m ''
git commit -m "$commit_message"

# git push
git push

```
