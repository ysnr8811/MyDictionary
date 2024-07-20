---
title: Qiita Cli コマンド備忘録
tags:
  - QiitaCLI
private: false
updated_at: '2024-07-20T17:11:53+09:00'
id: f91da19306a7be6d7472
organization_url_name: null
slide: false
ignorePublish: false
---
# 事前準備

node.jsのインストール

バージョン管理がめんどくさい人は最新をダウンロード

https://nodejs.org/en/download/package-manager


セットアップ関係、コマンド関係は以下のgithubを参照

https://github.com/increments/qiita-cli?tab=readme-ov-file#%E8%A8%98%E4%BA%8B%E3%81%AE%E4%BD%9C%E6%88%90

# 記事の作成

npx qiita new 記事のファイルのベース名

# 記事の投稿・更新

npx qiita publish 記事のファイルのベース名

# 全ての記事を投稿・更新

npx qiita publish --all

#github actionsが動くはず

上記のコマンド以外でも cliがきちんと機能していれば

/.github/workflows/publish.yml

上記のファイルができているはずなのでgithub actionsが動くはずです


元々githubで管理していましたが毎回投稿作業がめんどくさかったので導入できてとても楽でした
