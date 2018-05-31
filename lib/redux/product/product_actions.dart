import 'dart:async';

import 'package:invoiceninja/data/models/models.dart';
import 'package:built_collection/built_collection.dart';

class LoadProductsAction {
  final Completer completer;

  LoadProductsAction([this.completer]);
}

class ProductsNotLoadedAction {
  final dynamic error;
  ProductsNotLoadedAction(this.error);

  @override
  String toString() {
    return 'ProductsNotLoadedAction{error: $error}';
  }
}

class ProductsLoadedAction {
  final BuiltList<ProductEntity> products;
  ProductsLoadedAction(this.products);

  @override
  String toString() {
    return 'ProductsLoadedAction{products: $products}';
  }
}

class SelectProductAction {
  final ProductEntity product;
  SelectProductAction(this.product);
}

class SaveProductRequest {
  final Completer completer;
  final ProductEntity product;
  SaveProductRequest(this.completer, this.product);
}

class SaveProductSuccess {
  final ProductEntity product;

  SaveProductSuccess(this.product);
}

class ArchiveProductRequest {
  final Completer completer;
  final int productId;

  ArchiveProductRequest(this.completer, this.productId);
}
class ArchiveProductSuccess {}
class ArchiveProductFailure {}

class DeleteProductRequest {
  final Completer completer;
  final int productId;

  DeleteProductRequest(this.completer, this.productId);
}
class DeleteProductSuccess {}
class DeleteProductFailure {}

class RestoreProductRequest {
  final Completer completer;
  final int productId;
  RestoreProductRequest(this.completer, this.productId);
}
class RestoreProductSuccess {}
class RestoreProductFailure {}

class AddProductSuccess {
  final ProductEntity product;
  AddProductSuccess(this.product);
}

class SaveProductFailure {
  final String error;
  SaveProductFailure (this.error);
}

class SortProducts {
  final String field;
  SortProducts(this.field);
}
