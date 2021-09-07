
# client

Example Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## ディレクトリ構成

- android/
  - androidネイティブのディレクトリ
  - このディレクトリをandroid studioで開くと普通のandroidプロジェクトとして使える
- build/
  - buildしたファイルを書き出すディレクトリ
  - バージョン管理からは外す
- ios/
  - iosネイティブのディレクトリ
  - このディレクトリをxcodeで開くと普通のiosプロジェクトとして使える
- lib/
  - Dartファイルはこのディレクトリ以下に配置する
  - サブディテクトリも作成できる
- test/
  - Dartのテストケースはこのディレクトリ以下に配置する
  - サブディレクトリも作成できる
- web/
  - webフロント用のディレクトリ
- pubspec.yaml
  - パッケージマネージャーとしての役割がある
  - ライブラリをここに追加する
- client.iml
  - Flutterアプリケーションのandroid studioのプロジェクトファイル
  - 開発する際はAndroid Studioでこのファイルを開く

## 起動コマンド

```bash
# 使用可能なディバイス一覧確認
flutter emulators
# apple_ios_simulator • iOS Simulator       • Apple  • ios
# Pixel_3a_API_30_x86 • Pixel_3a_API_30_x86 • Google • android

# ios起動
flutter emulators --launch apple_ios_simulator
# エミュレータ起動状態で
flutter run

# android起動
flutter emulators --launch Pixel_3a_API_30_x86
# エミュレータ起動状態で
flutter run

# web起動
flutter run -d chrome
```


```bash
# パッケージのインポート
flutter packages get
```

