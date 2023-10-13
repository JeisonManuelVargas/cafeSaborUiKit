import 'package:cafe_sabor_ui_kit/src/utils/index_util.dart';
import 'package:cafe_sabor_ui_kit/src/widgets/index_widget.dart';


//models
export 'package:cafe_sabor_ui_kit/src/models/button_model.dart';
export 'package:cafe_sabor_ui_kit/src/models/font_family_type.dart';

//extension
export 'package:cafe_sabor_ui_kit/src/extension/cafe_text_style_extension.dart';


//abstract class
abstract class CafeKit {
  static Util util = Util();
  static UiWidget widget = UiWidget();
}