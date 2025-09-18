import 'dart:convert';
import 'package:chat_message/features/product/data/models/product_model.dart';
import 'package:chat_message/features/product/domain/entities/product.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final baseUrl = 'https://fakestoreapi.com/products';

  @override
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
