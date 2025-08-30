-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- tampilkan nomor baris
vim.opt.number = true            -- tampilkan nomor baris
vim.opt.relativenumber = true    -- nomor relatif untuk navigasi cepat

-- indentasi
vim.opt.tabstop = 2              -- lebar tab = 2 spasi
vim.opt.shiftwidth = 2           -- indentasi otomatis = 2 spasi
vim.opt.expandtab = true         -- konversi tab jadi spasi
vim.opt.smartindent = true       -- indentasi otomatis yang cerdas
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.cinoptions = "(0"

-- tampilan
vim.opt.termguicolors = true     -- aktifkan warna GUI
vim.opt.cursorline = true        -- garis bawah kursor
vim.opt.signcolumn = "yes"       -- kolom untuk ikon LSP/diff
vim.opt.scrolloff = 8            -- padding baris atas/bawah saat scroll
vim.opt.wrap = false             -- jangan potong baris panjang (no word wrap)

-- pencarian
vim.opt.ignorecase = true        -- pencarian tidak case-sensitive
vim.opt.smartcase = true         -- case-sensitive jika ada huruf kapital
vim.opt.incsearch = true         -- tampilkan hasil pencarian langsung
vim.opt.hlsearch = false         -- jangan highlight semua hasil

-- clipboard & file
vim.opt.clipboard = "unnamedplus" -- gunakan clipboard sistem
vim.opt.undofile = true           -- aktifkan undo history persistensi
vim.opt.swapfile = false          -- nonaktifkan file swap
vim.opt.backup = false

-- waktu
vim.opt.timeoutlen = 300          -- waktu tunggu kombinasi mapping
vim.opt.updatetime = 250          -- waktu tunggu untuk update (misal LSP)

-- mouse dan split
vim.opt.mouse = "a"               -- aktifkan mouse
vim.opt.splitbelow = true         -- split horizontal di bawah
vim.opt.splitright = true         -- split vertikal di kanan
