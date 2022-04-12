import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iraskel_mobile/components/atoms/_outlinedbutton.dart';

class GraphqlButtonforImage extends StatelessWidget {
  final bool isquery;
  // ignore: prefer_typing_uninitialized_variables
  final grahqlCode;
  //final grahqlCode2;
  // ignore: prefer_typing_uninitialized_variables
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
  const GraphqlButtonforImage(
    this.txt,
    this.isquery,
    this.grahqlCode,
    this.variables,
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
                onCompleted: (d) {},
                update: (cache, results) {
                  var message = results!.hasException
                      ? '${results.exception}'
                      : "Image was uploaded successfully!";

                  final snackBar = SnackBar(content: Text(message));
                  // ignore: deprecated_member_use
                  Scaffold.of(context).showSnackBar(snackBar);
                }),
            builder: (RunMutation? runMutation, QueryResult? result) {
              return (Button(
                txt,
                {runMutation!(variables)},
              ));
            });
  }
 
}
