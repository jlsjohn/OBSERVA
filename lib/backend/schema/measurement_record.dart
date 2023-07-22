import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeasurementRecord extends FirestoreRecord {
  MeasurementRecord._(
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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _unit = snapshotData['unit'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('measurement');

  static Stream<MeasurementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeasurementRecord.fromSnapshot(s));

  static Future<MeasurementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeasurementRecord.fromSnapshot(s));

  static MeasurementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeasurementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeasurementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeasurementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeasurementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeasurementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeasurementRecordData({
  String? name,
  String? description,
  String? image,
  String? unit,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
      'unit': unit,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeasurementRecordDocumentEquality implements Equality<MeasurementRecord> {
  const MeasurementRecordDocumentEquality();

  @override
  bool equals(MeasurementRecord? e1, MeasurementRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.unit == e2?.unit &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(MeasurementRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.image, e?.unit, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is MeasurementRecord;
}
