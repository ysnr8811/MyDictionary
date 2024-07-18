#!/bin/zsh

# git add .
git add .

# コミットメッセージの入力を求める
read -p "コミットメッセージを入力してください※issueに紐づける場合は「#1」のように記載してください: " commit_message

# git commit -m ''
git commit -m "$commit_message"

# git push
git push
