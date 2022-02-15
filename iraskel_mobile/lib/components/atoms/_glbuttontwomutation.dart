import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlButtonWith2mutation extends StatefulWidget {
  final bool isquery;
  // ignore: prefer_typing_uninitialized_variables
  final grahqlCode;
  // ignore: prefer_typing_uninitialized_variables
  final grahqlCode2;
  // ignore: prefer_typing_uninitialized_variables
  final oncompleted;
  // final onpressedData;
  // final listItems;
  final Map<String, dynamic> variables;
  final Map<String, dynamic> variables2;

  final String txt;
  // ignore: prefer_typing_uninitialized_variables

  // ignore: use_key_in_widget_constructors
  const GraphqlButtonWith2mutation(this.txt, this.isquery, this.grahqlCode, this.variables,
      this.oncompleted, this.grahqlCode2, this.variables2);

  @override
  State<GraphqlButtonWith2mutation> createState() => _GraphqlButtonWith2mutationState();

  
}

class _GraphqlButtonWith2mutationState extends State<GraphqlButtonWith2mutation> {
  final mutationKey1 = GlobalKey<MutationState>();
  final mutationKey2 = GlobalKey<MutationState>();
  
  @override
  
  Widget build(BuildContext context) {
   
   /* final widget1 = Mutation(
        key: mutationKey1,
        options: MutationOptions(
          document: gql(widget.grahqlCode),
          onCompleted: (data) {
            widget.oncompleted(data);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPage()));
          },
        ),
        builder: (RunMutation? _runMutation, QueryResult? result) {
          // ignore: prefer_function_declarations_over_variables
          final runMutation1 = () => _runMutation!(widget.variables);
          return Text("");
        });*/
   /* final widget2 = Mutation(
        key: mutationKey2,
        options: MutationOptions(
          document: gql(widget.grahqlCode2),
        ),
        builder: (RunMutation? _runMutation, QueryResult? result) {
          // ignore: prefer_function_declarations_over_variables
          final runMutation = () => _runMutation!(widget.variables2);
          return SizedBox.shrink();
        });*/
      return  Mutation(
        key: mutationKey1,
        options: MutationOptions(
          document: gql(widget.grahqlCode),
          onCompleted: (data) {
            widget.oncompleted(data);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPage()));
          },
        ),
        builder: (RunMutation? _runMutation, QueryResult? result) {
          // ignore: prefer_function_declarations_over_variables
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 80,
              horizontal: MediaQuery.of(context).size.width / 9),
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFF65C88D)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onPressed: () async {
          mutationKey1.currentState?.runMutation(widget.variables);
         // mutationKey2.currentState?.runMutation(widget.variables2);
        },
        child: Text(
          widget.txt,
          style: GoogleFonts.tajawal(
              textStyle: const TextStyle(
            color: Color(0xFF65C88D),
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          )),
        ));
  });
}
}