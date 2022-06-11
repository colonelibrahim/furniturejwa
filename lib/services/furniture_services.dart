part of 'services.dart';

class FurnitureServices {
  static Future<ApiReturnValue<List<Furniture_interior>>> getInteriors(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'furniture';

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'mohon coba lagi');
    }

    var data = jsonDecode(response.body);

    List<Furniture_interior> interiors = (data['data']['data'] as Iterable)
        .map((e) => Furniture_interior.fromJson(e))
        .toList();

    return ApiReturnValue(value: interiors);
  }
}
