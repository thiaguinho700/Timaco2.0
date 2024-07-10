import 'package:projeto/utils/ColorsPaleta.dart';
import 'package:flutter/material.dart';

handleSnackBar(BuildContext context, String textError) {
    FocusScope.of(context).requestFocus(FocusNode());
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    width: MediaQuery.of(context).size.width - 5,
    content: Container(
        alignment: AlignmentDirectional.center,
        transformAlignment: AlignmentDirectional.center,
        padding: const EdgeInsets.all(4),
        height: 100,
        decoration: BoxDecoration(
            color: ColorsPaleta().red,
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Row(
          children: [
            Icon(
              Icons.error,
              color: ColorsPaleta().textMainColorWhite,
              size: 30,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Erro",
                  style: TextStyle(
                      color: ColorsPaleta().textMainColorWhite,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  textError,
                  style: TextStyle(
                      color: ColorsPaleta().textMainColorWhite, fontSize: 15.5),
                )
              ],
            )
          ],
        )),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ));
}

handleSnackBarSuccess(BuildContext context, String textError) {
  FocusScope.of(context).requestFocus(FocusNode());
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    width: MediaQuery.of(context).size.width - 5,
    content: Container(
        alignment: AlignmentDirectional.center,
        transformAlignment: AlignmentDirectional.center,
        padding: const EdgeInsets.all(4),
        height: 100,
        decoration: BoxDecoration(
            color: ColorsPaleta().green,
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Row(
          children: [
            Icon(
              Icons.check_box,
              color: ColorsPaleta().textMainColorWhite,
              size: 30,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Êxito",
                  style: TextStyle(
                      color: ColorsPaleta().textMainColorWhite,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  textError,
                  style: TextStyle(
                      color: ColorsPaleta().textMainColorWhite, fontSize: 15.5),
                )
              ],
            )
          ],
        )),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ));
}
