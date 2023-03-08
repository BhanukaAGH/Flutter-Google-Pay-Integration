import 'package:google_pay/models/item.dart';
import 'package:pay/pay.dart';

// These are the sample cart items
List<Item> cartItems = [
  Item(
    label: "Macbook Pro",
    amount: '1999.99',
    itemImage:
        'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
    status: PaymentItemStatus.final_price,
  ),
  Item(
    label: "Iphone 12",
    amount: '999.99',
    itemImage:
        'https://images.unsplash.com/photo-1580910051074-3eb694886505?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
    status: PaymentItemStatus.final_price,
  ),
  Item(
    label: "SONY DSLR Camera",
    amount: '2499.99',
    itemImage:
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1638&q=80',
    status: PaymentItemStatus.final_price,
  ),
];
