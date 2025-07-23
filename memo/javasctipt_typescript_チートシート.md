- [1. JavaScript vs TypeScript チートシート for Beginners](#1-javascript-vs-typescript-チートシート-for-beginners)
  - [1.1. TypeScriptとは？](#11-typescriptとは)
  - [1.2. 変数の型定義](#12-変数の型定義)
      - [1.2.0.1. JavaScript (型定義なし)](#1201-javascript-型定義なし)
      - [1.2.0.2. TypeScript (型定義あり)](#1202-typescript-型定義あり)
  - [1.3. 配列 (Array)](#13-配列-array)
      - [1.3.0.1. JavaScript](#1301-javascript)
      - [1.3.0.2. TypeScript](#1302-typescript)
  - [1.4. オブジェクト (Object)](#14-オブジェクト-object)
      - [1.4.0.1. JavaScript](#1401-javascript)
      - [1.4.0.2. TypeScript](#1402-typescript)
  - [1.5. 関数 (Function)](#15-関数-function)
      - [1.5.0.1. JavaScript](#1501-javascript)
      - [1.5.0.2. TypeScript](#1502-typescript)
  - [1.6. 型の再利用 (Interface / Type Alias)](#16-型の再利用-interface--type-alias)
      - [1.6.0.1. JavaScript (該当なし)](#1601-javascript-該当なし)
      - [1.6.0.2. TypeScript](#1602-typescript)
  - [1.7. クラス (Class)](#17-クラス-class)
      - [1.7.0.1. JavaScript](#1701-javascript)
      - [1.7.0.2. TypeScript](#1702-typescript)


# 1. JavaScript vs TypeScript チートシート for Beginners

このチートシートは、JavaScriptの知識をベースに、TypeScriptの基本的な特徴や書き方を比較しながら学べるように構成されています。

---

## 1.1. TypeScriptとは？

TypeScriptは、JavaScriptに**静的な型付け**機能を追加したスーパーセット（上位互換）言語です。書いたコードは最終的にJavaScriptにコンパイル（変換）されて実行されます。

- **JavaScript**: 動的型付け。実行時まで型がチェックされない。
- **TypeScript**: 静的型付け。コードを書いている段階で型がチェックされるため、エラーを早期に発見できる。

---

## 1.2. 変数の型定義

TypeScriptでは、変数名の後に `: 型` をつけることで、その変数が持つデータの型を明示します。

#### 1.2.0.1. JavaScript (型定義なし)
```javascript
let name = 'Alice';      // string型
let age = 30;            // number型
let isStudent = false;   // boolean型

// 再代入で型が変わってしまう（エラーにならない）
name = 123;
```

#### 1.2.0.2. TypeScript (型定義あり)
```typescript
let name: string = 'Alice';
let age: number = 30;
let isStudent: boolean = false;

// 型が違う値を再代入しようとすると、コンパイルエラーになる
// name = 123; // Error: Type 'number' is not assignable to type 'string'.

// 型推論も効くので、多くの場合で型指定は省略可能
let country = 'Japan'; // `string`型だと自動で推論される
```

---

## 1.3. 配列 (Array)

配列に含まれる要素の型を指定します。

#### 1.3.0.1. JavaScript
```javascript
const hobbies = ['coding', 'reading', 100]; // どんな型の組み合わせもOK
```

#### 1.3.0.2. TypeScript
```typescript
// string型の要素だけを持つ配列
const hobbies: string[] = ['coding', 'reading'];

// number型の要素だけを持つ配列（別記法）
const scores: Array<number> = [88, 92, 75];

// hobbies.push(100); // Error: Argument of type 'number' is not assignable to parameter of type 'string'.
```

---

## 1.4. オブジェクト (Object)

オブジェクトの各プロパティの型を定義できます。

#### 1.4.0.1. JavaScript
```javascript
const user = {
  name: 'Taro',
  age: 25
};
```

#### 1.4.0.2. TypeScript
```typescript
const user: { name: string; age: number } = {
  name: 'Taro',
  age: 25
};

// user.age = 'twenty-five'; // Error: Type 'string' is not assignable to type 'number'.
```

---

## 1.5. 関数 (Function)

関数の引数と戻り値の型を定義します。

#### 1.5.0.1. JavaScript
```javascript
function add(a, b) {
  return a + b;
}

add(1, '2'); // '12' という文字列が返る。意図しない動作の可能性。
```

#### 1.5.0.2. TypeScript
```typescript
function add(a: number, b: number): number {
  return a + b;
}

// add(1, '2'); // Error: Argument of type 'string' is not assignable to parameter of type 'number'.

// 戻り値がない場合は `void` を使う
function logMessage(message: string): void {
  console.log(message);
}
```

---

## 1.6. 型の再利用 (Interface / Type Alias)

TypeScriptでは、複雑な型定義に名前をつけて再利用できます。`interface` や `type` が使われます。

#### 1.6.0.1. JavaScript (該当なし)

同じ構造のオブジェクトでも、その都度作成します。

#### 1.6.0.2. TypeScript

**Interface (インターフェース)**
オブジェクトの型定義に適しています。
```typescript
interface UserProfile {
  name: string;
  age: number;
  isActive?: boolean; // `?` をつけると、そのプロパティは任意（なくても良い）になる
}

const user1: UserProfile = { name: 'Hanako', age: 32 };
const user2: UserProfile = { name: 'Jiro', age: 28, isActive: true };
```

**Type Alias (型エイリアス)**
より柔軟に、プリミティブ型や合併型などにも名前をつけられます。
```typescript
// オブジェクトの型エイリアス
type Point = {
  x: number;
  y: number;
};

// 合併型（Union Type）のエイリアス
type ID = string | number;

let userId: ID = 'user-123';
userId = 456; // OK
```

---

## 1.7. クラス (Class)

クラスのプロパティやメソッドの型を定義できます。

#### 1.7.0.1. JavaScript
```javascript
class Person {
  constructor(name) {
    this.name = name;
  }

  greet() {
    return `Hello, my name is ${this.name}`;
  }
}
```

#### 1.7.0.2. TypeScript
```typescript
class Person {
  // プロパティの型を宣言
  name: string;

  constructor(name: string) {
    this.name = name;
  }

  greet(): string {
    return `Hello, my name is ${this.name}`;
  }
}

// コンストラクタの引数に `public` をつけると、プロパティ宣言と代入を省略できる
class Animal {
  constructor(public name: string) {}

  move(distance: number): void {
    console.log(`${this.name} moved ${distance}m.`);
  }
}
```
