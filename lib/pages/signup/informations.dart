// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/apptheme.dart';

class Information extends StatefulWidget{

  Information({Key? key, required this.number}) : super(key: key);
  String ?number;

  @override
  _InformationState createState() => _InformationState();
}
class _InformationState extends State<Information> {
  
  final _formKey = GlobalKey<FormState>();
  String nom ="";
  String prenoms ="";
  String paroisse ="";
  String ville ="";
  String region ="";
  bool effuse = true;
  bool membrercc = false;
  bool membrecomite = false;
  
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Inscription',style:TextStyle(color:Colors.white))),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height:20), 
                buildTitle(),
                const SizedBox(
                  height: 15,
                ),              
                const SizedBox(
                  height: 15,
                ),
                
                buildNameField(),
                const SizedBox(
                  height: 15,
                ),
                buildFirstNameField(),
                const SizedBox(
                  height: 15,
                ),
                buildParoisseField(),
                const SizedBox(
                  height: 15,
                ),
                buildVilleField(),
                const SizedBox(
                  height: 15,
                ),
                buildRegionField(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Text('Effusé'),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          buildEffuseField()
                        ],
                      )
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Text('Membre du RCC'),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          buildMembreRCCField()
                        ],
                      )
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Text('Membre de comité'),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          buildMembreComiteField()
                        ],
                      )
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                buildSaveButton(size)
            ],
          ),
          )
        ),
      ),
    );
  }
 
  Widget buildTitle(){
    return const Text("Vos Informations presonnelles ",style:TextStyle(fontSize: AppTheme.title2, fontWeight: FontWeight.w500,fontFamily:"OpenSans"));
  }

  Widget buildNameField() {
    return Container(
      child: TextFormField(
        obscureText:false,
        onSaved: (text) {
          setState(() {
            nom = text.toString();
          });
        },
        validator: (value){
          if(value ==null || value.isEmpty){
            return 'Veuillez renseigner votre nom';
          }else{
            return null;
          }
        },
        //style:const TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          //labelStyle: TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
          labelText: "Votre nom",
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,)),       
        ),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0,0),
    );
  }
  
  Widget buildParoisseField() {
    return Container(
      child: TextFormField(
        obscureText:false,
        onSaved: (text) {
          setState(() {
            paroisse = text.toString();
          });
        },
        validator: (value){
          if(value ==null || value.isEmpty){
            return ' Veuillez entrer votre paroisse';
          }else{
            return null;
          }
        },
        //style:const TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          //labelStyle: TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
          labelText: "Votre paroisse",
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,)),   
        ),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0,0),
    );
  }

  Widget buildRegionField() {
    return Container(
      child: TextFormField(
        obscureText:false,
        onSaved: (text) {
          setState(() {
            region = text.toString();
          });
        },
        validator: (value){
          if(value ==null || value.isEmpty){
            return ' Veuillez entrer votre région';
          }else{
            return null;
          }
        },
        //style:const TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          //labelStyle: TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
          labelText: "Votre région",
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,)),   
        ),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0,0),
    );
  }

  Widget buildVilleField() {
    return Container(
      child: TextFormField(
        obscureText:false,
        onSaved: (text) {
          setState(() {
            ville = text.toString();
          });
        },
        validator: (value){
          if(value ==null || value.isEmpty){
            return ' Veuillez entrer votre ville';
          }else{
            return null;
          }
        },
        //style:const TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          //labelStyle: TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
          labelText: "Votre ville",
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,)),   
        ),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0,0),
    );
  }

  Widget buildFirstNameField() {
    return Container(
      child: TextFormField(
        obscureText:false,
        onSaved: (text) {
          setState(() {
            prenoms = text.toString();
          });
        },
        validator: (value){
          if(value ==null || value.isEmpty){
            return 'Veuillez renseigner votre prenom';
          }else{
            return null;
          }
        },
        //style:const TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          //labelStyle: TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
          labelText: "Votre prénoms",
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,)),   
        ),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0,0),
    );
  }

  Widget buildSaveButton(Size size) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0,0, 0,0),
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        /*onPressed: () {         
          Navigator.pushReplacementNamed(context, '/acceuil');     
        },*/
        onPressed:()=> _saveForm(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Enregistrer",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily:"OpenSans"),),
          ],
        ),
        style: TextButton.styleFrom(
          //backgroundColor: AppTheme.black,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0.0))),
          padding: const EdgeInsets.fromLTRB(30,10,30,10),
        ),
        
      ),
    );
  }
  
  Widget buildEffuseField(){
    return Checkbox(  
      //checkColor: Colors.greenAccent,  
      //activeColor: Colors.red,  
      value: this.effuse,  
      onChanged: (value) {  
        setState(() {  
          this.effuse = value!;  
        });  
      },  
    );
  }

  Widget buildMembreRCCField(){
    return Checkbox(       
      value: this.membrercc,  
      onChanged: (value) {  
        setState(() {  
          this.membrercc = value!;  
        });  
      },  
    );
  }

  Widget buildMembreComiteField(){
    return Checkbox(  
      value: this.membrecomite,  
      onChanged: (value) {  
        setState(() {  
          this.membrecomite = value!;  
        });  
      },  
    );
  }
  
  void _saveForm()async{
   
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showDialog(context,"Création de votre compte en cours ...");
     
    } 
      
  }

  void _showDialog(BuildContext context,String texte) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {

        return WillPopScope(
          onWillPop:() async => false,
          child:AlertDialog(
            content:Row(children: [
              //const CircularProgressIndicator(color:AppTheme.black),
              const SizedBox(width:10),
              Text(texte)
            ],),
          )
        );
      },
    );

  }
}



