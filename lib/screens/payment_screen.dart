import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_pay/utils/cartItems.dart';
import 'package:pay/pay.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final Future<PaymentConfiguration> _googlePayConfigFuture;

  @override
  void initState() {
    super.initState();
    // Load Payment Configurations
    _googlePayConfigFuture =
        PaymentConfiguration.fromAsset('google_pay_config.json');
  }

  // These are the items We are going to pay for
  final _paymentItems = cartItems
      .map(
        (item) => PaymentItem(
          label: item.label,
          amount: item.amount,
          status: item.status,
          type: PaymentItemType.item,
        ),
      )
      .toList();

  // This is the callback function for Google Pay
  void onGooglePayResult(paymentResult) {
    // Here we can write database logic to update the order status
    debugPrint(paymentResult.toString());

    // Show Payment Success Toast Message
    Fluttertoast.showToast(
      msg: 'Payment Successful',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart Items List
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) => ListTile(
                leading: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(cartItems[index].itemImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(cartItems[index].label),
                subtitle: Text(cartItems[index].amount),
              ),
            ),
            const SizedBox(height: 24),

            // Load Google Pay Button
            FutureBuilder<PaymentConfiguration>(
              future: _googlePayConfigFuture,
              builder: (context, snapshot) => snapshot.hasData
                  ? Center(
                      child: GooglePayButton(
                        paymentConfiguration: snapshot.data!,
                        paymentItems: _paymentItems.toList(),
                        type: GooglePayButtonType.pay,
                        margin: const EdgeInsets.only(top: 15.0),
                        onPaymentResult: onGooglePayResult,
                        loadingIndicator: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
