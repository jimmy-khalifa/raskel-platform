import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../localizations/app_localizations.dart';

class GraphqlButtonWithoutKey extends StatelessWidget {
  final bool isquery;
  // ignore: prefer_typing_uninitialized_variables
  final grahqlCode;
  //final grahqlCode2;
  // ignore: prefer_typing_uninitialized_variables
  final oncompleted;
  // final onpressedData;
  // final listItems;
  final Map<String, dynamic> variables;
  //final Map<String, dynamic> variables2;

  final String txt;
  // ignore: prefer_typing_uninitialized_variables
  final vertical;
  // ignore: prefer_typing_uninitialized_variables
  final horizontal;
  // ignore: prefer_typing_uninitialized_variables

  // ignore: use_key_in_widget_constructors
  const GraphqlButtonWithoutKey(
    this.txt,
    this.isquery,
    this.grahqlCode,
    this.variables,
    this.oncompleted,
    this.horizontal,
    this.vertical,
  );

  @override
  Widget build(BuildContext context) {
    return isquery
        ? Query(
            options:
                QueryOptions(document: gql(grahqlCode), variables: variables),
                
            builder: (QueryResult result, {fetchMore, refetch}) {
              if (result.hasException) {
              /*  var message = result.hasException
                    ? '${result.exception}'
                    : '${LocalizationHelper.of(context)!.t_success}';
                ;
                final snackBar = SnackBar(content: Text(message));
                Scaffold.of(context).showSnackBar(snackBar);*/
                return Text(result.exception!.graphqlErrors[0].message);
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
                    txt,
                    style: GoogleFonts.tajawal(
                        textStyle: const TextStyle(
                      color: Color(0xFF65C88D),
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                    )),
                  ));
            })
        : Mutation(
            options: MutationOptions(
              document: gql(grahqlCode),
              onCompleted: (data) {
                oncompleted(data);
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPage()));
              },
            ),
            builder: (RunMutation? _runMutation, QueryResult? result) {
              if (result!.hasException) {
                  /*  var message = result.hasException
                    ? '${result.exception}'
                    : '${LocalizationHelper.of(context)!.t_success}';
                ;
                final snackBar = SnackBar(content: Text(message));
                Scaffold.of(context).showSnackBar(snackBar);*/
                return Text(result.exception!.graphqlErrors[0].message);
              }
              // ignore: prefer_function_declarations_over_variables
              final runMutation = () => _runMutation!(variables);
              return OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: vertical, horizontal: horizontal),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF65C88D)),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () async {
                    runMutation();

                    //widget.onpressedData();
                    // addOtherMutation();
                  },
                  child: Text(
                    txt,
                    style: GoogleFonts.tajawal(
                        textStyle: const TextStyle(
                      color: Color(0xFF65C88D),
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                    )),
                  ));
            });
  }
  /*addOtherMutation(){
    Mutation(options:MutationOptions(document: gql(grahqlCode2),),
   
    builder: (RunMutation? runMutation, QueryResult? result) {
        
          runMutation!(variables2);
          return Text( "result");
          
          
          
          });
  }*/
}
