import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TypeRecord extends FirestoreRecord {
  TypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "example" field.
  String? _example;
  String get example => _example ?? '';
  bool hasExample() => _example != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _example = snapshotData['example'] as String?;
    _icon = snapshotData['icon'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('type')
          : FirebaseFirestore.instance.collectionGroup('type');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('type').doc();

  static Stream<TypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TypeRecord.fromSnapshot(s));

  static Future<TypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TypeRecord.fromSnapshot(s));

  static TypeRecord fromSnapshot(DocumentSnapshot snapshot) => TypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTypeRecordData({
  String? name,
  String? description,
  String? example,
  String? icon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'example': example,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class TypeRecordDocumentEquality implements Equality<TypeRecord> {
  const TypeRecordDocumentEquality();

  @override
  bool equals(TypeRecord? e1, TypeRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.example == e2?.example &&
        e1?.icon == e2?.icon;
  }

  @override
  int hash(TypeRecord? e) =>
      const ListEquality().hash([e?.name, e?.description, e?.example, e?.icon]);

  @override
  bool isValidKey(Object? o) => o is TypeRecord;
}
