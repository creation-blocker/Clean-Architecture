import 'package:chat_message/features/product/data/datasources/product_remote_data_source.dart';
import 'package:chat_message/features/product/domain/entities/product.dart';
import 'package:chat_message/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getProducts() async {
    return await remoteDataSource.getProducts();
  }
}