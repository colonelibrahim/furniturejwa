part of 'services.dart';

class TransaksiServices {
  static Future<ApiReturnValue<List<Transaksi>>> getTransaksid(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'transaksi/?limit1000';

    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Mohon coba lagi');
    }

    var data = jsonDecode(response.body);

    List<Transaksi> transaksid = (data['data']['data'] as Iterable)
        .map((e) => Transaksi.fromJson(e))
        .toList();
    return ApiReturnValue(value: transaksid);
  }

  static Future<ApiReturnValue<Transaksi>> submitTransaksi(Transaksi transaksi,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'checkout';

    var response = await client.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
        body: jsonEncode(<String, dynamic>{
          "furniture_id": transaksi.furniture_interior.id,
          "user_id": transaksi.user.id,
          "quantity": transaksi.quantity,
          "total": transaksi.total,
          "status": "PENDING"
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Mohon coba lagi');
    }

    var data = jsonDecode(response.body);

    Transaksi value = Transaksi.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }
}
