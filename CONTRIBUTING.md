# Panduan Berkontribusi

## Pull Request

### Pull Request Yang Baik

Jika ingin membuat fitur baru usahakan kamu membuat branch baru.

```bash
git checkout -b <feature_name>
git add .
git commit -m "add: menambahkan feature_name baru"
```

- Lakukan push ke branch kamu dan kemudian open pull request

### Pesan Commit

Pesan / message commit harus mengikuti conventional commit. Kami menggunakan bot label agar tidak susah dalam labeling.
Berikut adalah jenis - jenis pesan commit.

- `fix:` untuk memperbaiki bug (label `bug`).
- `feat:` untuk menambahkan algoritma terbaru (label `enhancement`).
- `docs:` untuk menambahkan dokumentasi (label `documentation`).
- `fix(UnknownScope):` memperbaiki algoritma yang sudah ada (label `fix`).

Referensi:
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)

### Contoh penggunaan

```bash
git commit -m "docs: menambahkan dokumentasi"
```

```bash
git commit -m  "feat: menambahkan algoritma terbaru"
```

Pull request `merged` jika:

- Mengikuti standar dan arahan dari `CONTRIBUTING.md`

## Daftar Fitur

- [ ] Auth
- [ ] Home
- [ ] Barbershop
- [ ] Booking
- [ ] Profile
- [ ] Activities
- [ ] Review
- [ ] Favorite
- [ ] Payment

## Daftar Anggota

Semua anggota dari `P-03`, tidak buat secara acak:

- [👨‍🎓 P175X0290 - Michael Elian Kevin (kevinkwee)](https://github.com/kevinkwee)
- [👨‍🎓 P322X0867 - T. Zafran Elrifqi (zafran72)](https://github.com/zafran72)
- [👩‍🎓 P271Y0630 - Andrea Nataya Bantoro (xAndreaNB)](https://github.com/xAndreaNB)
- [👨‍🎓 P007X0031 - Kukuh Setya Arumansyah (lyrihkaesa)](https://github.com/lyrihkaesa)

## Struktur Folder

```tree
📦lib
 ┣ 📂common_widgets
 ┃ ┣ 📜placeholder_page.dart
 ┃ ┗ 📜spacing.dart
 ┣ 📂constants
 ┃ ┗ 📜auth_failure_messages.dart
 ┣ 📂exceptions
 ┃ ┣ 📜failure.dart
 ┃ ┣ 📜failure.freezed.dart
 ┃ ┣ 📜firebase_exception_code.dart
 ┃ ┣ 📜value_failure.dart
 ┃ ┗ 📜value_failure.freezed.dart
 ┣ 📂features
 ┃ ┣ 📂auth
 ┃ ┃ ┣ 📂data
 ┃ ┃ ┃ ┣ 📂datasources
 ┃ ┃ ┃ ┗ 📂repositories
 ┃ ┃ ┣ 📂domain
 ┃ ┃ ┃ ┣ 📂entities
 ┃ ┃ ┃ ┣ 📂repositories
 ┃ ┃ ┃ ┣ 📂usecase
 ┃ ┃ ┗ 📂presentation
 ┃ ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┃ ┣ 📂auth_bloc
 ┃ ┃ ┃ ┃ ┣ 📂password_reset_form_bloc
 ┃ ┃ ┃ ┃ ┣ 📂signin_form_bloc
 ┃ ┃ ┃ ┃ ┗ 📂signup_form_bloc
 ┃ ┃ ┃ ┣ 📂pages
 ┃ ┃ ┃ ┗ 📂widgets
 ┃ ┗ 📂profile
 ┃ ┃ ┣ 📂data
 ┃ ┃ ┣ 📂domain
 ┃ ┃ ┗ 📂presentation
 ┃ ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┃ ┗ 📂pages
 ┣ 📂utils
 ┃ ┗ 📜value_validators.dart
 ┣ 📜app.dart
 ┣ 📜firebase_options.dart
 ┣ 📜injection.dart
 ┣ 📜main.dart
 ┗ 📜routing.dart
```
