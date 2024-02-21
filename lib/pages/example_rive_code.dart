import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive/src/rive_core/state_machine_controller.dart' as core;
import 'package:rive/src/generated/animation/nested_number_base.dart';
import 'package:tuktoro_feedback/widget/alert_game_summery.dart';


int eventID = 29422;
List<String> cloudNames = ['selectable_number_1','selectable_number_2','selectable_number_3','selectable_number_4','selectable_number_5','selectable_number_6','selectable_number_7'];
List<int> listenerIDCloud = [29418,29421,29423,29424,29426,29427,29428];
List<NumberPaar> lovedNumbers = [];
int rotationPosition = 0;
bool isInit = false;
List <int> sevenRandomNumbers = [1,2,3,4,5,6,7];
SMINumber? _rotationInput;
var contextX;

List<String> calculations = [];


void startGameAgain() {
  sevenRandomNumbers.shuffle();
  for (int i = 0; i < 7; i++) {
    final String name = cloudNames[i];
    final int number = sevenRandomNumbers[i];

    NestedArtboard nestedArtboard = lovedNumbers[rotationPosition]._controller
        .hitNestedArtboards.firstWhere(
          (element) => element.name == name,
    );
    var nestedStateMachine = nestedArtboard.nestedStateMachines.first;
    NestedNumberBase nestedNumber = nestedStateMachine.children
        .first as NestedNumberBase;
    nestedNumber.nestedValue = number.toDouble();
  }
  for (int i = 0; i < 4; i++) {
    lovedNumbers[i].setRondomOuterNumberAndDeleteInnerNumber();
  }
  calculations = [];
}


class NumberPaar{
  final String _nameInnerNumber;
  final String _nameOuterNumber;
  int _outerNumber;
  final _controller;
  int _innerNumber = -1;
  late final NestedNumberBase _nestedNumberInner;
  late final NestedNumberBase _nestedNumberOuter;
  bool isSet = false;
  NumberPaar(this._controller, this._nameInnerNumber, this._nameOuterNumber, this._outerNumber){

    NestedArtboard nestedArtboard_OuterName = _controller.hitNestedArtboards.firstWhere(
          (element) => element.name == _nameOuterNumber,
    );
    var nestedStateMachineOuter = nestedArtboard_OuterName.nestedStateMachines.first;
    _nestedNumberOuter = nestedStateMachineOuter.children.first as NestedNumberBase;
    _nestedNumberOuter.nestedValue = _outerNumber.toDouble();

    NestedArtboard nestedArtboard_InnerName = _controller.hitNestedArtboards.firstWhere(
          (element) => element.name == _nameInnerNumber,
    );
    var nestedStateMachineInner = nestedArtboard_InnerName.nestedStateMachines.first;
    _nestedNumberInner = nestedStateMachineInner.children.first as NestedNumberBase;
    _nestedNumberInner.nestedValue = _innerNumber.toDouble();

  }

  void setRondomOuterNumberAndDeleteInnerNumber(){
    _innerNumber = -1;
    _nestedNumberInner.nestedValue = _innerNumber.toDouble();
    _outerNumber = Random().nextInt(7)+3;
    _nestedNumberOuter.nestedValue = _outerNumber.toDouble();
  }

  bool setInnerNumber(int number){
    _nestedNumberInner.nestedValue = number.toDouble();
    _innerNumber = number;
    isSet = true;
    return isCorrect();
  }
  bool isCorrect(){
    return _innerNumber + _outerNumber == 10;
  }
}


class InputListenerExample extends StatefulWidget {
  const InputListenerExample({Key? key}) : super(key: key);

  @override
  State<InputListenerExample> createState() => _InputListenerExampleState();
}

class _InputListenerExampleState extends State<InputListenerExample> {
  SMIInput<double>? numberInput;

  //List<int> listenerIDCloud = [29422,29422,29422,29422,29422,29422,29422];
  //List<NumberPaar> lovedNumbers = [];
  //int rotationPosition = 0;



