// Auto-generated from xgamecell.html.
// DO NOT EDIT.

library x_game_cell;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'package:web_ui/web_ui.dart';



class CellComponent extends WebComponent {
  /** Autogenerated from the template. */

  /** CSS class constants. */
  static Map<String, String> _css = {};

  /** This field is deprecated, use getShadowRoot instead. */
  get _root => getShadowRoot("x-game-cell");
  static final __shadowTemplate = new autogenerated.DocumentFragment.html('''
          <button></button>
      ''');
  autogenerated.ButtonElement __e6;
  autogenerated.Template __t;

  void created_autogenerated() {
    var __root = createShadowRoot("x-game-cell");
    __t = new autogenerated.Template(__root);
    __root.nodes.add(__shadowTemplate.clone(true));
    __e6 = __root.nodes[1];
    var __binding5 = __t.contentBind(() => contents, false);
    __e6.nodes.add(__binding5);
    __t.listen(__e6.onClick, ($event) { increment(); });
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e6 = null;
  }

  /** Original code from the component. */

  int contents = 0;

  void increment() {
    contents++;
  }
}

//@ sourceMappingURL=xgamecell.dart.map