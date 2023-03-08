import 'package:pay/pay.dart';

// This is a model class for the items
class Item {
  final String label;
  final String amount;
  final String itemImage;
  final PaymentItemStatus status;

  Item({
    required this.label,
    required this.amount,
    required this.itemImage,
    required this.status,
  });
}
