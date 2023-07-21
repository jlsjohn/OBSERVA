import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BreedRecord extends FirestoreRecord {
  BreedRecord._(
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

  // "crossing" field.
  List<DocumentReference>? _crossing;
  List<DocumentReference> get crossing => _crossing ?? const [];
  bool hasCrossing() => _crossing != null;

  // "crossGeneration" field.
  int? _crossGeneration;
  int get crossGeneration => _crossGeneration ?? 0;
  bool hasCrossGeneration() => _crossGeneration != null;

  // "pureBred" field.
  bool? _pureBred;
  bool get pureBred => _pureBred ?? false;
  bool hasPureBred() => _pureBred != null;

  // "animalType" field.
  DocumentReference? _animalType;
  DocumentReference? get animalType => _animalType;
  bool hasAnimalType() => _animalType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _example = snapshotData['example'] as String?;
    _crossing = getDataList(snapshotData['crossing']);
    _crossGeneration = castToType<int>(snapshotData['crossGeneration']);
    _pureBred = snapshotData['pureBred'] as bool?;
    _animalType = snapshotData['animalType'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('breed')
          : FirebaseFirestore.instance.collectionGroup('breed');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('breed').doc();

  static Stream<BreedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BreedRecord.fromSnapshot(s));

  static Future<BreedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BreedRecord.fromSnapshot(s));

  static BreedRecord fromSnapshot(DocumentSnapshot snapshot) => BreedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BreedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BreedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BreedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BreedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBreedRecordData({
  String? name,
  String? description,
  String? example,
  int? crossGeneration,
  bool? pureBred,
  DocumentReference? animalType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'example': example,
      'crossGeneration': crossGeneration,
      'pureBred': pureBred,
      'animalType': animalType,
    }.withoutNulls,
  );

  return firestoreData;
}

class BreedRecordDocumentEquality implements Equality<BreedRecord> {
  const BreedRecordDocumentEquality();

  @override
  bool equals(BreedRecord? e1, BreedRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.example == e2?.example &&
        listEquality.equals(e1?.crossing, e2?.crossing) &&
        e1?.crossGeneration == e2?.crossGeneration &&
        e1?.pureBred == e2?.pureBred &&
        e1?.animalType == e2?.animalType;
  }

  @override
  int hash(BreedRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.example,
        e?.crossing,
        e?.crossGeneration,
        e?.pureBred,
        e?.animalType
      ]);

  @override
  bool isValidKey(Object? o) => o is BreedRecord;
}
