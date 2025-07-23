- [1. Reactチートシート for Beginners](#1-reactチートシート-for-beginners)
  - [1.1. プロジェクトのセットアップ (Vite)](#11-プロジェクトのセットアップ-vite)
  - [1.2. 基本的なコンポーネント](#12-基本的なコンポーネント)
  - [1.3. Props (プロパティ)](#13-props-プロパティ)
  - [1.4. State (状態) と `useState` フック](#14-state-状態-と-usestate-フック)
  - [1.5. イベント処理](#15-イベント処理)
  - [1.6. 条件付きレンダリング](#16-条件付きレンダリング)
      - [1.6.0.1. 三項演算子](#1601-三項演算子)
      - [1.6.0.2. 論理積演算子 (`&&`)](#1602-論理積演算子-)
  - [1.7. リストのレンダリング](#17-リストのレンダリング)
  - [1.8. `useEffect` フック](#18-useeffect-フック)


# 1. Reactチートシート for Beginners

Reactは、ユーザーインターフェースを構築するための人気のJavaScriptライブラリです。このチートシートは、初心者がよく使う基本的な概念と構文をまとめたものです。

---

## 1.1. プロジェクトのセットアップ (Vite)

現在推奨されている方法の一つであるViteを使って、新しいReactプロジェクトを素早くセットアップします。

```bash
# "my-react-app"の部分は好きなプロジェクト名に変更してください
npm create vite@latest my-react-app -- --template react

# 作成されたディレクトリに移動
cd my-react-app

# 依存関係をインストール
npm install

# 開発サーバーを起動
npm run dev
```

---

## 1.2. 基本的なコンポーネント

ReactのUIは「コンポーネント」と呼ばれる独立した部品から作られます。コンポーネントは関数として定義するのが一般的です。

- ファイル名: `Greeting.jsx`
- コンポーネント名は常に大文字で始めます。
- JSXは、HTMLのように見えますが、JavaScriptの拡張構文です。
- コンポーネントは単一のルート要素を返す必要があります。複数の要素は `<div>` や `<>` (フラグメント) で囲みます。

```jsx
// Greetingコンポーネントの定義
function Greeting() {
  return <h1>こんにちは、React！</h1>;
}

export default Greeting;
```

---

## 1.3. Props (プロパティ)

`props` を使うと、親コンポーネントから子コンポーネントへデータを渡すことができます。

```jsx
// 親コンポーネント (App.jsxなど)
import UserProfile from './UserProfile';

function App() {
  return <UserProfile name="田中" age={28} />;
}

// 子コンポーネント (UserProfile.jsx)
// propsオブジェクトとしてデータを受け取る
function UserProfile(props) {
  return (
    <div>
      <p>名前: {props.name}</p>
      <p>年齢: {props.age}</p>
    </div>
  );
}

// 分割代入を使うとよりシンプルに書けます
function UserProfile({ name, age }) {
  return (
    <div>
      <p>名前: {name}</p>
      <p>年齢: {age}</p>
    </div>
  );
}
```

---

## 1.4. State (状態) と `useState` フック

`useState` は、コンポーネント内に「状態（state）」を持たせるためのフック（特別な関数）です。状態が変化すると、コンポーネントは自動的に再レンダリングされます。

```jsx
import { useState } from 'react';

function Counter() {
  // useStateフックで状態を宣言
  // count: 現在の状態の値
  // setCount: 状態を更新するための関数
  const [count, setCount] = useState(0); // 初期値は0

  return (
    <div>
      <p>現在のカウント: {count}</p>
      {/* ボタンをクリックするとsetCountが呼ばれ、countが更新される */}
      <button onClick={() => setCount(count + 1)}>
        カウントアップ
      </button>
    </div>
  );
}
```

---

## 1.5. イベント処理

ユーザーのアクション（クリック、入力など）に応じた処理を定義します。

- `onClick`, `onChange` などのイベントハンドラを使います。
- `{}` の中に、実行したい関数を渡します。

```jsx
function AlertButton() {
  const handleClick = () => {
    alert('ボタンがクリックされました！');
  };

  return <button onClick={handleClick}>クリックしてね</button>;
}
```

---

## 1.6. 条件付きレンダリング

特定の条件に基づいて、表示するコンポーネントや要素を切り替えます。

#### 1.6.0.1. 三項演算子

`条件 ? A : B` という形式で、条件がtrueならAを、falseならBを表示します。

```jsx
function LoginStatus({ isLoggedIn }) {
  return (
    <div>
      {isLoggedIn ? <p>ようこそ！</p> : <p>ログインしてください。</p>}
    </div>
  );
}
```

#### 1.6.0.2. 論理積演算子 (`&&`)

`条件 && A` という形式で、条件がtrueの場合のみAを表示します。

```jsx
function Mailbox({ unreadMessages }) {
  return (
    <div>
      <h1>受信トレイ</h1>
      {unreadMessages.length > 0 && (
        <h2>
          {unreadMessages.length}件の未読メッセージがあります。
        </h2>
      )}
    </div>
  );
}
```

---

## 1.7. リストのレンダリング

配列のデータを元に、リスト形式で要素を表示します。

- `map()` メソッドを使って、配列の各要素をJSX要素に変換します。
- リスト内の各要素には、兄弟要素間で一意となる **`key`** propを必ず指定します。Reactが変更を効率的に追跡するために必要です。

```jsx
function TodoList({ todos }) {
  // todosは { id: 1, text: '買い物' } のようなオブジェクトの配列を想定
  const listItems = todos.map(todo => (
    <li key={todo.id}>
      {todo.text}
    </li>
  ));

  return <ul>{listItems}</ul>;
}
```

---

## 1.8. `useEffect` フック

`useEffect` は、コンポーネントのレンダリング後に特定の処理（副作用）を実行するためのフックです。APIからのデータ取得、イベントリスナーの登録などに使われます。

```jsx
import { useState, useEffect } from 'react';

function Timer() {
  const [count, setCount] = useState(0);

  // useEffectの基本形
  useEffect(() => {
    // この中のコードは、コンポーネントがマウント（初回表示）された後に実行される
    document.title = `カウント: ${count}`;

    // 第2引数の配列に指定した値が変更された時だけ、この関数が再実行される
  }, [count]); // countが変更されるたびにタイトルを更新

  // 第2引数に空の配列 [] を渡すと、初回レンダリング時に一度だけ実行される
  useEffect(() => {
    console.log('コンポーネントがマウントされました');
  }, []);

  return (
    <div>
      <p>カウント: {count}</p>
      <button onClick={() => setCount(c => c + 1)}>+</button>
    </div>
  );
}
```
