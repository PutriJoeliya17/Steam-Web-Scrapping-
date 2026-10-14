# Steam-Web-Scrapping-
melakukan scrapping data terhadap website Steam yang akan di gunakan untuk melakukan analisa data 

## A. Extract
Tahapan pertama dalam data pipeline adalah Extract. Proses ini berguna untuk mengambil data dari sumber halaman website menggunakan web scraping dengan ketentuan sebagai 

## B. Transform
Pada tahapan transform, kita akan melakukan pengolahan data menggunakan Pandas. sebagai berikut:


melakukan eksplorasi data sederhana.
Cek kesesuaian tipe data terhadap value di suatu kolom.
Pastikan kolom yang seharusnya hanya mengandung angka saja seperti harga, rating, jumlah, dsb. tidak ada karakter selain angka dan tipe datanya numerik.
Simpan hasil data yang sudah diolah ke .csv

## C. Load
Pada tahapan ini, data yang sudah diolah disimpan ke data storage lainnya seperti database PostgreSQL. sebagai berikut:


membuat database PostgreSQL sesuai dengan data csv yang sudah diolah. Sesuaikan kolom dan tipe data dengan data yang ada.
melakukan normalisasi.
Input data csv ke database PostgreSQL.
Tahapan load dilakukan di file .sql dan dijalankan di pgadmin.
