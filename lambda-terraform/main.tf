# AWSプロバイダーの設定
provider "aws" {
  region = "ap-northeast-1" # あなたの利用したいAWSリージョンを指定
  profile = "ks-1590"
}

# Lambda関数が実行時に使用するIAMロールの作成
resource "aws_iam_role" "lambda_role" {
  name = "my-first-lambda-role"

  # Lambdaサービスがこのロールを引き受けることを許可するポリシー
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

# Lambda関数に付与する基本的な権限ポリシー (CloudWatch Logsへの書き込み)
resource "aws_iam_policy" "lambda_policy" {
  name        = "my-first-lambda-policy"
  description = "Basic execution policy for Lambda function"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ],
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      },
    ]
  })
}

# IAMロールにポリシーをアタッチ
resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

# Lambda関数の定義
resource "aws_lambda_function" "my_lambda" {
  function_name    = "my-first-lambda-function"
  handler          = "index.handler" # Lambda関数のエントリポイント (例: index.js の handler関数)
  runtime          = "nodejs20.x"    # 実行環境 (Node.jsのバージョンを指定)
  memory_size      = 128             # メモリ割り当て (MB)
  timeout          = 30              # タイムアウト (秒)
  filename         = "lambda_function.zip" # Lambda関数のコードを含むZIPファイル名
  source_code_hash = filebase64sha256("lambda_function.zip") # ZIPファイルのハッシュ値 (変更検知用)
  role             = aws_iam_role.lambda_role.arn
  publish          = true            # デプロイ時に新しいバージョンを公開するかどうか

  environment {
    variables = {
      MESSAGE = "Hello from Lambda!"
    }
  }

  tags = {
    Environment = "development"
    Project     = "first-lambda"
  }
}

# Lambda関数のARNを出力
output "lambda_function_arn" {
  value = aws_lambda_function.my_lambda.arn
}