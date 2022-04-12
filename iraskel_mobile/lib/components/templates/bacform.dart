import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:iraskel_mobile/components/atoms/_custominputwithddefaultvalue.dart';
import 'package:iraskel_mobile/components/atoms/_dropdownwithoutdefaultvalue.dart';
import 'package:iraskel_mobile/components/atoms/_spacing.dart';
import 'package:iraskel_mobile/components/molecules/formheader.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

import '../../auth_graphql_client.dart';

// ignore: constant_identifier_names
const TypeGraphql = """
query{
	all_bin_types{
		id
		code
	}
}
""";
// ignore: constant_identifier_names
const BrandGraphql = """
query{
	all_bin_brands{
		id
		code
	}
}
""";
const binByProducer = """
query(\$producerId: ID!){
 bins_by_producer(producerId: \$producerId){
	id
	size
	volume
	color
	type{
		id
		code
	}
	brand{
		id
	}
	
}
}
""";

class BacForm extends StatefulWidget {
  const BacForm({Key? key}) : super(key: key);

  @override
  _BacFormState createState() => _BacFormState();
}

class _BacFormState extends State<BacForm> {
  late final Box box = Hive.box('auth');
  late String typeId = "";
  late String brandId = "";
  late String size = "";
  late String volume = "";
  late String color = "";
   late String binId;
  
  bool loading = false;
   void initQueryBin() async {
    final QueryOptions options = QueryOptions(
        document: gql(binByProducer),
        variables: {"producerId": box.get('ProducerId')});
    setLoading(true);
    final QueryResult result =
        await AuthGraphQLClient.getClient(null).query(options);

    setLoading(false);

    if (result.hasException) {
      // ignore: avoid_print
      print(result.exception.toString());
    } else {
      final bin = result.data?['bins_by_producer'];
       //box.put('PropertyId', property[0]['id']);
       if (bin.length == 0){
         setBinId("");
       }
       else{
         setBinId(bin[0]['id']);
         

       }
     
      
      //print(propertyId);
    }
  }
  setLoading(value) {
    setState(() {
      loading = value;
    });
  }

  setBinId(value){
    setState(() {
      binId = value;
       box.put('BinId', value);
     
    });
    
     

  }

  setTypeId(value) {
    setState(() {
      typeId = value;
     
    });
     box.put('binTypeId', value);

    
  }

  setBrandId(value) {
    setState(() {
      brandId = value;
      
    });
    box.put('binBrandId', value);
    
  }

  setSize(value) {
    setState(() {
      size = value;
       box.put('sizeBin', value);
    });
   
  }

  setVolume(value) {
    setState(() {
      volume = value;
      box.put('volumeBin', value);
    });
    
  }

  setColor(value) {
    setState(() {
      color = value;
       box.put('colorBin', value);
    });
   
  }
  @override
  void initState() {
    super.initState();
    initQueryBin();
    color =  box.get('colorBin');
    volume = box.get('volumeBin');
    size= box.get('sizeBin');
  }
    final formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 20,
                left: MediaQuery.of(context).size.width / 25,
                right: MediaQuery.of(context).size.width / 25,
                bottom: MediaQuery.of(context).size.height / 45),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
                margin: const EdgeInsets.only(
                    top: 25, left: 20, right: 20, bottom: 10),
                child: Column(children: [
                  FormHeader(
                      headerText: '${LocalizationHelper.of(context)!.t_bac}'),
                  Expanded(
                      child: SingleChildScrollView(
                          primary: false,
                          padding: EdgeInsets.zero,
                           child: Form(
                                key: formKey,
                          child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Query(
                                        options: QueryOptions(
                                          document: gql(TypeGraphql),
                                        ),
                                        builder: (QueryResult result,
                                            {fetchMore, refetch}) {
                                          if (result.hasException) {
                                            return Text(
                                                result.exception.toString());
                                          }
                                          if (result.isLoading) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }

                                          final listItems =
                                              result.data?['all_bin_types'];
                                          // setTypeId(listItems3['id']);

                                          return (
                                            
                                            DropdownInputWithoutvalue(
                                            '${LocalizationHelper.of(context)!.t_type}',
                                            listItems,
                                            'code',
                                            'id',
                                            setTypeId,
                                         

                                          ) 
                                          );
                                        }),

                                    const Spacing(40),
                                    Query(
                                        options: QueryOptions(
                                          document: gql(BrandGraphql),
                                        ),
                                        builder: (QueryResult result,
                                            {fetchMore, refetch}) {
                                          if (result.hasException) {
                                            return Text(
                                                result.exception.toString());
                                          }
                                          if (result.isLoading) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }

                                          final listItems2 =
                                              result.data?['all_bin_brands'];

                                          return (DropdownInputWithoutvalue(
                                              '${LocalizationHelper.of(context)!.t_brand}',
                                              listItems2,
                                              'code',
                                              'id',
                                              setBrandId,
                                           
                                             ));
                                        }),
                                    const Spacing(40),
                                    CustomInputWithDefaultValue('${LocalizationHelper.of(context)!.t_size}', setSize,
                                    box.get('sizeBin')  ??  size, true, false, true),
                                    const Spacing(40),

                                    CustomInputWithDefaultValue('${LocalizationHelper.of(context)!.t_volume}',
                                        setVolume,box.get('volumeBin') ?? volume, true, false, true),
                                    const Spacing(40),

                                    CustomInputWithDefaultValue('${LocalizationHelper.of(context)!.t_color}',
                                        setColor,box.get('colorBin') ?? color,true, false, true),
                                    const Spacing(40),

                                    Image.asset(
                                      'assets/images/bin.png',
                                      fit: BoxFit.contain,
                                      height: 100,
                                    ),

                                    // StartImage('assets/images/bin.png', BoxFit.contain)
                                  ])))))
                ]))));
  }
}
