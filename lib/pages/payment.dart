import 'package:app/api_all/api_cart/api_service.dart';
import 'package:esewa_flutter/esewa_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key});

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final details = ref.watch(orderProvider);
    return Scaffold(
      appBar:AppBar(),
      body:
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           
            details.when(
              data:(data)=>
              EsewaPayButton(
                title: 'Pay with Esewa',
                paymentConfig: ESewaConfig.dev(
                  su: 'https://esewa.com.np/merchant/invoice',
                  amt: 10,
                  pdc: 18,
                  
                  tAmt: 28,
                  fu: 'https://esewa.com.np/merchant/invoice',
                  pid: '1022', //order id
                ),
                width: 40,
                onFailure: (result) async {},
                onSuccess: (result) async {},
              ),
                error: (Object error, StackTrace stackTrace) {
                        return const Card();
                      },
                      loading: () {
                        return const Card();
                      },
            ),
          ],
        ),
      ), 
    );
  }
}