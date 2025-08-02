import 'package:flutter_test/flutter_test.dart';
import 'package:boots_buy/features/home/presentation/view/cart_model.dart';
import 'package:boots_buy/features/home/presentation/view/cart_item.dart';

void main() {
  group('CartModel', () {
    late CartModel cartModel;
    late CartItem item1;
    late CartItem item2;
    late CartItem item3;

    setUp(() {
      cartModel = CartModel();
      item1 = CartItem(
        image: 'img1.png',
        name: 'Boot 1',
        price: 100,
        quantity: 1,
        size: 42,
      );
      item2 = CartItem(
        image: 'img2.png',
        name: 'Boot 2',
        price: 200,
        quantity: 2,
        size: 43,
      );
      item3 = CartItem(
        image: 'img3.png',
        name: 'Boot 3',
        price: 300,
        quantity: 3,
        size: 44,
      );
    });

    test('initial cart is empty', () {
      expect(cartModel.items, isEmpty);
    });

    test('addItem adds an item to the cart', () {
      cartModel.addItem(item1);
      expect(cartModel.items.length, 1);
      expect(cartModel.items.first, item1);
    });

    test('addItem allows duplicate items', () {
      cartModel.addItem(item1);
      cartModel.addItem(item1);
      expect(cartModel.items.length, 2);
      expect(cartModel.items[0], item1);
      expect(cartModel.items[1], item1);
    });

    test('removeItemAt removes the correct item', () {
      cartModel.addItem(item1);
      cartModel.addItem(item2);
      cartModel.removeItemAt(0);
      expect(cartModel.items.length, 1);
      expect(cartModel.items.first, item2);
    });

    test('removeItemAt throws if index is out of range', () {
      expect(() => cartModel.removeItemAt(0), throwsRangeError);
    });

    test('clear removes all items from the cart', () {
      cartModel.addItem(item1);
      cartModel.addItem(item2);
      cartModel.clear();
      expect(cartModel.items, isEmpty);
    });

    test('clear on empty cart does not throw', () {
      expect(() => cartModel.clear(), returnsNormally);
      expect(cartModel.items, isEmpty);
    });

    test('getOrderSnapshot returns a copy of the cart items', () {
      cartModel.addItem(item1);
      final snapshot = cartModel.getOrderSnapshot();
      expect(snapshot, equals([item1]));
      // Mutate snapshot, original should not change
      snapshot.clear();
      expect(cartModel.items, isNotEmpty);
    });

    test('getOrderSnapshot is a deep copy', () {
      cartModel.addItem(item1);
      var snapshot = cartModel.getOrderSnapshot();
      snapshot[0] = item2;
      expect(cartModel.items[0], isNot(item2));
    });

    test('add multiple different items', () {
      cartModel.addItem(item1);
      cartModel.addItem(item2);
      cartModel.addItem(item3);
      expect(cartModel.items, containsAll([item1, item2, item3]));
      expect(cartModel.items.length, 3);
    });
  });
}