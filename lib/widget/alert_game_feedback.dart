import 'package:flutter/material.dart';
import 'package:rive/rive.dart';



void showDialog_AlertFeedback(BuildContext context, Function startGameAgain) {

  SMIBool? _daumen;
  SMIBool? _zeigefinger;
  SMIBool? _mittelfinger;
  SMIBool? _ringfinger;
  SMIBool? _kleinerfinger;





  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController _controllerTextEditor = TextEditingController();
        double screenWidth = MediaQuery
            .of(context)
            .size
            .width;
        double screenHeight = MediaQuery
            .of(context)
            .size
            .height;
        double dialogWidth = screenWidth * 0.8;
        double dialogHeight = screenHeight * 0.8;

        void onRiveEvent2(RiveEvent event) {
          //events only haven when finger klicked
          print('Event: ${event.name}');
          //print SMIBools
          print('Daumen: ${_daumen!.value}');
          print('Zeigefinger: ${_zeigefinger!.value}');
          print('Mittelfinger: ${_mittelfinger!.value}');
          print('Ringfinger: ${_ringfinger!.value}');
          print('Kleinerfinger: ${_kleinerfinger!.value}');
        }

        void _onRiveInit(Artboard artboard) {
          final controller = StateMachineController.fromArtboard(artboard, 'State Machine 1');
          artboard.addController(controller!);
          _daumen = controller.findInput<bool>('Daumen') as SMIBool;
          _zeigefinger = controller.findInput<bool>('Zeigefinger') as SMIBool;
          _mittelfinger = controller.findInput<bool>('Mittelfinger') as SMIBool;
          _ringfinger = controller.findInput<bool>('Ringfinger') as SMIBool;
          _kleinerfinger = controller.findInput<bool>('Kleinerfinger') as SMIBool;


          controller.addEventListener(onRiveEvent2);
        }

        return AlertDialog(
          contentPadding: const EdgeInsets.all(10),
          content: SizedBox(
            width: dialogWidth,
            height: dialogHeight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Container(
                      child:
                      Column(
                        children: [
                          const SizedBox(height: 10,),
                          const Text("Feedback für Kind", style: TextStyle(fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(onTap: (){print("Das war gut");}, child: const Icon(Icons.thumb_up_outlined, size: 50,)),
                              GestureDetector(onTap: (){print("Sag es noch einmal");}, child: const Icon(Icons.record_voice_over_outlined, size: 70,)),
                              GestureDetector(onTap: (){print("Ich verstehe das Feedback nicht");}, child: const Icon(Icons.thumb_down_outlined, size: 50,)),
                            ],
                          ),

                          const SizedBox(height: 30,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: screenWidth/2.5,
                                height: screenHeight/2.5,
                                child: RiveAnimation.asset(
                                  'assets/finger.riv',
                                  onInit: (artboard) {
                                    _onRiveInit(artboard);
                                  },
                                ),
                              ),
                              Transform.flip(
                                flipX: true,
                                  transformHitTests: true,
                                  child: Container(
                                    width: screenWidth/2.5,
                                    height: screenHeight/2.5,
                                    child: RiveAnimation.asset(
                                    'assets/finger.riv',
                                    onInit: (artboard) {
                                      _onRiveInit(artboard);
                                    },
                                  ),
                                  )
                              ),
                            ],
                          ),


                        ],
                      )

                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    startGameAgain();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Schließen'),
                ),
              ],
            ),
          ),
        );
      },
    );
  });
}
