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
  String toString(){return contents.toString();} 
}

class Xy {
  int x;int y;Xy(this.x,this.y);
  bool operator==(other){return x==other.x && y==other.y;}
  int hashCode(){return x.hashCode;}
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
  score=0;
  generateCells(boardW,boardH);
}

void clicked(int row, int col){
  window.alert(""+row.toString()+","+col.toString());
  generateChain(row,col);
}

void generateCells(int width, int height){
  var rng = new Random();
  cells = new List<List<Cell>>.generate(height, (i)=>new List<Cell>.generate(width,(j)=>new Cell(rng.nextInt(3)+1,i,j)));
}

void generateChain(int startRow, int startCol){
  window.alert(cells[0].elementAt(0).toString());
  List<Xy> selected = new List<Xy>();
  List<Xy> agenda = new List<Xy>();
  List<Xy> searched = new List<Xy>();
  Xy current;
  int contentType = cells[startRow][startCol].contents;
  
  agenda.add(new Xy(startRow,startCol));
  
  while (agenda.length > 0){
    current = agenda.last;
    
    if(cellsContent(current) == contentType){
      selected.add(current);
      //add adjacent to the search, if not already searched and in bounds
    }
    searched.add(current);
    agenda.remove(current);
  }
}

int cellsContent(Xy coordinates){
  return cells[coordinates.x][coordinates.y].contents;
}

//void removeChain(int row, int col){
//  //Increase score
//  int iVal = numberSelected;
//  scoreAdd((iVal * (iVal-1))+1);
//}