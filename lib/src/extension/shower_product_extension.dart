import 'package:cafe_sabor_ui_kit/src/models/shower_product_model.dart';

extension ShowProductExtension on ShowerProductModel {
  int get indexPositionType {
    if (positionType == PositionType.BACK) return 0;
    if (positionType == PositionType.MAIN) return 1;
    if (positionType == PositionType.FRONT) return 2;
    return 0;
  }
}