  @override
  Widget build(BuildContext context) {
    contextX = context;
    return Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          'assets/numbersInLove.riv',
          fit: BoxFit.cover,
          onInit: (artboard) {
            final controller = CustomStateMachineController.fromArtboard(
              artboard,
              'State Machine 1',
              onInputChanged: (id, value) {
                if (id == numberInput?.id) {
                  // Do something
                }
              },
            );
            artboard.addController(controller!);

            lovedNumbers.add(NumberPaar(controller, 'set_number_0_0', 'set_number_0', Random().nextInt(6)+3));
            lovedNumbers.add(NumberPaar(controller, 'set_number_0_3', 'set_number_3', Random().nextInt(6)+3));
            lovedNumbers.add(NumberPaar(controller, 'set_number_0_2', 'set_number_2', Random().nextInt(6)+3));
            lovedNumbers.add(NumberPaar(controller, 'set_number_0_1', 'set_number_1', Random().nextInt(6)+3));


            isInit = true;
            _rotationInput = controller.findSMI('rotation') as SMINumber?;


            // rondomise the numbers in sevenRandomNumbers
            sevenRandomNumbers.shuffle();

            for(int i = 0; i < 7; i++){
              final String name = cloudNames[i];
              final int number = sevenRandomNumbers[i];

              NestedArtboard nestedArtboard = controller.hitNestedArtboards.firstWhere(
                    (element) => element.name == name,
              );
              var nestedStateMachine = nestedArtboard.nestedStateMachines.first;
              NestedNumberBase nestedNumber = nestedStateMachine.children.first as NestedNumberBase;
              nestedNumber.nestedValue = number.toDouble();

            }

          },
        ),
      ),
    );
  }
}

typedef InputChanged = void Function(int id, dynamic value);

class CustomStateMachineController extends StateMachineController {
  CustomStateMachineController(
      super.stateMachine, {
        core.OnStateChange? onStateChange,
        required this.onInputChanged,
      });

  final InputChanged onInputChanged;
  int lastChange = DateTime.now().millisecondsSinceEpoch;

  @override
  void setInputValue(int id, value) {
    if(!isInit){
      return;
    }

    if(listenerIDCloud.contains(id)){
      // if not longer then 500ms skip
      if(DateTime.now().millisecondsSinceEpoch - lastChange < 100){
        super.setInputValue(id, value);
        return;
      }
      lastChange = DateTime.now().millisecondsSinceEpoch;
      int index = listenerIDCloud.indexOf(id);
      bool isCorrect = lovedNumbers[rotationPosition].setInnerNumber(sevenRandomNumbers[index]);
      if(isCorrect){
        calculations.add("${lovedNumbers[rotationPosition]._innerNumber} + ${lovedNumbers[rotationPosition]._outerNumber} = 10 (richtig)");
      }
      else{
        calculations.add("${lovedNumbers[rotationPosition]._innerNumber} + ${lovedNumbers[rotationPosition]._outerNumber} = 10 (falsch)");
      }
      onInputChanged.call(id, value);
      if(isCorrect) {
        rotationPosition++;
        if(rotationPosition == 4){
          showDialog_AlertGameSummery(contextX, calculations, startGameAgain);
          rotationPosition = 0;
        }
        print("rotationPosition: $rotationPosition");
        if(_rotationInput == null){
          print("rotationInput is null");
        }
        else{
            _rotationInput!.value = rotationPosition.toDouble();
          }
      }

    }

    super.setInputValue(id, value);
  }

  static CustomStateMachineController? fromArtboard(
      Artboard artboard,
      String stateMachineName, {
        core.OnStateChange? onStateChange,
        required InputChanged onInputChanged,
      }) {
    for (final animation in artboard.animations) {
      if (animation is StateMachine && animation.name == stateMachineName) {
        return CustomStateMachineController(
          animation,
          onStateChange: onStateChange,
          onInputChanged: onInputChanged,
        );
      }
    }
    return null;
  }
}