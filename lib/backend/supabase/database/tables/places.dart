import '../database.dart';

class PlacesTable extends SupabaseTable<PlacesRow> {
  @override
  String get tableName => 'places';

  @override
  PlacesRow createRow(Map<String, dynamic> data) => PlacesRow(data);
}

class PlacesRow extends SupabaseDataRow {
  PlacesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlacesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get insertedAt => getField<DateTime>('inserted_at')!;
  set insertedAt(DateTime value) => setField<DateTime>('inserted_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String get country => getField<String>('country')!;
  set country(String value) => setField<String>('country', value);

  String get state => getField<String>('state')!;
  set state(String value) => setField<String>('state', value);

  String get city => getField<String>('city')!;
  set city(String value) => setField<String>('city', value);

  String? get region => getField<String>('region');
  set region(String? value) => setField<String>('region', value);

  String? get addressType => getField<String>('address_type');
  set addressType(String? value) => setField<String>('address_type', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get number => getField<String>('number');
  set number(String? value) => setField<String>('number', value);

  String? get complement => getField<String>('complement');
  set complement(String? value) => setField<String>('complement', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get website => getField<String>('website');
  set website(String? value) => setField<String>('website', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);
}
