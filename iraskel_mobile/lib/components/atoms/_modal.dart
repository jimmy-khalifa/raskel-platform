import 'package:flutter/material.dart';


class ShowCustomModal extends StatelessWidget {
  const ShowCustomModal({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
                title: const Text(' vous confirmer!'),
                actions: [
                  /* GraphqlButton('Confirmer', false, updateProducer, {
                     
                   }, oncompleted)*/
                  TextButton(onPressed: (){}, child: const Text('ok'))
                ],
                // content: ,
              );
  }
}