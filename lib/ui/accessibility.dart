import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class AccessibilityFeature extends StatefulWidget {
  const AccessibilityFeature({super.key});

  @override
  State<AccessibilityFeature> createState() => _AccessibilityFeatureState();
}

class _AccessibilityFeatureState extends State<AccessibilityFeature> {
  final TextEditingController _textEditingController = TextEditingController();
  var hasil = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accessibility')),
      body: Column(
        children: [
          /*
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Semantics(
              onCopy: () { debugPrint('Hey, where are you taking that?'); },
              onCut: () { debugPrint('Give it back!'); },
              onPaste: () { debugPrint('All right, do not do that again though.'); },
              child: TextField(
                controller: _textEditingController,
                autocorrect: false,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: (){},
              child: Semantics(
                onTapHint: "Double Tap to Enter",
                child: Text("Enter"),
              ),
            ),
            ),
          Semantics(
            button: true,
            enabled: true,
            label: 'Clickable text here!',
            child: GestureDetector(
              onTap: () {
                print('Clicked!');
              }, child: Text('Click Me!', style: TextStyle(fontSize: 20))
            ),
          )
          */
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: (){
                    hasil++;
                  },
                  child: Text("Button-add".i18n()),
                ),
                Text('result'.i18n()),
                Text('${hasil}'),
                ElevatedButton(
                  onPressed: (){
                    hasil--;
                  },
                  child: Text("Button-dec".i18n()),
                ),
              ],
            ),),
        ],
      ),
    );
  }
}