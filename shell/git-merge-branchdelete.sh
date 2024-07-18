#!/bin/zsh

# マージするブランチ名を入力させる
read -p "マージするブランチ名を入力してください: " branch_name

# 現在のブランチから入力されたブランチをマージ
if git merge $branch_name; then
  echo "ブランチのマージが成功しました。"
else
  echo "ブランチのマージに失敗しました。"
  exit 1
fi

# ブランチ削除
if git branch -d $branch_name; then
  echo "ローカルブランチの削除が成功しました。"
else
  echo "ローカルブランチの削除に失敗しました。"
  exit 1
fi

# git push
if git push; then
  echo "プッシュが成功しました。"
else
  echo "プッシュに失敗しました。"
  exit 1
fi

# リモートブランチの削除
if git push origin --delete $branch_name; then
  echo "リモートブランチの削除が成功しました。"
else
  echo "リモートブランチの削除に失敗しました。"
  exit 1
fi
