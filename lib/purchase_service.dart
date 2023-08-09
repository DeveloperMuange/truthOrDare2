// import 'dart:async';
// import 'package:in_app_purchase/in_app_purchase.dart';

// class PurchaseService {
//   final Set<String> _kProductIds = {
//     'spicy_mode',
//     'steamy_mode',
//     'intense_mode',
//     'all_modes'
//   };
//   final Map<String, String> _kProductPrices = {
//     'spicy_mode': '\$2.99',
//     'steamy_mode': '\$3.99',
//     'intense_mode': '\$4.99',
//     'all_modes': '\$6.99',
//   };

//   StreamSubscription<List<PurchaseDetails>>? _subscription;

//   void initiatePurchase(
//       String productId, Function(PurchaseDetails) onPurchaseCompleted) async {
//     final ProductDetails productDetails = await getProductDetails(productId);
//     final PurchaseParam purchaseParam =
//         PurchaseParam(productDetails: productDetails);
//     InAppPurchase.instance
//         .buyNonConsumable(purchaseParam: purchaseParam)
//         .then((purchaseDetailsList) {
//       if (purchaseDetailsList is List<PurchaseDetails> &&
//           purchaseDetailsList.isNotEmpty) {
//         onPurchaseCompleted(purchaseDetailsList.first);
//       }
//     });
//   }

//   void init() {
//     final StreamSubscription<List<PurchaseDetails>> purchaseUpdates =
//         InAppPurchase.instance.purchaseStream.listen((purchaseDetailsList) {
//       _listenToPurchaseUpdated(purchaseDetailsList);
//     }, onDone: () {
//       _subscription?.cancel();
//     }, onError: (error) {
//       // handle error here
//     });
//     _subscription = purchaseUpdates;
//   }

//   void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
//     for (var purchaseDetails in purchaseDetailsList) {
//       if (purchaseDetails.status == PurchaseStatus.purchased) {
//         _verifyPurchase(purchaseDetails).then((isValidated) {
//           if (isValidated) {
//             _deliverProduct(purchaseDetails);
//           }
//         });
//       }
//     }
//   }

//   Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
//     // implement purchase verification logic here, e.g. validate the receipt with your backend server
//     return true;
//   }

//   void _deliverProduct(PurchaseDetails purchaseDetails) {
//     // deliver the product to the user based on the purchase details
//   }

//   Future<ProductDetails> getProductDetails(String productId) async {
//     try {
//       final ProductDetailsResponse productDetailsResponse =
//           await InAppPurchase.instance.queryProductDetails(_kProductIds);
//       if (productDetailsResponse.notFoundIDs.contains(productId)) {
//         throw Exception('Product not found');
//       }
//       return productDetailsResponse.productDetails
//           .firstWhere((product) => product.id == productId);
//     } catch (error) {
//       // handle error here
//       rethrow;
//     }
//   }

//   String getProductPrice(String productId) {
//     return _kProductPrices[productId] ?? '';
//   }

//   Future<void> endConnection() async {
//     await _subscription?.cancel();
//     await InAppPurchase.instance.endConnection();
//   }
// }
