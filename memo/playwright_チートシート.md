---
title: Playwright チートシート
tags:
  - Playwright
  - E2Eテスト
private: true
---

# Playwright チートシート

Playwrightは、信頼性の高いエンドツーエンドテストのためのフレームワークです。

## 主な特徴

*   **クロスブラウザ対応:** Chromium, Firefox, WebKitをサポート
*   **クロスプラットフォーム対応:** Windows, Linux, macOSで動作
*   **多言語対応:** TypeScript, JavaScript, Python, .NET, Javaで利用可能
*   **強力な自動待機機能:** 要素が表示されるまで自動で待機するため、不安定なテストを減らせる
*   **多彩な機能:** テストジェネレーター、トレースビューアなど

## インストール

```bash
npm init playwright@latest
```

## 主なコマンド

| コマンド | 説明 |
| --- | --- |
| `npx playwright test` | テストを実行します。 |
| `npx playwright test <ファイル名>` | 指定したファイルのテストを実行します。 |
| `npx playwright test --ui` | UIモードでテストを起動し、インタラクティブにデバッグできます。 |
| `npx playwright test --project=chromium` | 指定したブラウザでテストを実行します。 |
| `npx playwright codegen <URL>` | ブラウザ操作を記録し、テストコードを自動生成します。 |
| `npx playwright show-report` | HTML形式のテストレポートを表示します。 |
| `npx playwright install` | Playwrightが必要とするブラウザをインストールします。 |

## 基本的なテストの書き方 (TypeScript)

```typescript
import { test, expect } from '@playwright/test';

test('ページのタイトルが正しいことを確認する', async ({ page }) => {
  await page.goto('https://playwright.dev/');

  // "Playwright" というテキストを含むタイトルを期待する
  await expect(page).toHaveTitle(/Playwright/);
});

test('"Get started" リンクが正しく機能することを確認する', async ({ page }) => {
  await page.goto('https://playwright.dev/');

  // "Get started" リンクをクリックする
  await page.getByRole('link', { name: 'Get started' }).click();

  // "Installation" というテキストを含むh1要素が表示されることを期待する
  await expect(page.getByRole('heading', { name: 'Installation' })).toBeVisible();
});
```

## よく使うAPI

| API | 説明 |
| --- | --- |
| `page.goto(url)` | 指定したURLに移動します。 |
| `page.locator(selector)` | 要素を特定するためのロケーターを作成します。CSSセレクタやXPathを使用できます。 |
| `locator.click()` | 要素をクリックします。 |
| `locator.fill(value)` | 入力フィールドに値を入力します。 |
| `locator.check()` | チェックボックスをチェックします。 |
| `locator.uncheck()` | チェックボックスのチェックを外します。 |
| `locator.selectOption(value)` | ドロップダウンからオプションを選択します。 |
| `locator.screenshot()` | 要素のスクリーンショットを撮ります。 |
| `expect(locator).toBeVisible()` | 要素が表示されていることを検証します。 |
| `expect(locator).toHaveText(text)` | 要素が指定したテキストを持っていることを検証します。 |
| `expect(page).toHaveURL(url)` | ページのURLが指定したものと一致することを検証します。 |

