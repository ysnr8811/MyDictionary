- [1. Next.js チートシート (App Routerベース)](#1-nextjs-チートシート-app-routerベース)
  - [1.1. プロジェクトのセットアップ](#11-プロジェクトのセットアップ)
  - [1.2. ファイルベースルーティング](#12-ファイルベースルーティング)
  - [1.3. 基本的なページの作成](#13-基本的なページの作成)
  - [1.4. サーバーコンポーネントとクライアントコンポーネント](#14-サーバーコンポーネントとクライアントコンポーネント)
      - [1.4.0.1. サーバーコンポーネント (デフォルト)](#1401-サーバーコンポーネント-デフォルト)
      - [1.4.0.2. クライアントコンポーネント](#1402-クライアントコンポーネント)
  - [1.5. レイアウト (`layout.js`)](#15-レイアウト-layoutjs)
  - [1.6. ページ間のリンク (`<Link>`)](#16-ページ間のリンク-link)
  - [1.7. 動的ルート](#17-動的ルート)
  - [1.8. APIルート (`route.js`)](#18-apiルート-routejs)
  - [1.9. メタデータとSEO](#19-メタデータとseo)


# 1. Next.js チートシート (App Routerベース)

Next.jsは、Reactをベースにしたフルスタックフレームワークです。サーバーサイドレンダリング（SSR）、静的サイト生成（SSG）、ファイルベースルーティングなどの機能を提供します。このチートシートは、**App Router**の基本的な使い方をまとめたものです。

---

## 1.1. プロジェクトのセットアップ

`create-next-app` を使って、新しいNext.jsプロジェクトをセットアップします。

```bash
# "my-next-app"の部分は好きなプロジェクト名に変更してください
npx create-next-app@latest my-next-app

# 作成されたディレクトリに移動
cd my-next-app

# 開発サーバーを起動
npm run dev
```

---

## 1.2. ファイルベースルーティング

`app` ディレクトリ内にフォルダを作成すると、それがURLのパスになります。各フォルダに `page.js` (または `.jsx`, `.tsx`) を置くと、そのページのUIが定義されます。

- `app/page.js` → `/`
- `app/about/page.js` → `/about`
- `app/dashboard/settings/page.js` → `/dashboard/settings`

---

## 1.3. 基本的なページの作成

ページはReactコンポーネントとして作成します。`export default` する必要があります。

`app/about/page.js`:
```jsx
export default function AboutPage() {
  return <h1>このサイトについて</h1>;
}
```

---

## 1.4. サーバーコンポーネントとクライアントコンポーネント

App Routerでは、コンポーネントはデフォルトで**サーバーコンポーネント**になります。インタラクティブな機能（`useState`, `useEffect`, イベントハンドラなど）が必要な場合は、ファイルの先頭に `'use client'` を記述して**クライアントコンポーネント**にする必要があります。

#### 1.4.0.1. サーバーコンポーネント (デフォルト)
- サーバーでのみレンダリングされる。
- `async/await` を使って直接データ取得ができる。
- `useState` や `useEffect` は使えない。

`app/page.js`:
```jsx
// サーバーコンポーネントでデータを直接取得
async function getData() {
  const res = await fetch('https://api.example.com/data');
  return res.json();
}

export default async function HomePage() {
  const data = await getData();
  return <div>{data.message}</div>;
}
```

#### 1.4.0.2. クライアントコンポーネント
- ユーザーのブラウザでレンダリング・実行される。
- `useState`, `useEffect`, `onClick` などのフックやイベントが使える。

`app/components/Counter.js`:
```jsx
'use client'; // クライアントコンポーネント宣言

import { useState } from 'react';

export default function Counter() {
  const [count, setCount] = useState(0);

  return (
    <button onClick={() => setCount(count + 1)}>
      Count: {count}
    </button>
  );
}
```

---

## 1.5. レイアウト (`layout.js`)

`layout.js` は、複数のページで共有されるUI（ヘッダー、フッターなど）を定義します。`children` propを受け取り、その中にページの内容が表示されます。

`app/layout.js` (ルートレイアウト):
```jsx
// このレイアウトは全てのページに適用される
export default function RootLayout({ children }) {
  return (
    <html lang="ja">
      <body>
        <header>共通ヘッダー</header>
        <main>{children}</main>
        <footer>共通フッター</footer>
      </body>
    </html>
  );
}
```

---

## 1.6. ページ間のリンク (`<Link>`)

ページ遷移には、`<a>` タグではなく Next.js の `<Link>` コンポーネントを使います。これにより、ページ全体をリロードせずに高速なクライアントサイドナビゲーションが実現します。

```jsx
import Link from 'next/link';

export default function Header() {
  return (
    <nav>
      <Link href="/">ホーム</Link>
      <Link href="/about">アバウト</Link>
      <Link href="/blog">ブログ</Link>
    </nav>
  );
}
```

---

## 1.7. 動的ルート

角括弧 `[]` を使って、動的なURLセグメントを持つページを作成できます。ブログ記事や商品詳細ページなどで使われます。

`app/blog/[slug]/page.js`:
- `[slug]` の部分はURLの可変部分になります (例: `/blog/my-first-post`)。
- `params` オブジェクトから動的な値を取得できます。

```jsx
// URLが /blog/hello-world の場合、paramsは { slug: 'hello-world' } になる
export default function BlogPost({ params }) {
  return <h1>記事タイトル: {params.slug}</h1>;
}
```

---

## 1.8. APIルート (`route.js`)

`app/api` ディレクトリ内に `route.js` を作成することで、APIエンドポイントを定義できます。

`app/api/hello/route.js`:
```js
// GETリクエストに対する処理
// エンドポイント: /api/hello
export async function GET(request) {
  return new Response(JSON.stringify({ message: 'Hello, World!' }), {
    status: 200,
    headers: {
      'Content-Type': 'application/json',
    },
  });
}
```

---

## 1.9. メタデータとSEO

`page.js` や `layout.js` で `metadata` オブジェクトをエクスポートすることで、ページの `<head>` タグを簡単に設定できます。

`app/page.js`:
```jsx
import { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'ホームページ | 私のサイト',
  description: 'Next.jsで作られた素晴らしいサイトです。',
};

export default function HomePage() {
  return <h1>ようこそ！</h1>;
}
```
