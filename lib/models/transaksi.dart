part of 'models.dart';

enum TransaksiStatus { delivered, on_delivery, pending, cancelled }

class Transaksi extends Equatable {
  final int id;
  final Furniture_interior furniture_interior;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransaksiStatus status;
  final User user;
  final String paymentUrl;

  Transaksi(
      {this.id,
      this.furniture_interior,
      this.quantity,
      this.total,
      this.dateTime,
      this.status,
      this.user,
      this.paymentUrl});
    factory Transaksi.fromJson(Map<String, dynamic> data) => Transaksi(
      id: data['id'],
      furniture_interior: data['furniture_interior'],
      quantity: data['quantity'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      status: (data['status'] == 'PENDING')
          ? TransaksiStatus.pending
          : (data['status'] == 'DELIVERED')
              ? TransaksiStatus.delivered
                : (data['status'] == 'CANCELLED')
                  ? TransaksiStatus.cancelled
                    : TransaksiStatus.on_delivery,
      paymentUrl: data['payment_url']);
      
  Transaksi copyWith(
      {int id,
      Furniture_interior furniture_interior,
      int quantity,
      int total,
      DateTime dateTime,
      TransaksiStatus status,
      User user}) {
    return Transaksi(
        id: id ?? this.id,
        furniture_interior: furniture_interior ?? this.furniture_interior,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user);
  }

  @override
  List<Object> get props =>
      [id, furniture_interior, total, dateTime, status, user];
}

List<Transaksi> mockTransaksid = [
  Transaksi(
      id: 1,
      furniture_interior: mockInteriors[1],
      quantity: 5,
      total: (mockInteriors[1].price * 5 * 1.1).round() + 50000,
      dateTime: DateTime.now(),
      status: TransaksiStatus.on_delivery,
      user: mockUser),
  Transaksi(
      id: 2,
      furniture_interior: mockInteriors[2],
      quantity: 10,
      total: (mockInteriors[1].price * 10 * 1.1).round() + 50000,
      dateTime: DateTime.now(),
      status: TransaksiStatus.delivered,
      user: mockUser),
  Transaksi(
      id: 3,
      furniture_interior: mockInteriors[3], //yang ada 1.1 adalah pajak 10%
      quantity: 2, // 50.000 adalah ongkir
      total: (mockInteriors[1].price * 2 * 1.1).round() + 50000,
      dateTime: DateTime.now(),
      status: TransaksiStatus.cancelled,
      user: mockUser),
];
