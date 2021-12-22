import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';



const municipalityGraphQL= """
query {
  all_municipalities {
    id
    code
    name
    name_ar
    state {
      code
    }
  }
}
""";

class OperationsView extends StatelessWidget {
  const OperationsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Query(options: QueryOptions(document: gql(municipalityGraphQL)
      ),
       builder: (QueryResult result, {fetchMore, refetch}){
         if (result.hasException){
           return Text(result.exception.toString());
         }
         if (result.isLoading){
           return const Center(
             child: CircularProgressIndicator(),
           );
         }
         final movementList = result.data?['all_municipalities'];
         
         return Column(
           children: [
             const Padding(padding: EdgeInsets.all(20.0),
             child: Text("Les municipalités"),),
             Expanded(child: ListView.builder(
               itemCount: movementList.length,
               itemBuilder: (_,index){
                 var municipality= movementList[index];
                 return Column(
                   children: [
                     Text(municipality['name'])

                   ],
                 );
               },
             ))
           ],
         );


       }
        )
    );
  }
}

 