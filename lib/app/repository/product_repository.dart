import 'package:kt99/app/models/api_response/api_response.dart';
import 'package:kt99/app/models/product/product.dart';
import 'package:kt99/app/services/network_services.dart';

typedef ProductListResponse = ApiResponse<List<Product>>;
typedef JsonResponse = ApiResponse<dynamic>;

class ProductRepository {
  final NetworkServices _api;

  ProductRepository(this._api);

  Future<ProductListResponse> getProducts() async {
    JsonResponse data = await _api.get('products');

    return data.when(
      loading: () => ProductListResponse.loading(),
      success: (jsonData) {
        print('ЖСОНТВАРЬ: $jsonData');
        // Check if jsonData is a list and not empty
        if (jsonData is List && jsonData.isNotEmpty) {
          // Map each JSON object to a Product object
          var products =
              jsonData.map((json) => Product.fromJson(json)).toList();
          return ProductListResponse.success(products);
        } else {
          return ProductListResponse.failed('Invalid JSON format', null);
        }
      },
      failed: (e, o) => ProductListResponse.failed(e, o),
    );
  }
}
