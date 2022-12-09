enum AppointmentStatusCode {
  waitingForPayment,
  paid,
  expired,
  accepted,
  rejected,
  autoCanceled,
  ongoing,
  completed,
  canceledByUser,
  canceledByBarbershop,
}

enum AppointmentOnProgress {
  waitingForPayment,
  paid,
  accepted,
  ongoing,
}

const statusToBahasa = {
  'waitingForPayment': 'Menunggu Pembayaran',
  'paid': 'Dibayar',
  'expired': 'Kadaluarsa',
  'accepted': 'Diterima',
  'rejected': 'Ditolak',
  'autoCanceled': 'Dibatalkan Secara Otomatis',
  'ongoing': 'Sedang Berlangsung',
  'completed': 'Selesai',
  'canceledByUser': 'Dibatalkan Oleh Pengguna',
  'canceledByBarbershop': 'Dibatalkan oleh Barber',
};
