# Makefile untuk bot.py

# Nama file utama bot
BOT_FILE := bot.py

# Nama virtual environment (opsional, bisa dihapus jika tidak digunakan)
VENV_NAME := venv
VENV_ACTIVATE := $(VENV_NAME)/bin/activate

# Cek apakah Python 3 tersedia
PYTHON := python3

# Cek apakah pip tersedia
PIP := pip3

# Target utama: jalankan bot (akan menginstal dependensi terlebih dahulu jika belum)
.PHONY: run
run: install check-deps
	@echo "Menjalankan bot..."
	$(PYTHON) $(BOT_FILE)

# Target untuk membuat virtual environment (opsional)
.PHONY: venv
venv:
	@echo "Membuat virtual environment di $(VENV_NAME)..."
	$(PYTHON) -m venv $(VENV_NAME)
	@echo "Virtual environment dibuat. Aktifkan dengan: source $(VENV_ACTIVATE)"

# Target untuk menginstal dependensi secara eksplisit
.PHONY: install
install:
	@echo "Menginstal dependensi..."
	# Pastikan pip up-to-date (opsional)
	$(PYTHON) -m pip install --upgrade pip
	# Instal dependensi yang diperlukan
	$(PIP) install python-telegram-bot rich
	@echo "Instalasi dependensi selesai."

# Target untuk memeriksa dependensi sebelum menjalankan bot
.PHONY: check-deps
check-deps:
	@echo "Memeriksa dependensi..."
	@which $(PYTHON) > /dev/null || (echo "Python 3 tidak ditemukan!"; exit 1)
	@which $(PIP) > /dev/null || (echo "Pip3 tidak ditemukan!"; exit 1)
	@echo "Python dan Pip ditemukan."

# Target untuk menghentikan bot (hanya contoh, Makefile tidak secara asinkron mengelola proses)
.PHONY: stop
stop:
	@echo "Gunakan Ctrl+C untuk menghentikan bot di terminal tempat bot dijalankan."

# Target untuk membersihkan file cache Python
.PHONY: clean
clean:
	@echo "Membersihkan file cache Python..."
	find . -type d -name "__pycache__" -delete
	find . -type f -name "*.pyc" -delete
	@echo "Pembersihan selesai."

# Target untuk bantuan
.PHONY: help
help:
	@echo "Makefile untuk bot.py"
	@echo ""
	@echo "Target-target:"
	@echo "  run         - Menginstal deps (jika perlu) dan menjalankan bot"
	@echo "  install     - Menginstal dependensi yang dibutuhkan (python-telegram-bot, rich)"
	@echo "  venv        - Membuat virtual environment (opsional)"
	@echo "  check-deps  - Memeriksa apakah Python dan Pip tersedia"
	@echo "  stop        - Petunjuk untuk menghentikan bot"
	@echo "  clean       - Menghapus file cache Python"
	@echo "  help        - Menampilkan bantuan ini (default)"
	@echo ""
	@echo "Contoh penggunaan:"
	@echo "  make install  # Instal dependensi"
	@echo "  make run      # Jalankan bot (akan install jika belum)"
	@echo "  make help     # Tampilkan bantuan ini"

# Default target
.DEFAULT_GOAL := help.PHONY: check-deps
check-deps:
	@echo "Memeriksa dependensi..."
	@which $(PYTHON) > /dev/null || (echo "Python 3 tidak ditemukan!"; exit 1)
	@which $(PIP) > /dev/null || (echo "Pip3 tidak ditemukan!"; exit 1)
	@echo "Python dan Pip ditemukan."

# Target untuk menghentikan bot (hanya contoh, Makefile tidak secara asinkron mengelola proses)
.PHONY: stop
stop:
	@echo "Gunakan Ctrl+C untuk menghentikan bot di terminal tempat bot dijalankan."

# Target untuk membersihkan file cache Python
.PHONY: clean
clean:
	@echo "Membersihkan file cache Python..."
	find . -type d -name "__pycache__" -delete
	find . -type f -name "*.pyc" -delete
	@echo "Pembersihan selesai."

# Target untuk bantuan
.PHONY: help
help:
	@echo "Makefile untuk bot.py"
	@echo ""
	@echo "Target-target:"
	@echo "  run         - Menjalankan bot (default)"
	@echo "  venv        - Membuat virtual environment (opsional)"
	@echo "  install-deps - Menginstal dependensi dari requirements.txt"
	@echo "  check-deps  - Memeriksa apakah Python dan Pip tersedia"
	@echo "  stop        - Petunjuk untuk menghentikan bot"
	@echo "  clean       - Menghapus file cache Python"
	@echo "  help        - Menampilkan bantuan ini"
	@echo ""
	@echo "Untuk menjalankan bot, cukup ketik 'make' atau 'make run'."

# Default target
.DEFAULT_GOAL := run
