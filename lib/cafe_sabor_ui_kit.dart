import 'package:cafe_sabor_ui_kit/src/utils/index_util.dart';
import 'package:cafe_sabor_ui_kit/src/widgets/index_widget.dart';


//models
export 'package:cafe_sabor_ui_kit/src/models/button_model.dart';
export 'package:cafe_sabor_ui_kit/src/models/font_family_type.dart';
export 'package:cafe_sabor_ui_kit/src/models/from_animation_model.dart';
export 'package:cafe_sabor_ui_kit/src/models/shower_product_model.dart';

//extension
export 'package:cafe_sabor_ui_kit/src/extension/shower_product_extension.dart';
export 'package:cafe_sabor_ui_kit/src/extension/cafe_text_style_extension.dart';


//abstract class
abstract class CafeKit {
  static Util util = Util();
  static UiWidget widget = UiWidget();
}