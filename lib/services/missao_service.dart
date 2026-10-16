import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MissaoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _uid {
    final user = _auth.currentUser;
    if (user == null) {
      throw StateError('É necessário estar autenticado para acessar missões.');
    }
    return user.uid;
  }

  CollectionReference<Map<String, dynamic>> get _colecao =>
      _firestore.collection('usuarios').doc(_uid).collection('missoes');

  Future<void> registrarMissaoConcluida(String titulo) async {
    await _colecao.add({
      'titulo': titulo,
      'concluidaEm': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> listarMissoes() =>
      _colecao.orderBy('concluidaEm', descending: true).snapshots();
}
