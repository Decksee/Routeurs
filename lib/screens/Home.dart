import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../sqlbase/connectionRouteur.dart';
import '../sqlbase/model/routeur.dart';

class Home extends StatefulWidget {

  Routeur? route;
  Home({this.route});

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {


  final _formKey = GlobalKey<FormState>();
  Routeur route = Routeur.empty();
  TextEditingController _txtDirection = TextEditingController();
  TextEditingController _txtFournisseur = TextEditingController();
  RouteurDAO  _routeurDAO = RouteurDAO();

  void iniciarDadosDoFormulario() {
    if (widget.route != null) {
      _txtDirection.text = widget.route!.Direction;
      _txtFournisseur.text = widget.route!.Fournisseur;
      routeur = widget.route! as List<Routeur>;
    }
  }

  void Message(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void addofbase() async {
    try {
      Routeur retorno = await _routeurDAO.add(route);
      route.id = retorno.id;
      Message('Box ajouté avec succès');
      setState(() {});
    } catch (error) {
      print(error);
      Message("Erreur lors de l'ajout");
    }
  }

  @override
  void initState() {
    iniciarDadosDoFormulario();
    super.initState();
  }


  void save() {
    route.Direction = _txtDirection.text;
    route.Fournisseur = _txtFournisseur.text;
    if (route.id == null) {
      addofbase();
      return;
    }
  }

  List<Routeur> routeur=[];
  RouteurDAO _routeDAO=RouteurDAO();
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
              child:Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
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
                                      builder: (BuildContext context) {


                                        return AlertDialog(
                                          title: const Center(child: Text("Enregistrer une nouvelle box",textAlign:TextAlign.center,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),
                                          content: Container(
                                            width: 400,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Form(
                                                    key: _formKey,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 45,
                                                          child: TextFormField(
                                                            controller: _txtDirection,
                                                            style: GoogleFonts.montserrat(
                                                              color: const Color.fromRGBO(0, 0, 0, 0.7),
                                                              fontSize: 17,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                            cursorColor:Colors.grey,
                                                            decoration:  InputDecoration(
                                                              hintText: "Le nom de la Direction",
                                                              hintStyle: GoogleFonts.montserrat(
                                                                  color: Colors.grey,
                                                                  fontSize:18,
                                                                  fontWeight: FontWeight.w400
                                                              ),
                                                              focusColor: Colors.white,
                                                              border: InputBorder.none,
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                                                                borderRadius: BorderRadius.circular(7.0),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide:
                                                                const BorderSide(color: Colors.grey, width: 1.0),
                                                                borderRadius: BorderRadius.circular(7.0),
                                                              ),
                                                            ),
                                                            validator: (value) {
                                                              if (value == null || value.isEmpty) {
                                                                return 'Complètez de champ';
                                                              }
                                                              return null;
                                                            },

                                                          ),
                                                        ),
                                                        const SizedBox(height:20),
                                                        SizedBox(
                                                          height: 45,
                                                          child: TextFormField(
                                                            controller: _txtFournisseur,
                                                            style: GoogleFonts.montserrat(
                                                              color: const Color.fromRGBO(0, 0, 0, 0.7),
                                                              fontSize: 17,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                            cursorColor:Colors.grey,
                                                            decoration:  InputDecoration(
                                                              hintText: "Le nom du Fournisseur",
                                                              hintStyle: GoogleFonts.montserrat(
                                                                  color: Colors.grey,
                                                                  fontSize:18,
                                                                  fontWeight: FontWeight.w400
                                                              ),
                                                              focusColor: Colors.white,
                                                              border: InputBorder.none,
                                                              enabledBorder: OutlineInputBorder(
                                                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                                                                borderRadius: BorderRadius.circular(7.0),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                borderSide:
                                                                const BorderSide(color: Colors.grey, width: 1.0),
                                                                borderRadius: BorderRadius.circular(7.0),
                                                              ),
                                                            ),
                                                            validator: (value) {
                                                              if (value == null || value.isEmpty) {
                                                                return 'Complètez de champ';
                                                              }
                                                              return null;
                                                            },

                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                )
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel', style: TextStyle(color: Colors.red),),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: InkWell(
                                                  onTap:  () {
                                                    if (_formKey.currentState!.validate())
                                                    {save();}
                                                  },
                                                  child: const Text('Enregistrer', style: TextStyle(color: Colors.green),)),
                                            ),
                                          ],
                                        );

                                  }
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
                    ),
                    const SizedBox(height: 30,),
                    Expanded(
                      flex: 3,
                      child: Row(
                          children: [
                            Expanded(
                                flex:2,
                                child: Container(
                                  child:ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: routeur.length,
                                      itemBuilder: (context,index){
                                        Routeur routeurs=routeur[index];
                                        return Container(
                                            height: 160,
                                            margin: const EdgeInsets.only(left: 40,top: 5, bottom: 5, right: 10),
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
                                                      Text(routeurs.Direction,
                                                        style: GoogleFonts.montserrat(
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle: FontStyle.italic,
                                                            color: const Color.fromRGBO(0, 0, 0, 0.4)
                                                        ),
                                                      ), Text("Fournisseur",
                                                        style: GoogleFonts.montserrat(
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle: FontStyle.italic,
                                                            color: const Color.fromRGBO(0, 0, 0, 0.4)
                                                        ),
                                                      ), Text("Prochain abonnement",
                                                        style: GoogleFonts.montserrat(
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle: FontStyle.italic,
                                                            color: const Color.fromRGBO(0, 0, 0, 0.4)
                                                        ),
                                                      ),
                                                      const Icon(FontAwesomeIcons.arrowDown, color: Color.fromRGBO(0, 0, 0, 0.3), size: 25,),
                                                    ],
                                                  ),
                                                  Row(
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
                                                      Text("Routeur",
                                                        style: GoogleFonts.montserrat(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w600,
                                                            color: const Color.fromRGBO(0, 0, 0, 0.8)
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text("Modifier",
                                                            style: GoogleFonts.montserrat(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.blue,),
                                                          ), const SizedBox(width: 30,),
                                                          Text("Supprimer",
                                                            style: GoogleFonts.montserrat(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.w700,
                                                                color:  Colors.red
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ]
                                            )
                                        );
                                      }
                                  )
                                )
                            ),
                            Expanded(
                                child: Container(
                                )
                            ),
                          ],
                        ),
                    ),


                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}


/*Widget _buildPopupDialog(BuildContext context) {

  final _formKey = GlobalKey<FormState>();
  Routeur route = Routeur.empty();
  TextEditingController _txtDirection = TextEditingController();
  TextEditingController _txtFournisseur = TextEditingController();
  RouteurDAO  _routeurDAO = RouteurDAO();


  void Message(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void addofbase() async {
    try {
      Routeur retorno = await _routeurDAO.add(route);
      route.id = retorno.id;
      Message('Box ajouté avec succès');
      //setState(() {});
    } catch (error) {
      print(error);
      Message("Erreur lors de l'ajout");
    }
  }

  void save() {
    route.Direction = _txtDirection.text;
    route.Fournisseur = _txtFournisseur.text;
    if (route.id == null) {
      addofbase();
      return;
    }
  }




  return AlertDialog(
    title: const Center(child: Text("Enregistrer une nouvelle box",textAlign:TextAlign.center,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),
    content: Container(
      width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Form(
            key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: _txtDirection,
                      style: GoogleFonts.montserrat(
                        color: const Color.fromRGBO(0, 0, 0, 0.7),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      cursorColor:Colors.grey,
                      decoration:  InputDecoration(
                        hintText: "Le nom de la Direction",
                        hintStyle: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontSize:18,
                            fontWeight: FontWeight.w400
                        ),
                        focusColor: Colors.white,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Complètez de champ';
                        }
                        return null;
                      },

                    ),
                  ),
                  const SizedBox(height:20),
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: _txtFournisseur,
                      style: GoogleFonts.montserrat(
                        color: const Color.fromRGBO(0, 0, 0, 0.7),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      cursorColor:Colors.grey,
                      decoration:  InputDecoration(
                        hintText: "Le nom du Fournisseur",
                        hintStyle: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontSize:18,
                            fontWeight: FontWeight.w400
                        ),
                        focusColor: Colors.white,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Complètez de champ';
                        }
                        return null;
                      },

                    ),
                  ),
                ],
              )
          )
        ],
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Cancel', style: TextStyle(color: Colors.red),),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: InkWell(
          onTap:  () {
            if (_formKey.currentState!.validate())
            {save();}
          },
            child: const Text('Enregistrer', style: TextStyle(color: Colors.green),)),
      ),
    ],
  );
}*/
