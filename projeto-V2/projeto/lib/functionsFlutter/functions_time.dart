import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:io';

final docRefGlobal = FirebaseFirestore.instance;

final FirebaseAuth auth = FirebaseAuth.instance;

final User? user = auth.currentUser;
final uidUser = user?.uid;

Future<void> createNewTime(String nomeTime, String esporteTime,
    String cidadeTime, File? photoImage) async {
  final docRefTimeCollection = docRefGlobal.collection("time_data_register");

  final docRefChatTimeCollection =
      docRefGlobal.collection("chat_data_register");

  final absolutePath = 'files/${basename(photoImage!.path)}';

  final refUploadImage = FirebaseStorage.instance.ref().child(absolutePath);

  UploadTask? uploadTask;

  final jsonDataTime = {
    "NomeTime": nomeTime,
    "CidadeTime": cidadeTime,
    "NoticiasTime": [{}],
    "ChatTimeID": [{}],
    "LiderTime": uidUser,
    "ParticipantesTime": [
      {
        "UserId": uidUser,
        "PosicaoTime": "Líder",
      }
    ],
  };

  final jsonDataChat = {
    "ChatId": "",
    "TimeId": "",
    "ListParticipantes": [
      {
        "UserId": uidUser,
        "PosicaoTime": "Líder",
      }
    ],
    "ListMensagens": [{}],
  };

  try {
    await docRefTimeCollection
        .add(jsonDataTime)
        .then((DocumentReference docTime) async {
      docRefTimeCollection.doc(docTime.id).update({"TimeId": docTime.id});

      uploadTask = refUploadImage.putFile(photoImage);

      final spanshot = await uploadTask!.whenComplete(() {});

      final urlDownload = await spanshot.ref.getDownloadURL();

      docRefTimeCollection.doc(docTime.id).update({"PhotoImage": urlDownload});

      await docRefChatTimeCollection
          .add(jsonDataChat)
          .then((DocumentReference doc) async {
        docRefChatTimeCollection.doc(doc.id).update({"ChatId": doc.id});
        docRefChatTimeCollection.doc(doc.id).update({"TimeId": docTime.id});
        // docRefUserCollection.doc()
      });
    });
  } on FirebaseException catch (e) {
    print(e.message);
  } catch (e) {
    print(e);
  }
}
