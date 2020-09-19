import 'dart:async';

import 'package:bombermen/levels.dart';
import 'package:flutter/material.dart';

class NextLevelProvider extends ChangeNotifier{
  int _playerPosition = 0, _bombPosition = -1,_squares =110;
  List<int> _barriers = barriersLevel1;
  List<int> _boxes = boxesLevel1;
  List<int> _bomb = [-1];

void clear(){
_playerPosition = null;
_bombPosition = null;
_bomb = null;
_barriers = null;
_boxes = null;
notifyListeners();
}
  void nextLevel(List<int> boxes2,List<int> brrier2, int sq, int pPos, int bPos,List<int> bomb2){
    print("$_squares  + $_boxes + $_bomb + $_barriers + $_playerPosition + $_bombPosition");
    _boxes = boxes2;
    _barriers = brrier2;
    _squares = sq;
    _playerPosition = pPos;
    _bombPosition = bPos;
    _bomb = bomb2;
    print("$_squares  + $_boxes + $_bomb + $_barriers + $_playerPosition + $_bombPosition");
    notifyListeners();
  }
  placeBomb(){
      _bombPosition = _playerPosition;
      bomb.clear();
      Timer(Duration(milliseconds: 250), (){
          _bomb.add(_bombPosition);
          if(_bombPosition-10>=0)
            _bomb.add(_bombPosition-10);
          if((_bombPosition-1)%10 != 9)
            _bomb.add(_bombPosition-1);
          if(_bombPosition+10 <_squares)
            _bomb.add(_bombPosition+10);
          if(_bombPosition+1 != 0)
            _bomb.add(_bombPosition+1);
        clearBomb();
    });
      notifyListeners();
  }

  clearBomb(){
      Timer(Duration(milliseconds: 500), (){
          for(int i=0;i<_bomb.length;i++){
            if(_boxes.contains(_bomb[i])){
              _boxes.remove(_bomb[i]);
            }
          }
          _bomb.clear();
          _bombPosition = -1;
      });
      notifyListeners();
  }
  moveUp(){
    _playerPosition -= 10;
    notifyListeners();
  }

  moveDown(){
    _playerPosition += 10;
    notifyListeners();
  }

  moveLeft(){
    _playerPosition -= 1;
    notifyListeners();
  }

  moveRight(){
    _playerPosition += 1;
    notifyListeners();
  }

  int get playerPosition => _playerPosition;
  int get bombPosition => _bombPosition;
  int get squares => _squares;
  List<int> get barriers => _barriers;
  List<int> get bomb => _bomb;
  List<int> get boxes => _boxes;
}