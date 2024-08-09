import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto/Pages/MainTimesPage/CreateNewTime.dart';
import 'package:projeto/functionsFlutter/Classes/Time.dart';
import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:projeto/utils/OptionsEvents.dart';

class MainTimePage extends StatefulWidget {
  const MainTimePage({super.key});

  @override
  State<MainTimePage> createState() => _MainTimePageState();
}

class _MainTimePageState extends State<MainTimePage> {
  late FirebaseAuth auth = FirebaseAuth.instance;

  late Time time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const OptionsEvents();
                  });
            },
            child: Icon(
              Icons.more_horiz,
              size: 50.0,
              color: ColorsPaleta().orange,
            ),
          ),
          const SizedBox(
            width: 9.0,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "Todos os times",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 27.0),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  getTimes(auth.currentUser!.uid);
                },
                child: const Text("rer"))
            // Padding(
            //   padding: const EdgeInsets.only(top: 40.0),
            //   child: Text(
            //     "Você ainda não está em nenhum time. ${'\n'} Crie o seu primerio time.",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //         color: ColorsPaleta().lineGreyColor, fontSize: 20.0),
            //   ),
            // ),
            // const Padding(
            //   padding: EdgeInsets.only(top: 5.0),
            //   child: Text(
            //     "⚽",
            //     style: TextStyle(fontSize: 60.0),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 85.0),
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           elevation: 6,
            //           shadowColor: Colors.black,
            //           fixedSize: const Size(338, 45),
            //           backgroundColor: ColorsPaleta().orange),
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const CreateNewTime()));
            //       },
            //       child: const Text(
            //         "Novo time",
            //         style: TextStyle(color: Colors.white, fontSize: 19.0),
            //       )),
            // )
          ],
        ),
      ),
    );
  }

  Stream<List<Time>> getTimes(String? userCurrentID) =>
      FirebaseFirestore.instance
          .collection("time_data_register")
          .snapshots()
          .asyncMap((QuerySnapshot querySnapshot) async {
        List<Time> contatos = [];

        // for (QueryDocumentSnapshot timeSnapshot in querySnapshot.docs) {
        //   String uidTime = timeSnapshot.id;

        //   QuerySnapshot subTimeSnapshot = await FirebaseFirestore.instance
        // }
        return [];
      });
}
