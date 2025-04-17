import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Cloud Firestore Custom Implementation
///
/// This is a stub implementation to avoid Android build issues
class FirebaseFirestore {
  static FirebaseFirestore? _instance;
  
  final MethodChannel _channel = const MethodChannel('plugins.flutter.io/firebase_firestore');
  
  /// Returns the singleton instance
  static FirebaseFirestore get instance => _instance ??= FirebaseFirestore._();
  
  FirebaseFirestore._();
  
  /// Returns a stub FirebaseFirestore collection reference
  CollectionReference collection(String path) {
    return CollectionReference(path);
  }
}

/// A stub implementation of a Firestore CollectionReference
class CollectionReference {
  final String path;
  
  CollectionReference(this.path);
  
  /// Returns a stub document reference
  DocumentReference doc([String? path]) {
    final docPath = path ?? 'stub-doc';
    return DocumentReference('$path/$docPath');
  }
  
  /// Returns a stub document reference for a new document
  Future<DocumentReference> add(Map<String, dynamic> data) async {
    return DocumentReference('$path/stub-new-doc');
  }
}

/// A stub implementation of a Firestore DocumentReference
class DocumentReference {
  final String path;
  
  DocumentReference(this.path);
  
  /// Returns a stub document snapshot
  Future<DocumentSnapshot> get() async {
    return DocumentSnapshot(path, {});
  }
  
  /// Returns a stub future
  Future<void> set(Map<String, dynamic> data, {bool merge = false}) async {
    return;
  }
  
  /// Returns a stub future
  Future<void> update(Map<String, dynamic> data) async {
    return;
  }
  
  /// Returns a stub future
  Future<void> delete() async {
    return;
  }
}

/// A stub implementation of a Firestore DocumentSnapshot
class DocumentSnapshot {
  final String path;
  final Map<String, dynamic> _data;
  
  DocumentSnapshot(this.path, this._data);
  
  /// Returns whether the document exists
  bool get exists => true;
  
  /// Returns the document data
  Map<String, dynamic> data() {
    return _data;
  }
}

/// A stub implementation of a Firestore Query
class Query {
  final String path;
  
  Query(this.path);
  
  /// Returns a stub query snapshot
  Future<QuerySnapshot> get() async {
    return QuerySnapshot(path, []);
  }
  
  /// Returns a stub query with limit
  Query limit(int limit) {
    return this;
  }
  
  /// Returns a stub query with where clause
  Query where(String field, {dynamic isEqualTo, dynamic isNotEqualTo}) {
    return this;
  }
  
  /// Returns a stub query with order by
  Query orderBy(String field, {bool descending = false}) {
    return this;
  }
}

/// A stub implementation of a Firestore QuerySnapshot
class QuerySnapshot {
  final String path;
  final List<DocumentSnapshot> _docs;
  
  QuerySnapshot(this.path, this._docs);
  
  /// Returns the documents in the query snapshot
  List<DocumentSnapshot> get docs => _docs;
}

/// A stub implementation of a Firestore transaction
class Transaction {
  /// Returns a stub document snapshot in a transaction
  Future<DocumentSnapshot> get(DocumentReference documentReference) async {
    return DocumentSnapshot(documentReference.path, {});
  }
  
  /// Sets a document in a transaction
  Transaction set(DocumentReference documentReference, Map<String, dynamic> data, {bool merge = false}) {
    return this;
  }
  
  /// Updates a document in a transaction
  Transaction update(DocumentReference documentReference, Map<String, dynamic> data) {
    return this;
  }
  
  /// Deletes a document in a transaction
  Transaction delete(DocumentReference documentReference) {
    return this;
  }
} 