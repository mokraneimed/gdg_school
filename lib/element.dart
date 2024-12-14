import 'package:flutter/material.dart';

class Element1 extends StatelessWidget {
  const Element1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 500,
        child: Container(
          color: Colors.red,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/sun.png",
                        height: 70,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("data 1"), Text("data 2")],
                      )
                    ],
                  ),
                  Text("222"),
                ],
              ),
              TextField(
                controller: textController,
              ),
              ElevatedButton(
                  onPressed: () {
                    print(textController.value.text);
                  },
                  child: Text("click me")),
              Icon(
                Icons.home,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
