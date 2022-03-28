import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class QueryDropDownGraphQl extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final grahqlCode;
  final String dropdowntextinput;
  final String text;
  final String id;
  // ignore: prefer_typing_uninitialized_variables
  final listItems;
  final Function setter;
  final Map<String,dynamic> variables;
  // ignore: use_key_in_widget_constructors
  const QueryDropDownGraphQl(this.grahqlCode,this.variables, this.dropdowntextinput, this.listItems, this.text,this.id,this.setter,);
  

  @override
  _QueryDropDownGraphQlState createState() => _QueryDropDownGraphQlState();
}

class _QueryDropDownGraphQlState extends State<QueryDropDownGraphQl> {
  @override
  Widget build(BuildContext context) {
    return     Query(
      options: QueryOptions(
                                      document: gql(widget.grahqlCode), variables: widget.variables),
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
                                   
                                    // ignore: unused_local_variable
                                    final listItems = result.data?[widget.listItems];
                                    return(
                                      Container()
                                     // DropdownInput(widget.dropdowntextinput,listItems, widget.text,widget.id,widget.setter,)
                                    );
      
                                       } );
  }
}