import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '/models/checkout_model.dart';
import '../checkout/base_checkout_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore firebaseFirestore;

  CheckoutRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(Checkout checkout) {
    return firebaseFirestore.collection('checkout').add(
          checkout.toDocument(),
        );
  }
}
