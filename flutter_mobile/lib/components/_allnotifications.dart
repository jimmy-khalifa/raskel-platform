import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:google_fonts/google_fonts.dart';

class AllNotifications extends StatefulWidget {
  const AllNotifications({Key? key}) : super(key: key);

  @override
  _AllNotificationsState createState() => _AllNotificationsState();
}

class _AllNotificationsState extends State<AllNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Card(
            clipBehavior: Clip.antiAlias,
             shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    FeatherIcons.bell,
                    color: Color(0xFF65C88D),
                  ),
                  title: 
                    Text(
                      'Notifications',
                      style: GoogleFonts.tajawal(
                          textStyle: const TextStyle(
                        color: Color(0xFF65C88D),
                        fontWeight: FontWeight.w900,
                      )),
                    ),
                  
                ),
                Divider(
              height: 1,
              thickness: 1,
              color:const Color(0xFFdff4ec),
              indent: MediaQuery.of(context).size.width * 4 / 100,
              endIndent: MediaQuery.of(context).size.width * 4 / 100,
            ),
                Column(
                  children: [
                    ListTile(
                        title: Text("Nouveau",
                            style: GoogleFonts.tajawal(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 23)))),
                    Card(
                      color: const Color(0xFFF7FFFB),
                       shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      child: ListTile(
                        
                        leading: 
                          
                         const CircleAvatar(
                          backgroundColor: Color(0xFFDFF4EC),
                          radius: 20,
                          child: Icon(
                            FeatherIcons.truck,
                            color: Colors.white,
                          ),
                          
                        ),
                       
                          title: Text("Collecte",
                            style: GoogleFonts.tajawal(
                                textStyle: const TextStyle(
                              color: Color(0xFF393E41),
                              fontWeight: FontWeight.w700,
                            ))),
                        subtitle: const Text("Demande de collecte accepté et traité"),
                        trailing: IconButton(
                            onPressed: () => _onButtonPressed(),
                            icon: const Icon(Icons.more_horiz)),
                      
                      ),
                    
                    ),
                    ListTile(
                        title: Text("Plus Tot",
                            style: GoogleFonts.tajawal(
                                textStyle: const  TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 23)))),
                    Card(
                       shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      color: const Color(0xFFF7FFFB),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFFDFF4EC),
                          radius: 20,
                          child: Icon(
                            FeatherIcons.gift,
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Récompense",
                            style: GoogleFonts.tajawal(
                                textStyle: const TextStyle(
                              color: Color(0xFF393E41),
                              fontWeight: FontWeight.w700,
                            ))),
                        subtitle:
                            const Text("Vous avez reçu une récompense de 200 points"),
                        trailing: IconButton(
                            onPressed: () => _onButtonPressed(),
                            icon:  const Icon(Icons.more_horiz)),
                      ),
                    ),
                    Card(
                       shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      color:const Color(0xFFF7FFFB),
                      child: ListTile(
                        leading:const CircleAvatar(
                          backgroundColor: Color(0xFFDFF4EC),
                          radius: 20,
                          child: Icon(
                            FeatherIcons.messageSquare,
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Commentaire",
                            style: GoogleFonts.tajawal(
                                textStyle:const TextStyle(
                              color: Color(0xFF393E41),
                              fontWeight: FontWeight.w700,
                            ))),
                        subtitle:const Text(
                            "Vous avez un nouveau commentaire de la part de"),
                        trailing: IconButton(
                            onPressed: () => _onButtonPressed(),
                            icon:const Icon(Icons.more_horiz)),
                      ),
                    ),
                    Card(
                       shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      color:const Color(0xFFF7FFFB),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFFDFF4EC),
                          radius: 20,
                          child: Icon(
                            FeatherIcons.heart,
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Réaction",
                            style: GoogleFonts.tajawal(
                                textStyle:const TextStyle(
                              color: Color(0xFF393E41),
                              fontWeight: FontWeight.w700,
                            ))),
                        subtitle: const
                            Text("Flen Foulani a réagi à votre publication "),
                        trailing: IconButton(
                            onPressed: () => _onButtonPressed(),
                            icon:const Icon(Icons.more_horiz)),
                      ),
                    ),
                    Card(
                       shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      color:const Color(0xFFF7FFFB),
                      child: ListTile(
                        leading:const CircleAvatar(
                          backgroundColor: Color(0xFFDFF4EC),
                          radius: 20,
                          child: Icon(
                            FeatherIcons.heart,
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Réaction",
                            style: GoogleFonts.tajawal(
                                textStyle:const TextStyle(
                              color: Color(0xFF393E41),
                              fontWeight: FontWeight.w700,
                            ))),
                        subtitle:
                         const   Text("Flen Foulani a réagi à votre publication "),
                        trailing: IconButton(
                            onPressed: () => _onButtonPressed(),
                            icon:const Icon(Icons.more_horiz)),
                      ),
                    )
                  ],
                )
              ],
            ))));
  }

  _onButtonPressed() {
    showModalBottomSheet(
        shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width /4,
                    decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                const   Text("Vous avez collecté 100 points")
                ],
              ));
        });
  }
}
