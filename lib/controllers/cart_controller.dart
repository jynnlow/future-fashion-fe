import 'package:future/data/repository/cart_repo.dart';
import 'package:future/models/cart_model.dart';
import 'package:future/models/product_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get cartItems => _cartItems;

  void addItem(ProductModel product, int quantity, String sizing) {
    String _cartId = product.id!.toString() + ':' + sizing;
    var totalQuantity = 0;

    if (_cartItems.containsKey(_cartId)) {
      _cartItems.update(_cartId, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          item: value.item,
          price: value.price,
          picture: value.picture,
          sizing: sizing,
          quantity: value.quantity! + quantity,
          isExist: true,
          createdTime: DateTime.now().toString(),
          product: product,
        );
      });

      if (totalQuantity <= 0) {
        _cartItems.remove(_cartId);
      }
    } else {
      if (quantity > 0) {
        _cartItems.putIfAbsent(
          _cartId,
          () {
            return CartModel(
              id: product.id,
              item: product.item,
              price: product.price,
              picture: product.picture,
              sizing: sizing,
              quantity: quantity,
              isExist: true,
              createdTime: DateTime.now().toString(),
              product: product,
            );
          },
        );
      }
    }
    update();
  }

  int get totalItems {
    var totalQuantity = 0;
    _cartItems.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getCartList {
    return _cartItems.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var totalAmount = 0;
    _cartItems.forEach((key, value) {
      totalAmount += (value.quantity! * value.price!);
    });
    return totalAmount;
  }
}
