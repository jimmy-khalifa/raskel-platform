import 'package:flutter/material.dart';

class QueryDropDownGraphQl extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final grahqlCode;
  final String dropdowntextinput;
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  final listItems;
  // ignore: use_key_in_widget_constructors
  const QueryDropDownGraphQl(this.grahqlCode, this.dropdowntextinput, this.listItems, this.text);
  

  @override
  _QueryDropDownGraphQlState createState() => _QueryDropDownGraphQlState();
}

class _QueryDropDownGraphQlState extends State<QueryDropDownGraphQl> {
  @override
  Widget build(BuildContext context) {
    return Container();
    /* Query(
      options: QueryOptions(
                                      document: gql(widget.grahqlCode)),
                                  builder: (QueryResult result,
                                      {fetchMore, refetch}) {
                                    if (result.hasException) {
                                      return Text(result.exception.toString());
                                    }
                                    if (result.isLoading) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                   
                                    final listItems = result.data?[widget.listItems];
                                    return(
                                      DropdownInput(widget.dropdowntextinput,listItems, widget.text,null)
                                    );
      
                                       } );*/
  }
}