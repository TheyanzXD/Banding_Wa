# Bot Telegram Pengirim Banding WhatsApp

Bot Telegram sederhana yang membantu mengirimkan permintaan aktivasi nomor (banding) ke support WhatsApp menggunakan berbagai akun Gmail.

## Fitur

*   Mengirim email banding ke `android@support.whatsapp.com`.
*   Menggunakan banyak akun Gmail untuk pengiriman (rotasi).
*   Melacak status pengiriman (berhasil/gagal) per akun.
*   Sistem akses pengguna (memerlukan persetujuan owner).
*   Perintah untuk owner: mengelola pengguna, mengganti mode bot, melihat statistik, dll.
*   Antarmuka CLI yang ditingkatkan menggunakan `rich`.

## Prasyarat

*   [Python 3](https://www.python.org/downloads/) (versi 3.8 atau lebih tinggi direkomendasikan)
*   [pip](https://pip.pypa.org/installing/)

## Instalasi

1.  **Clone atau unduh kode sumber bot ini.**
    ```bash
    git clone https://github.com/TheyanzXD/Banding_Wa
    cd Banding_Wa
    unzip bot.zip
    make help
    ```
    Atau unduh dan ekstrak file `.zip`.

2.  **(Opsional, tetapi sangat direkomendasikan) Buat dan aktifkan virtual environment Python:**


3.  **Instal dependensi yang diperlukan:**
    ```bash
    pip install python-telegram-bot rich
    ```

4.  **Konfigurasi Bot:**
    *   Buka file `config.py` dengan editor teks.
    *   Ganti nilai `BOT_TOKEN` dengan token bot Telegram yang kamu dapatkan dari [@BotFather](https://t.me/BotFather).
    *   Ganti nilai `OWNER_ID` dengan ID Telegram kamu.
    *   (Opsional) Perbarui daftar `ACCOUNTS` di `bot.py` dengan akun Gmail dan App Password yang valid milik kamu.

## Penggunaan

### Menggunakan Makefile (Direkomendasikan)

1.  Pastikan kamu berada di direktori yang berisi `Makefile` dan `bot.py`.
2.  Jalankan bot:
    ```bash
    make run
    ```

### Menggunakan Python Langsung

1.  Pastikan kamu berada di direktori yang berisi `bot.py`.
2.  Jika kamu membuat virtual environment, aktifkan dulu.
3.  Jalankan bot:
    ```bash
    python3 bot.py
    ```

Bot akan mulai berjalan dan siap menerima perintah dari Telegram.

## Perintah

*   **Pengguna:**
    *   `/start` - Memulai percakapan.
    *   `/help` - Melihat daftar perintah.
    *   `/myid` - Melihat ID Telegram sendiri.
    *   `/send <nomor>` - Mengirim banding (memerlukan akses).
    *   `/addgmail <email> <apppw>` - (Opsional, jika diimplementasikan) Menambahkan akun Gmail untuk verifikasi otomatis.

*   **Owner:**
    *   `/help` - Melihat perintah tambahan.
    *   `/setcooldown <detik>` - Mengatur jeda pengiriman.
    *   `/mode <chat|group|all>` - Mengatur mode bot.
    *   `/list_requests` - Melihat permintaan akses.
    *   `/revoke <id>` - Mencabut akses pengguna.
    *   `/bc <pesan>` - Mengirim pesan broadcast.
    *   `/stats` - Melihat statistik bot.
    *   `/emailstatus` - Melihat status akun email (jika diimplementasikan).

## Troubleshooting

*   **`pkg_resources` warning:** Ini adalah peringatan dari dependensi dan biasanya tidak menghentikan bot.
*   **`SMTP error: Username and Password not accepted`:** Pastikan App Password yang digunakan di `ACCOUNTS` benar dan belum kadaluarsa. Aktifkan 2FA dan buat App Password baru di akun Google.
*   **`Terminated` saat menjalankan:** Periksa apakah ada instance bot lain yang sedang berjalan. Skrip mungkin memiliki mekanisme lock file yang mencoba menghentikan proses lama.

## Lisensi

[Gunakan lisensi pilihan kamu, misalnya MIT, Apache 2.0, atau kosongkan jika tidak ada]
