import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnimalsRecord extends FirestoreRecord {
  AnimalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "diet" field.
  String? _diet;
  String get diet => _diet ?? '';
  bool hasDiet() => _diet != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "origin" field.
  String? _origin;
  String get origin => _origin ?? '';
  bool hasOrigin() => _origin != null;

  // "habitat" field.
  String? _habitat;
  String get habitat => _habitat ?? '';
  bool hasHabitat() => _habitat != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "dateOfBirth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "animalID" field.
  int? _animalID;
  int get animalID => _animalID ?? 0;
  bool hasAnimalID() => _animalID != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "animalType" field.
  String? _animalType;
  String get animalType => _animalType ?? '';
  bool hasAnimalType() => _animalType != null;

  // "animalBreed" field.
  String? _animalBreed;
  String get animalBreed => _animalBreed ?? '';
  bool hasAnimalBreed() => _animalBreed != null;

  // "habitatLocal" field.
  DocumentReference? _habitatLocal;
  DocumentReference? get habitatLocal => _habitatLocal;
  bool hasHabitatLocal() => _habitatLocal != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _diet = snapshotData['diet'] as String?;
    _gender = snapshotData['gender'] as String?;
    _image = snapshotData['image'] as String?;
    _origin = snapshotData['origin'] as String?;
    _habitat = snapshotData['habitat'] as String?;
    _description = snapshotData['description'] as String?;
    _dateOfBirth = snapshotData['dateOfBirth'] as DateTime?;
    _animalID = castToType<int>(snapshotData['animalID']);
    _isActive = snapshotData['isActive'] as bool?;
    _animalType = snapshotData['animalType'] as String?;
    _animalBreed = snapshotData['animalBreed'] as String?;
    _habitatLocal = snapshotData['habitatLocal'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('animals');

  static Stream<AnimalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnimalsRecord.fromSnapshot(s));

  static Future<AnimalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnimalsRecord.fromSnapshot(s));

  static AnimalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AnimalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnimalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnimalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnimalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnimalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnimalsRecordData({
  String? name,
  int? age,
  String? diet,
  String? gender,
  String? image,
  String? origin,
  String? habitat,
  String? description,
  DateTime? dateOfBirth,
  int? animalID,
  bool? isActive,
  String? animalType,
  String? animalBreed,
  DocumentReference? habitatLocal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'age': age,
      'diet': diet,
      'gender': gender,
      'image': image,
      'origin': origin,
      'habitat': habitat,
      'description': description,
      'dateOfBirth': dateOfBirth,
      'animalID': animalID,
      'isActive': isActive,
      'animalType': animalType,
      'animalBreed': animalBreed,
      'habitatLocal': habitatLocal,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnimalsRecordDocumentEquality implements Equality<AnimalsRecord> {
  const AnimalsRecordDocumentEquality();

  @override
  bool equals(AnimalsRecord? e1, AnimalsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.age == e2?.age &&
        e1?.diet == e2?.diet &&
        e1?.gender == e2?.gender &&
        e1?.image == e2?.image &&
        e1?.origin == e2?.origin &&
        e1?.habitat == e2?.habitat &&
        e1?.description == e2?.description &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.animalID == e2?.animalID &&
        e1?.isActive == e2?.isActive &&
        e1?.animalType == e2?.animalType &&
        e1?.animalBreed == e2?.animalBreed &&
        e1?.habitatLocal == e2?.habitatLocal;
  }

  @override
  int hash(AnimalsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.age,
        e?.diet,
        e?.gender,
        e?.image,
        e?.origin,
        e?.habitat,
        e?.description,
        e?.dateOfBirth,
        e?.animalID,
        e?.isActive,
        e?.animalType,
        e?.animalBreed,
        e?.habitatLocal
      ]);

  @override
  bool isValidKey(Object? o) => o is AnimalsRecord;
}
