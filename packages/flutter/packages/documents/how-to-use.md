
# 環境構築とプロジェクト作成の覚書

---

## 環境構築手順

### Dartのinstall

```bash
# Dart SDK の install
brew tap dart-lang/dart
brew install dart
```

### flutter

- 以下からzipファイルを入手＆解答する
  - [macOS install \- Flutter](https://flutter.dev/docs/get-started/install/macos)

- 適当な場所に配置し、Pathを通す

```bash
echo 'export PATH=$PATH:/Users/ユーザ名/development/flutter/bin' >> ~/.zshrc
```

- 必要なアプリを確認する

```bash
flutter precache
flutter doctor
```

- 上記コマンドがmacosのセキュリティによりブロックされる場合は、
  - システム設定>セキュリティ>一般>ダウンロードしたアプリケーションの許可、で許可する必要がある

### xcodeのセットアップ

- xcodeのinstall

  ```bash
  # xcodeのinstall
  xcode-select --install

  sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
  sudo xcodebuild -runFirstLaunch
  ```

- xcode-selectコマンドについては以下を参照
  - [xcode\-selectによるデベロッパディレクトリ管理 \- Qiita](https://qiita.com/gooichi/items/017cf84ec52726ccd785)

- CocoaPodsというプラグインも必要なので入れておく
  ```bash
  sudo gem install cocoapods
  ```


### android studioのセットアップ

- 以下からdmgファイルをダウンロード
  - [Download Android Studio and SDK tools  \|  Android Developers](https://developer.android.com/studio/index.html)

- android studio を起動する

- android studio 初期画面からnextを押して各種installする
  ```
  Setup Type: Standard
  SDK Folder: /Applications/Unity/Hub/Editor/2020.3.0f1/PlaybackEngines/AndroidPlayer/SDK
  JDK Location: /Applications/Android Studio.app/Contents/jre/jdk/Contents/Home (Note: Gradle may be using JAVA_HOME when invoked from command line. More info...)
  Total Download Size: 1.49 GB
  ```

- android studio で コマンドラインツールも入れておく
  ```
  Open Tools > SDK Manager
  From the left choose, Appearance & Behavior > System Settings > Android SDK
  Select SDK Tools from the top menu
  Check Android SDK Command-line tools and click 'apply'.
  ```

- 以下の手順で android studio に Flutter と Dart のプラグインを導入する
  ```
  起動画面から
  1. Configure->Pluginsを選択
  2. 検索ボックスにFlutterと入力
  3. 出てきたFlutterという名称のプラグインをインストール
  ※DartプラグインはFlutterプラグインのインストールと同時にインストールされる
  ```

- [flutter doctorでのエラー突破方法　191216 \- Qiita](https://qiita.com/zushinohigashi/items/6b32738141779a2e7815)

### 最後に確認

```bash
flutter doctor
```

### 参考

- [macOS install \- Flutter](https://flutter.dev/docs/get-started/install/macos)
- [初心者のMac \+ Dart \+ Flutter 開発環境構築 \- Qiita](https://qiita.com/yorokobi_kannsya/items/ddaa61c8d67abfabd58f)


---

## プロジェクト作成

### コマンド

```bash
flutter create -i swift -a kotlin --org com.<CompanyName> --description "Example Flutter project." client
````

- `-i swift`
  - swift or objc を選択できる
  - iosディテクトリでswiftサポートの有無
  - swiftを指定しておくことでAppDelegate.swiftが生成される
  - プラットフォーム固有の処理を書きたい場合にswiftで開発可能

- `-a kotlin`
  - kotlin or java を選択できる
  - androidディテクトリでswiftサポートの有無
  - kotlinを指定しておくことでMainActivity.ktが生成される
  - プラットフォーム固有の処理を書きたい場合にkotlinで開発可能

- `--org com.<CompanyName>`
  - 以下のものとしてで使用される
    - androidならパッケージやapplicationId
    - iosならBundleIdentifer

- `description`
  - pubspec.yamlのdescriptionやREADME.mdに記述される

- [Flutterコマンド一覧まとめ \- Qiita](https://qiita.com/kurun_pan/items/f9251b1827ce9dca9e14)

