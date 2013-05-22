import 'dart:html';
import 'dart:math';
import 'package:web_ui/web_ui.dart';
import 'dart:json';

// initial value for click-counter
int startingCount = 5;
Board board;
List<Board> historyStack = new List<Board>();
int score;
int boardW = 9;
int boardH = 7;
bool isGameOver;

class Board{
  List<List<Cell>> cells;
  Board(int width, int height){
    var rng = new Random();
    cells = new List<List<Cell>>.generate(height, (i)=>new List<Cell>.generate(width,(j)=>new Cell(rng.nextInt(3)+1,i,j)));
  }
  int getContentYx(Yx cd) => getContent(cd.y,cd.x);
  int getContent(int y, int x) => cells[y][x].contents;
  int setContent(int y,int x, int value) => cells[y][x].contents = value;
  int setContentYx(Yx cd, int value) => setContent(cd.y,cd.x,value);
  String toString() => stringify(cells);
  bool isEmpty() => cells.every((List<Cell> r)=>r.every((cell)=>cell.contents==0));
  bool noMoves() => !cells.any((List<Cell> r)=>r.any((cell)=>hasMinimumChain(cell.row,cell.col)));
}

class Cell {
  int contents=0;
  int row;
  int col;
  Cell(this.contents,this.row,this.col);
  String toString() => contents.toString(); 
  String toJson() => contents.toString();
}

class Yx {
  int y;int x;
  Yx(this.y,this.x);
  bool operator==(other) => (x==other.x) && (y==other.y);
  int get hashCode{return x.hashCode;}
  String toString() => "(y$y,x$x)";
  List<Yx> adjacent() => [new Yx(y,x+1),new Yx(y,x-1),new Yx(y+1,x),new Yx(y-1,x)];
  Iterable validAdjacent() => adjacent().where((Yx yx)=>(yx.x>=0) && (yx.y>=0) && (yx.y<boardH) && (yx.x<boardW));
}

void main() {
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;
  newGame();
}

void newGame(){
  score=0;
  board = new Board(boardW,boardH);
  isGameOver = false;
}

void clicked(int row, int col){
  List<Yx> chain = generateChain(row,col);
  //window.alert("Chain:"+chain.toString());
  if(chain.length>1){
    //window.alert(board.toString());
    score+=(chain.length * (chain.length-1))+1;
    chain.forEach((yx)=>board.setContentYx(yx, 0));
    gravity();
    horizontalGravity();
    checkGameOver();
  }
}

void gravity(){
  bool changed = true;
  while(changed){
    changed = false;
    for(int r = (boardH-2); r >= 0 ; r--){
      for(int c =0; c < boardW; c++) {
        if(board.getContent(r, c)!=0 && board.getContent(r+1, c)==0){
          board.setContent(r+1, c, board.getContent(r, c));
          board.setContent(r, c, 0);
          changed = true;
        }
      }
    }
  }
}

void horizontalGravity(){
  bool changed = true;
    while(changed){
    changed = false;
    for( int c=1; c < boardW; c++) {
      if(board.getContent(boardH-1, c)!=0 && board.getContent(boardH-1, c-1)==0){
        //slide entire column left
        for (int r=0; r < boardH; r++){
          board.setContent(r, c-1, board.getContent(r, c));
          board.setContent(r, c, 0);
          changed = true;
        }
      }
    }
  }
}

void checkGameOver (){
  if(board.isEmpty()) {
    score += boardW*boardH*3;
    isGameOver=true;
  }
  if (board.noMoves()){
    isGameOver=true;
  }
}

List<Yx> generateChain(int startRow, int startCol){
  List<Yx> selected = new List<Yx>();
  List<Yx> agenda = new List<Yx>();
  List<Yx> searched = new List<Yx>();
  Yx current;
  int contentType = board.getContent(startRow,startCol);
  if (contentType==0) return selected;//Not valid chain
  agenda.add(new Yx(startRow,startCol));
  
  while (agenda.length > 0){
    current = agenda.last;
    if(board.getContentYx(current) == contentType){
      selected.add(current);
      bool isValid(Yx yx) => !selected.contains(yx);
      current.validAdjacent().where(isValid).forEach((Yx yx)=>agenda.add(yx));
    }
    searched.add(current);
    agenda.remove(current);
  }
  return selected;
}

bool hasMinimumChain(int row, int col){
  int contentType = board.getContent(row,col);
  if (contentType==0) return false;
  return (new Yx(row,col)).validAdjacent().any((Yx yx)=>board.getContentYx(yx)==contentType);
}