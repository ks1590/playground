## Terraform による AWS Lambda の実装 (試行)

AWS Lambda を Terraform で実装する基本的な手順とサンプルスクリプトについて議論しました。

1.  **Terraform のインストールと設定:** 事前準備として Terraform と AWS CLI のインストールと設定が必要です。
2.  **プロジェクトディレクトリの作成:** Terraform ファイルを保存するディレクトリを作成します。
3.  **Terraform 設定ファイル (`main.tf`) の作成:** IAM ロール、ポリシー、Lambda 関数などを定義する Terraform コードを記述します。
4.  **Lambda 関数のコードの準備 (`index.js`):** Lambda 関数が実行する Node.js コードを作成します。
5.  **Lambda 関数のコードを ZIP ファイルに圧縮:** 作成した Node.js コードを ZIP ファイルにまとめます。
6.  **Terraform の初期化:** `terraform init` コマンドでプロバイダーなどを初期化します。
7.  **Terraform の実行計画の確認:** `terraform plan` コマンドで作成されるリソースを確認します。
8.  **Terraform の適用:** `terraform apply` コマンドで実際に AWS リソースを作成します。
9.  **Lambda 関数のテスト:** AWS コンソールで作成された Lambda 関数をテストします。
10. **リソースの削除 (cleanup):** 不要になったリソースは `terraform destroy` コマンドで削除します。
