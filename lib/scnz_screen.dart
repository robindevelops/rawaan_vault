import 'package:flutter/material.dart';

class Scnz extends StatefulWidget {
  const Scnz({super.key});

  @override
  State<Scnz> createState() => _ScnzState();
}

class _ScnzState extends State<Scnz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text("ElevatedButton"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
