
# terraform-template

- terraformテンプレート

## usage

### 準備

```bash
# terraform.tfvars ファイルを用意&適宜修正
cd ./terraform-template
cp -rp ./terraform.tfvars.sample ./terraform.tfvars
vim ./terraform.tfvars
```

### コマンド

```bash
# 作成
yarn run apply

# 削除
yarn run destroy
```

