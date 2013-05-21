import 'dart:html';
import 'dart:math';
import 'package:web_ui/web_ui.dart';

// initial value for click-counter
int startingCount = 5;
List<List<Cell>> cells; //= ['1121','3231','2123','1233','3321'];

class Cell {
  int contents = 0;
  Cell(this.contents);
}

/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/dart-web-components/.
 */
void main() {
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;
  newGame();
}

void newGame(){
  generateCells(9,7);
}

void generateCells(int width, int height){
  var rng = new Random();
  cells = new List<List<Cell>>.generate(height, (i)=>new List<Cell>.generate(width,(j)=>new Cell(rng.nextInt(3)+1)));
}