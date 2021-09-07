
# template-pj

- これは、テンプレートプロジェクトです

---

## Build Setup

```bash
# モジュールインストール
yarn install

# ローカルで起動
yarn dev

# buildとstart
yarn build
yarn start

# 静的なウェブアプリケーションを生成
yarn generate
```

- 参考: [Nuxt.js docs](https://nuxtjs.org)

---

## nuxt(vuex)のtypescript化への道のり

### 前提

- 型推論が100%完璧ではないが完璧を目指すのは茨の道、とのこと。
- ある程度妥協して、まあ使えるよね、程度の環境構築を以下に示す

###  Nuxtプロジェクトの生成

```bash
npx create-nuxt-app <PJ_NAME>
```

### 相性は良くないと噂のvuexを頑張ってts化する作業

- 一応、vuexという公式の大船に乗っかっておきたいので頑張る

```bash
yarn add nuxt-typed-vuex
```

- `nuxt.config.js`を以下のように修正

```
@@ -40,7 +40,9 @@ export default {
     // https://go.nuxtjs.dev/typescript
     '@nuxt/typescript-build',
     // https://go.nuxtjs.dev/vuetify
-    '@nuxtjs/vuetify'
+    '@nuxtjs/vuetify',
+    // vuexのts化
+    'nuxt-typed-vuex'
   ],

   // Modules: https://go.nuxtjs.dev/config-modules
@@ -73,5 +75,8 @@ export default {

   // Build Configuration: https://go.nuxtjs.dev/config-build
   build: {
+    transpile: [
+      /typed-vuex/,
+    ],
   }
 }
```

- [NuxtJS \+ Vuexでいい感じのTypescript環境をあまり頑張らないで構築する \- Qiita](https://qiita.com/shindex/items/a90217b9e4c03c5b5215)





