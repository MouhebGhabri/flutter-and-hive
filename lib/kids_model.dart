import 'package:hive/hive.dart';


part 'kids_model.g.dart';

@HiveType(typeId: 0)
class KidsModel extends HiveObject {
  KidsModel(
      {this.flname,
        this.parentflname,
        this.phone,
        this.age,
        this.yearofjoin,
        this.pay});

  @HiveField(0)
  String? flname;

  @HiveField(1)
  String? parentflname;

  @HiveField(2)
  String? phone;

  @HiveField(3)
  String? age;

  @HiveField(4)
  String? yearofjoin;

  @HiveField(5)
  String? pay;
}
