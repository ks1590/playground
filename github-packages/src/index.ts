/**
 * サンプルライブラリ関数
 */

/**
 * 数値を2倍にする
 */
export function double(num: number): number {
  return num * 2;
}

/**
 * 文字列を結合する
 */
export function concatenate(str1: string, str2: string): string {
  return `${str1} ${str2}`;
}

// デフォルトエクスポート
export default {
  double,
  concatenate,
};
