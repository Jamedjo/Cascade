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
  static Map<String, String> _css = {".game-cell":"game-cell",".game-cell-2":"game-cell-2",".game-cell-4":"game-cell-4",".game-cell-5":"game-cell-5",".game-cell-3":"game-cell-3",".game-cell-1":"game-cell-1"};

  /** This field is deprecated, use getShadowRoot instead. */
  get _root => getShadowRoot("x-game-cell");
  static final __shadowTemplate = new autogenerated.DocumentFragment.html('''
          <style>
.game-cell {
  width: 10px;
  height: 10px;
  padding: 11px;
  margin-top: -3px;
  margin-right: -3px;
}
.game-cell-1 {
  background-image: url("ball1.gif");
}
.game-cell-2 {
  background-image: url("ball2.gif");
}
.game-cell-3 {
  background-image: url("ball3.gif");
}
.game-cell-4 {
  background-image: url("ball4.gif");
}
.game-cell-5 {
  background-image: url("ball5.gif");
}
</style><div class="game-cell "></div>
      ''');
  autogenerated.DivElement __e5;
  autogenerated.Template __t;

  void created_autogenerated() {
    var __root = createShadowRoot("x-game-cell");
    __t = new autogenerated.Template(__root);
    __root.nodes.add(__shadowTemplate.clone(true));
    __e5 = __root.nodes[2];
    __t.listen(__e5.onClick, ($event) { increment(); });
    __t.bindClass(__e5, () => 'game-cell-'+contents.toString(), false);
    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e5 = null;
  }

  /** Original code from the component. */

  int contents = 0;

  void increment() {
    contents++;
  }
}

//@ sourceMappingURL=xgamecell.dart.map