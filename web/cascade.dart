import 'dart:html';
import 'dart:math';
import 'package:web_ui/web_ui.dart';

// initial value for click-counter
int startingCount = 5;
List<List<Cell>> rows; = ['1121','3231','2123','1233','3321'];

class Cell {
  int contents = 0;
}

/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/dart-web-components/.
 */
void main() {
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;
  
  var rng = new Random();
  for(var row=0;row<7;row++){
    for(var col=0;col<9;col++){
      //list append (rng.nextInt(3)+1)
    }
  }
}
