- [1. 画面遷移](#1-画面遷移)
- [2. フォルダ構成について](#2-フォルダ構成について)
- [3. 作り方に関して](#3-作り方に関して)
  - [3.1. layout.js](#31-layoutjs)
  - [3.2. /app/components フォルダ](#32-appcomponents-フォルダ)
  - [3.3. "use client";　について](#33-use-clientについて)
  - [3.4. layout.tsxでのタブの表示編集](#34-layouttsxでのタブの表示編集)


# 1. 画面遷移
[画面遷移の方法](https://nextjs.org/docs/app/building-your-application/routing/linking-and-navigating)

# 2. フォルダ構成について
[フォルダ構成](https://nextjs.org/docs/app/getting-started/layouts-and-pages)

# 3. 作り方に関して

## 3.1. layout.js
共通するUIを記述するためのファイル

## 3.2. /app/components フォルダ
アプリケーション内で再利用可能なUI部品（Reactコンポーネント）をまとめて管理するためのフォルダ

とにかくコンポーネントはここに入れること

## 3.3. "use client";　について
クライアントサイドで実行されるファイルであることを明示的に記述する

何も書かれていなければサーバーサイドで処理が実行される

## 3.4. layout.tsxでのタブの表示編集

```tsx
export const metadata: Metadata = {
  title: "Book-Major",
  description: "Book-Major"
};
```


