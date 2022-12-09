import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/firebase_extensions.dart';
import '../models/barbershop_model.dart';
import '../models/post_model.dart';
import '../models/service_model.dart';

abstract class BarbershopRemoteDatasource {
  Future<BarbershopModel> getBarbershop(String id);
  Future<List<PostModel>> getBarbershopPosts(String barbershopId);
  Future<List<ServiceModel>> getBarbershopServices(
    String barbershopId,
  );
}

class BarbershopRemoteDatasourceImpl implements BarbershopRemoteDatasource {
  const BarbershopRemoteDatasourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<BarbershopModel> getBarbershop(String id) async {
    final result = await _firestore.barbershopDocRef(id).get();
    return BarbershopModel.fromFirestore(
      result as DocumentSnapshot<Map<String, dynamic>>,
    );
  }

  @override
  Future<List<PostModel>> getBarbershopPosts(String barbershopId) async {
    final result = await _firestore
        .barbershopPostColRef(barbershopId)
        .orderBy('createdAt', descending: true)
        .get();
    return result.docs
        .map(
          (doc) => PostModel.fromFirestore(
            doc as DocumentSnapshot<Map<String, dynamic>>,
          ),
        )
        .toList();
  }

  @override
  Future<List<ServiceModel>> getBarbershopServices(String barbershopId) async {
    final result = await _firestore
        .barbershopServiceColRef(barbershopId)
        .orderBy('name')
        .get();
    return result.docs
        .map(
          (doc) => ServiceModel.fromFirestore(
            doc as DocumentSnapshot<Map<String, dynamic>>,
          ),
        )
        .toList();
  }
}
