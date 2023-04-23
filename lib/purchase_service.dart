// final List<String> _productIds = [
//   "premium_game_mode_1",
//   "premium_game_mode_2",
//   "premium_game_mode_3"
// ];

// class PurchaseService {
//   static Stream<List<ProductDetails>> getProducts() {
//     return InAppPurchaseConnection.instance
//         .queryProductDetails(_productIds.toSet())
//         .asStream();
//   }

//   static Future<bool> purchaseProduct(String productId) async {
//     final PurchaseParam purchaseParam =
//         PurchaseParam(productDetails: await _getProductDetails(productId));
//     return InAppPurchaseConnection.instance
//         .buyNonConsumable(purchaseParam: purchaseParam)
//         .then((value) => value.status == PurchaseStatus.purchased);
//   }

//   static Future<ProductDetails> _getProductDetails(String productId) async {
//     final ProductDetailsResponse response = await InAppPurchaseConnection
//         .instance
//         .queryProductDetails(<String>{productId});
//     if (response.notFoundIDs.isNotEmpty) {
//       throw Exception('Product $productId not found.');
//     }
//     return response.productDetails.first;
//   }
// }
