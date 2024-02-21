import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuktoro_feedback/widget/alert_game_feedback.dart';


void showDialog_AlertGameSummery(BuildContext context, List<String> calculations, Function startGameAgain) {
  // Obtain shared preferences.

  late final SharedPreferences prefs;
  final TextEditingController _controller = TextEditingController();

  SharedPreferences.getInstance().then((value) {
    prefs = value;
    _controller.text = prefs.getString('theme') ?? '';
  });

  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      builder: (BuildContext context) {

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

        return AlertDialog(
          contentPadding: const EdgeInsets.all(10),
          content: Container(
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
                          const Text("Zusammenfassung des Spieles", style: TextStyle(fontWeight: FontWeight.bold),),
                          const Text(">Dieses Menü wird dem Kind nicht gezeigt.<"),
                          const SizedBox(height: 30,),
                          TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              labelText: 'Thema des Spieles',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          const Text("Die Rechnungen des Kindes:"),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(
                                    calculations.length, (index) => Text(calculations[index])),
                              ),
                            ),
                          )
                        ],
                      )

                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () async {
                    await prefs.setString('theme', 'Hühner die Eier legen');
                    Navigator.of(context).pop();
                    showDialog_AlertFeedback(context, startGameAgain);
                  },
                  child: const Text('Weiter zum Feedback'),
                ),
                const SizedBox(height: 20,),
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
