import 'package:kt99/app/models/api_response/api_response.dart';
import 'package:kt99/app/models/product/product.dart';
import 'package:kt99/app/services/api_services.dart';

typedef ProductListResponse = ApiResponse<List<Product>>;
typedef JsonResponse = ApiResponse<dynamic>;

class ProductRepository {
  final ApiServices _api;

  ProductRepository(this._api);

  Future<ProductListResponse> getProducts() async {
    JsonResponse data = await _api.get('products');

    return data.when(
        loading: () => ProductListResponse.loading(),
        success: (jsonData) {
          var productsJson = jsonData['products'] as List<dynamic>;
          var products =
              productsJson.map((json) => Product.fromJson(json)).toList();
          return ProductListResponse.success(products);
        },
        failed: (e, o) => ProductListResponse.failed(e, o));
  }
}
