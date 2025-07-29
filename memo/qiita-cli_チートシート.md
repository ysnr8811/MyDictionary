---
title: Qiita CLI チートシート
tags:
  - Qiita
  - QiitaCLI
private: true
---

# Qiita CLI チートシート

Qiita CLIは、ローカル環境で好みのエディタを使い、Qiitaの記事を執筆、プレビュー、投稿するためのツールです。

## 主なコマンド

| コマンド | 説明 |
| --- | --- |
| `npx qiita init` | プロジェクトの初期設定を行い、設定ファイル（`qiita.config.json`）やGitHub Actionsのワークフローファイルを生成します。 |
| `npx qiita login` | Qiitaのアクセストークンを登録し、アカウントを連携させます。 |
| `npx qiita preview` | ローカルでプレビュー用のサーバーを起動し、ブラウザで記事の表示を確認しながら執筆できます。 |
| `npx qiita new <ファイル名>` | 新しい記事のMarkdownファイルを生成します。 |
| `npx qiita publish <ファイル名>` | 指定した記事をQiitaに投稿または更新します。`--all`オプションで全記事を対象にできます。 |
| `npx qiita pull` | Qiita上の記事の変更をローカルのファイルに反映させます。 |
| `npx qiita version` | インストールされているQiita CLIのバージョンを表示します。 |
| `npx qiita help` | 利用可能なコマンドやオプションのヘルプを表示します。 |

## GitHub Actionsとの連携

`.github/workflows/publish.yml` が存在する場合、リポジトリにプッシュするだけで記事を自動で投稿・更新できます。

