# Gunakan image Node.js resmi sebagai base image
FROM node:18-alpine

# Tentukan working directory di dalam container
WORKDIR /app

# Salin file package.json dan package-lock.json (jika ada)
COPY package*.json ./

# Install dependencies
RUN npm install

# Salin semua file proyek ke dalam container
COPY . .

# Build aplikasi (Vite biasanya digunakan untuk development, pastikan mode build diaktifkan)
RUN npm run build

# Ekspose port di mana aplikasi akan berjalan (misalnya port 3000, sesuaikan dengan konfigurasi)
EXPOSE 3000

# Tentukan perintah untuk menjalankan aplikasi
CMD ["npm", "run", "preview"]

