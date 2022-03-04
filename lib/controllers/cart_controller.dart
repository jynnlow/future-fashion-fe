import 'package:future/data/repository/cart_repo.dart';
import 'package:future/models/cart_model.dart';
import 'package:future/models/product_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get cartItems => _cartItems;

  /* This is for the cart model that retrieve from the local storage and sharePreference*/
  List<CartModel> storageCartItem = [];
  var totalQuantity = 0;

  void addItem(ProductModel product, int quantity, String sizing) {
    totalQuantity = 0;
    String _cartId = product.ID!.toString() + ':' + sizing;

    if (_cartItems.containsKey(_cartId)) {
      _cartItems.update(_cartId, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: _cartId,
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
              id: _cartId,
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
    // add the cart model to the local storage - in cart repo
    cartRepo.addToCartList(getCartList);
  }

  int get totalItems {
    totalQuantity = 0;

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

  List<CartModel> getCartListFromLocalStorage() {
    storageCartItem = cartRepo.getCartList();

    // for (int i = 0; i < storageCartItem.length; i++) {
    //   _cartItems.putIfAbsent(storageCartItem[i].id!, () => storageCartItem[i]);
    // }
    storageCartItem.forEach((element) {
      String uniqueID = element.id!;
      _cartItems.addAll({uniqueID: element});
    });

    return storageCartItem;
  }

  set setCart(List<CartModel> items) {
    storageCartItem = items;
    // for (int i = 0; i < storageCartItem.length; i++) {
    //   String _cartId = storageCartItem[i].product!.ID!.toString() +
    //       ':' +
    //       storageCartItem[i].sizing!;
    //   _cartItems.putIfAbsent(_cartId, () => storageCartItem[i]);
    // }
  }
}
