import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:flutter/material.dart';

class OptionsEvents extends StatefulWidget {
  const OptionsEvents({super.key});

  @override
  State<OptionsEvents> createState() => _OptionsEventsState();
}

class _OptionsEventsState extends State<OptionsEvents> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 90.0,
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(width: 2)),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 90,
                      height: 9,
                      decoration: BoxDecoration(
                          color: ColorsPaleta().yellow,
                          
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)))),
                  const Text(
                    "OPÇÕES",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  )
                ]),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero)),
            child: Row(children: [
              Icon(
                Icons.clear,
                size: 30.0,
                color: ColorsPaleta().orange,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                "Cancelar evento",
                style: TextStyle(fontSize: 19.0, color: ColorsPaleta().orange),
              )
            ]),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero)),
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Deletar eventos",
                    style: TextStyle(color: Colors.red, fontSize: 19.0),
                  )
                ],
              ))
        ]),
      ),
    ]);
  }
}
