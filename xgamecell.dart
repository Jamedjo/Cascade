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
  static Map<String, String> _css = {".game-cell-4":"game-cell-4",".game-cell-3":"game-cell-3",".empty-cell":"empty-cell",".game-cell":"game-cell",".game-cell-2":"game-cell-2",".game-cell-5":"game-cell-5",".game-cell-1":"game-cell-1"};

  /** This field is deprecated, use getShadowRoot instead. */
  get _root => getShadowRoot("x-game-cell");
  static final __html1 = new autogenerated.Element.html('<div class="game-cell " template="" instantiate="if contents>0"></div>'), __html2 = new autogenerated.Element.html('<div class="empty-cell" template="" instantiate="if contents==0"></div>'), __shadowTemplate = new autogenerated.DocumentFragment.html('''
          <style>
.game-cell, .empty-cell {
  width: 10px;
  height: 10px;
  padding: 11px;
}
.game-cell {
  background-image: url("spritesheet_new.png");
  background-repeat: no-repeat;
}
.game-cell:hover {
  box-shadow: 3px 3px 4px -2px;
}
.game-cell:active {
  box-shadow: inset 4px 6px 13px 1px hsla(0, 20%, 20%, 0.9);
}
.game-cell-1 {
  background-position: -5px -5px;
}
.game-cell-2 {
  background-position: -47px -5px;
}
.game-cell-3 {
  background-position: -89px -5px;
}
.game-cell-4 {
  background-position: -131px -5px;
}
.game-cell-5 {
  background-position: -173px -5px;
}
</style><div style="display:none"></div>
          <div style="display:none"></div>
      ''');
  autogenerated.DivElement __e13, __e14;
  autogenerated.Template __t;

  void created_autogenerated() {
    var __root = createShadowRoot("x-game-cell");
    __t = new autogenerated.Template(__root);
    __root.nodes.add(__shadowTemplate.clone(true));
    __e13 = __root.nodes[2];
    __t.conditional(__e13, () => contents>0, (__t) {
      var __e12;
      __e12 = __html1.clone(true);
      __t.bindClass(__e12, () => 'game-cell-'+contents.toString(), false);
    __t.add(__e12);
    });

    __e14 = __root.nodes[4];
    __t.conditional(__e14, () => contents==0, (__t) {
    __t.add(__html2.clone(true));
    });

    __t.create();
  }

  void inserted_autogenerated() {
    __t.insert();
  }

  void removed_autogenerated() {
    __t.remove();
    __t = __e13 = __e14 = null;
  }

  /** Original code from the component. */

  int contents = 0;
}

//@ sourceMappingURL=xgamecell.dart.map