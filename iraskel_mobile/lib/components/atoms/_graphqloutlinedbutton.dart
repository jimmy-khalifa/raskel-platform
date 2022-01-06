import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphqlButton extends StatefulWidget {
  final bool isquery;
  // ignore: prefer_typing_uninitialized_variables
  final grahqlCode;
  // ignore: prefer_typing_uninitialized_variables
  final oncompleted;
 // final onpressedData;
  // final listItems;
  final Map<String, dynamic> variables;

  final String txt;
  // ignore: prefer_typing_uninitialized_variables

  // ignore: use_key_in_widget_constructors
  const GraphqlButton(this.txt, this.isquery, this.grahqlCode, this.variables,this.oncompleted,);

  @override
  State<GraphqlButton> createState() => _GraphqlButtonState();
}

class _GraphqlButtonState extends State<GraphqlButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isquery
        ? Query(
            options: QueryOptions(
                document: gql(widget.grahqlCode), variables: widget.variables),
            builder: (QueryResult result, {fetchMore, refetch}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }
              if (result.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

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
                  onPressed: () {
                    // final listItems = result.data?[widget.listItems];
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
            })
        : Mutation(
            options: MutationOptions(document: gql(widget.grahqlCode),
            onCompleted: (data) {
              widget.oncompleted(data);
             //Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPage()));
            },
            
            ),
            builder: (RunMutation? _runMutation, QueryResult? result) {
              // ignore: prefer_function_declarations_over_variables
              final runMutation = () => _runMutation!(widget.variables);
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
                  onPressed: ()  async {
                    runMutation();
                    //widget.onpressedData();

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
