#!/bin/zsh

# git add .
git add .

# コミットメッセージの入力を求める
read -p "Enter commit message: " commit_message

# git commit -m ''
git commit -m "$commit_message"

# git push
git push
