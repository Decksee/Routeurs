import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.account_circle_outlined, size: 70, color: Colors.grey,),
                      Icon(Icons.notifications_active_outlined,size: 40, color: Colors.grey,)
                    ],
                  ),
                ),
              )
          ),
          Expanded(
              flex:5,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: const BoxDecoration(
                        color: Color(0xff046ECE),
                        borderRadius: BorderRadius.only(
                            bottomLeft:Radius.circular(40),
                            topRight: Radius.circular(40)
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Gestion des boxes internets",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => _buildPopupDialog(context),
                              );
                            },
                            child: Text('Ajouter une box',
                              style: GoogleFonts.montserrat(
                                fontSize: 17,
                                color: const Color(0xff046ECE),
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    width: 650,
                    height: 160,
                    margin: const EdgeInsets.only(left: 40),
                    padding: const EdgeInsets.only(left: 40, top: 20, bottom: 10, right: 30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(width: 15, color: Colors.green)
                      )
                    ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Direction",
                                style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    color: const Color.fromRGBO(0, 0, 0, 0.4)
                                ),
                              ),
                              Text("Fournisseur",
                                style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    color: const Color.fromRGBO(0, 0, 0, 0.4)
                                ),
                              ),
                              Text("Prochain abonnement",
                                style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    color: const Color.fromRGBO(0, 0, 0, 0.4)
                                ),
                              ),
                              const Icon(FontAwesomeIcons.arrowDown, color: Color.fromRGBO(0, 0, 0, 0.3), size: 25,)

                            ],
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Numéro SIM:",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 0, 0, 0.8)
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text("XXXXXXX",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 0, 0, 0.8)
                                ),
                              ),
                              const SizedBox(width: 30,),
                              Text("|",
                                style: GoogleFonts.montserrat(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 0, 0, 0.4)
                                ),
                              ),
                              const SizedBox(width: 20,),
                              Text("Date abonnement",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 0, 0, 0.8)
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text("XXXXXXX",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 0, 0, 0.8)
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("CodeBox:XXXXXXXXXXXXXX",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 0, 0, 0.8)
                                ),
                              ),
                              Row(
                                children: [
                                  Text("Annuler",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(0, 0, 0, 0.8)
                                    ),
                                  ),
                                  const SizedBox(width: 30,),
                                  Text("Enregistrer",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color:  Colors.green
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),

                        ],
                      )
                  )

                ],
              )
          ),
        ],
      ),
    );
  }
}


Widget _buildPopupDialog(BuildContext context) {

  return AlertDialog(
    title: const Center(child: Text("Entrez vos information",textAlign:TextAlign.center,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Icon(Icons.cancel_outlined,size: 100,color: Colors.red,),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Fermé', style: TextStyle(color: Colors.red),),
      ),
    ],
  );
}
