import 'dart:html';
import 'dart:math';
import 'package:web_ui/web_ui.dart';

// initial value for click-counter
int startingCount = 5;
List<List<Cell>> cells;
int score;
int boardW = 9;
int boardH = 7;

class Cell {
  int contents=0;
  int row;
  int col;
  Cell(this.contents,this.row,this.col);
  String toString() => contents.toString(); 
}

class Yx {
  int y;int x;
  Yx(this.y,this.x);
  bool operator==(other) => (x==other.x) && (y==other.y);
  int get hashCode{return x.hashCode;}
  String toString() => "(y$y,x$x)";
}

void main() {
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;
  newGame();
}

void newGame(){
  score=0;
  generateCells(boardW,boardH);
}

void clicked(int row, int col){
  List<Yx> chain = generateChain(row,col);
  //window.alert("Chain:"+chain.toString());
  if(chain.length>1) chain.forEach((yx)=>setCell(yx, 0));
}

void generateCells(int width, int height){
  var rng = new Random();
  cells = new List<List<Cell>>.generate(height, (i)=>new List<Cell>.generate(width,(j)=>new Cell(rng.nextInt(3)+1,i,j)));
}

List<Yx> generateChain(int startRow, int startCol){
  List<Yx> selected = new List<Yx>();
  List<Yx> agenda = new List<Yx>();
  List<Yx> searched = new List<Yx>();
  Yx current;
  int contentType = cells[startRow][startCol].contents;
  
  agenda.add(new Yx(startRow,startCol));
  
  while (agenda.length > 0){
    current = agenda.last;
    if(cellsContent(current) == contentType){
      selected.add(current);
      bool isValid(Yx yx) => (!selected.contains(yx)) && (yx.x>=0) && (yx.y>=0) && (yx.y<boardH) && (yx.x<boardW);
      List<Yx> adjacent = [new Yx(current.y,current.x+1),new Yx(current.y,current.x-1),new Yx(current.y+1,current.x),new Yx(current.y-1,current.x)];
      adjacent.where(isValid).forEach((Yx yx)=>agenda.add(yx));
    }
    searched.add(current);
    agenda.remove(current);
  }
  return selected;
}

int cellsContent(Yx coordinates){
  return cells[coordinates.y][coordinates.x].contents;
}
void setCell(Yx coordinates, int value){
  cells[coordinates.y][coordinates.x].contents = value;
}

//void removeChain(int row, int col){
//  //Increase score
//  int iVal = numberSelected;
//  scoreAdd((iVal * (iVal-1))+1);
//}