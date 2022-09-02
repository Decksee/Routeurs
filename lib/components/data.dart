import 'package:hive/hive.dart';

part 'data.g.dart';

@HiveType(typeId: 0)
class data extends HiveObject{
  @HiveField(0)
  late String Direction;

  @HiveField(1)
  late String Fournisseur;

  @HiveField(2)
  late int NumberSim;

  @HiveField(3)
  late String CodeBox;

  @HiveField(4)
  late String DateA;

  @HiveField(5)
  late String DateFA;
 }