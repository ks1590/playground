import { defineConfig } from 'vite';
import { resolve } from 'path';

export default defineConfig({
  build: {
    lib: {
      entry: resolve(__dirname, 'src/index.ts'),
      name: 'MyLibrary',
      fileName: 'my-library',
    },
    rollupOptions: {
      external: [],
      output: {
        exports: 'named', // 名前付きエクスポートとして出力
        globals: {},
      },
    },
  },
});
