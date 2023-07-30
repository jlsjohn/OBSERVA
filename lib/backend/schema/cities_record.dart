import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitiesRecord extends FirestoreRecord {
  CitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cityPhoto" field.
  String? _cityPhoto;
  String get cityPhoto => _cityPhoto ?? '';
  bool hasCityPhoto() => _cityPhoto != null;

  // "cityName" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "cityDescription" field.
  String? _cityDescription;
  String get cityDescription => _cityDescription ?? '';
  bool hasCityDescription() => _cityDescription != null;

  // "founded" field.
  int? _founded;
  int get founded => _founded ?? 0;
  bool hasFounded() => _founded != null;

  // "cityPopulation" field.
  int? _cityPopulation;
  int get cityPopulation => _cityPopulation ?? 0;
  bool hasCityPopulation() => _cityPopulation != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "cityType" field.
  String? _cityType;
  String get cityType => _cityType ?? '';
  bool hasCityType() => _cityType != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  void _initializeFields() {
    _cityPhoto = snapshotData['cityPhoto'] as String?;
    _cityName = snapshotData['cityName'] as String?;
    _cityDescription = snapshotData['cityDescription'] as String?;
    _founded = castToType<int>(snapshotData['founded']);
    _cityPopulation = castToType<int>(snapshotData['cityPopulation']);
    _isActive = snapshotData['isActive'] as bool?;
    _cityType = snapshotData['cityType'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cities');

  static Stream<CitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitiesRecord.fromSnapshot(s));

  static Future<CitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitiesRecord.fromSnapshot(s));

  static CitiesRecord fromSnapshot(DocumentSnapshot snapshot) => CitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitiesRecordData({
  String? cityPhoto,
  String? cityName,
  String? cityDescription,
  int? founded,
  int? cityPopulation,
  bool? isActive,
  String? cityType,
  String? uid,
  DateTime? createdTime,
  DocumentReference? createdBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cityPhoto': cityPhoto,
      'cityName': cityName,
      'cityDescription': cityDescription,
      'founded': founded,
      'cityPopulation': cityPopulation,
      'isActive': isActive,
      'cityType': cityType,
      'uid': uid,
      'created_time': createdTime,
      'created_by': createdBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitiesRecordDocumentEquality implements Equality<CitiesRecord> {
  const CitiesRecordDocumentEquality();

  @override
  bool equals(CitiesRecord? e1, CitiesRecord? e2) {
    return e1?.cityPhoto == e2?.cityPhoto &&
        e1?.cityName == e2?.cityName &&
        e1?.cityDescription == e2?.cityDescription &&
        e1?.founded == e2?.founded &&
        e1?.cityPopulation == e2?.cityPopulation &&
        e1?.isActive == e2?.isActive &&
        e1?.cityType == e2?.cityType &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.createdBy == e2?.createdBy;
  }

  @override
  int hash(CitiesRecord? e) => const ListEquality().hash([
        e?.cityPhoto,
        e?.cityName,
        e?.cityDescription,
        e?.founded,
        e?.cityPopulation,
        e?.isActive,
        e?.cityType,
        e?.uid,
        e?.createdTime,
        e?.createdBy
      ]);

  @override
  bool isValidKey(Object? o) => o is CitiesRecord;
}
