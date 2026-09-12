import fs from 'node:fs'
import { fileURLToPath, URL } from 'node:url'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import tailwindcss from '@tailwindcss/vite'

// Aspire assigns the port and reaches the app through the gateway, so the dev
// server must accept the gateway hostname as well as localhost.
export default defineConfig({
  plugins: [
    // shadcn-vue components take prop types from reka-ui, so the SFC compiler
    // needs file access to resolve types across package boundaries.
    vue({
      script: {
        fs: {
          fileExists: (file: string) => fs.existsSync(file),
          readFile: (file: string) => fs.readFileSync(file, 'utf-8'),
        },
      },
    }),
    tailwindcss(),
  ],
  resolve: { alias: { '@': fileURLToPath(new URL('./src', import.meta.url)) } },
  server: {
    host: '127.0.0.1',
    port: Number(process.env.PORT) || 5180,
    strictPort: true,
    allowedHosts: ['localhost', '127.0.0.1'],
  },
})
