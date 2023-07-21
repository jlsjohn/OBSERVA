import '../database.dart';

class AnimalTable extends SupabaseTable<AnimalRow> {
  @override
  String get tableName => 'animal';

  @override
  AnimalRow createRow(Map<String, dynamic> data) => AnimalRow(data);
}

class AnimalRow extends SupabaseDataRow {
  AnimalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnimalTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get insertedAt => getField<DateTime>('inserted_at')!;
  set insertedAt(DateTime value) => setField<DateTime>('inserted_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  dynamic? get dataField => getField<dynamic>('data');
  set dataField(dynamic? value) => setField<dynamic>('data', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
