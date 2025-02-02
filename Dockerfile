FROM node:16

WORKDIR /app

# Menyalin semua file dari repositori ke dalam container
COPY . .

# Install unzip dan curl untuk mengunduh file ZIP
RUN apt-get update && apt-get install -y unzip curl

# Download file ZIP dari GitHub dan ekstrak ke dalam folder /app/extracted_files
RUN curl -L https://github.com/gayong309/Web/raw/main/web.zip -o web.zip && \
    unzip web.zip -d /app/extracted_files

# Install dependensi aplikasi (misalnya jika ada Node.js yang dibutuhkan)
RUN npm install

# Perintah untuk menjalankan aplikasi (misalnya menggunakan Express.js)
CMD ["npm", "start"]
