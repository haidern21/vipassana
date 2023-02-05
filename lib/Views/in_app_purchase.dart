import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';


class inApp extends StatefulWidget {
  @override
  inAppState createState() => inAppState();
}

class inAppState extends State<inApp> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final String _productID = '000001';

  bool _available = true;
  List<ProductDetails> _products = [];
  List<PurchaseDetails> _purchases = [];
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  @override
  void initState() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;

    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      setState(() {
        _purchases.addAll(purchaseDetailsList);
        _listenToPurchaseUpdated(purchaseDetailsList);
      });
    }, onDone: () {
      _subscription!.cancel();
    }, onError: (error) {
      _subscription!.cancel();
    });

    _initialize();

    super.initState();
  }

  @override
  void dispose() {
    _subscription!.cancel();
    super.dispose();
  }

  void _initialize() async {
    _available = await _inAppPurchase.isAvailable();

    List<ProductDetails> products = await _getProducts(
      productIds: Set<String>.from(
        [_productID],
      ),
    );

    setState(() {
      _products = products;
    });
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      switch (purchaseDetails.status) {
        case PurchaseStatus.pending:
        //  _showPendingUI();
          break;
        case PurchaseStatus.purchased:
          log('asd');
          break;
        case PurchaseStatus.restored:
        // bool valid = await _verifyPurchase(purchaseDetails);
        // if (!valid) {
        //   _handleInvalidPurchase(purchaseDetails);
        // }
          break;
        case PurchaseStatus.error:
          print('asdasdasdasd:${purchaseDetails.error!.message}');
          if(purchaseDetails.error!.message=='BillingResponse.itemAlreadyOwned'){

          }
          // _handleError(purchaseDetails.error!);
          break;
        default:
          break;
      }

      if (purchaseDetails.pendingCompletePurchase) {
        await _inAppPurchase.completePurchase(purchaseDetails);
      }
    });
  }

  Future<List<ProductDetails>> _getProducts(
      {required Set<String> productIds}) async {
    ProductDetailsResponse response =
    await _inAppPurchase.queryProductDetails(productIds);

    return response.productDetails;
  }

  ListTile _buildProduct({required ProductDetails product}) {

    return ListTile(
      leading: const Icon(Icons.credit_card,color: Colors.white,),
      title: Text('${product.title} -\n${product.price}',style: const TextStyle(color: Colors.white),),
      //subtitle: Text(product.description),
      trailing: InkWell(
        onTap: () async{
          // helper.purchased.value=true;
          // helper.afterPurchase(context);
          _subscribe(product: product);

          setState(() {

          });
        },
        child: Container(
          height: Get.height * 0.05,
          width: Get.width * .25,
          decoration: BoxDecoration(
              color: innerBorderColor,
              borderRadius: BorderRadius.circular(20)
          ),

          child: const Center(
            child: Text(
              'Buy',style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
            ),
          ),
        ),
      ),
    );
  }

  ListTile _buildPurchase({required PurchaseDetails purchase}) {
    print(purchase.status);
    var a;
    if(purchase.error!=null){
    }
    else{

    }
    log (a.toString());
    // if (purchase.error != null) {
    //   return ListTile(
    //     title: Text('${purchase.error}'),
    //     subtitle: Text(purchase.status.toString()),
    //   );
    // }

    String? transactionDate;
    if (purchase.status == PurchaseStatus.purchased) {
      DateTime date = DateTime.fromMillisecondsSinceEpoch(
        int.parse(purchase.transactionDate!),
      );
      transactionDate = ' @ ' + DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
    }

    // return ListTile(
    //   title: Text('${purchase.productID} ${transactionDate ?? ''}'),
    //   subtitle: Text(purchase.status.toString()),
    // );
    return ListTile(
      title: Text(''),
      subtitle: Text(''),
    );
  }

  void _subscribe({required ProductDetails product}) {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    _inAppPurchase.buyNonConsumable(
      purchaseParam: purchaseParam,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('In App Purchase 1.0.8'),
      // ),
      body: _available
          ? Container(
        decoration:  BoxDecoration(
            color: selectedBorderColor
        ),
        child: Column(
          children: [
             SizedBox(height:Get.height * .03,),
            const Text('Support',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white
            ),),
            SizedBox(
              height: Get.height * .03,
            ),
            Builder(
                builder: (context) {
                  while(_products.isEmpty){
                    return Container(
                        // height: 5.h,
                        // width: 10.w,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ));
                  }
                  if(_products.isEmpty){
                    return Text("An error occured, Please check your gmail account. This happens when you are either no or more than one gmail accounts logged in.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),);
                  }
                  else{
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        return _buildProduct(
                          product: _products[index],
                        );
                      },
                    );
                  }}
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text('Past Purchases: ${_purchases.length}'),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _purchases.length,
                      itemBuilder: (context, index) {
                        return _buildPurchase(
                          purchase: _purchases[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
          : const Center(
        child: Text('The Store Is Not Available'),
      ),
    );
  }
}