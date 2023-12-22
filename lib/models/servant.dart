
import 'package:hive/hive.dart';

part 'servant.g.dart';

@HiveType(typeId: 0)
class Servant {

  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int servantClass;

  @HiveField(3)
  final String hp;

  @HiveField(4)
  final String attack;

  @HiveField(5)
  final int noblePhantasmCard;

  //add functionality for card array

  Servant({
    required this.id,
    required this.name,
    required this.servantClass,
    required this.hp,
    required this.attack,
    required this.noblePhantasmCard,
  });

  @override
  bool operator ==(covariant Servant other) =>
      id == other.id &&
          name == other.name &&
          servantClass == other.servantClass;

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    servantClass,
  ]);
}

//List<Servant> servants = [];