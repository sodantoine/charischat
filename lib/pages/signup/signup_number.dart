import 'package:flutter/material.dart';

import '../../utils/apptheme.dart';

class SignupNumber extends StatefulWidget {
  const SignupNumber({key}) : super(key: key);

  @override
  State<SignupNumber> createState() => _SignupNumberState();
}

class _SignupNumberState extends State<SignupNumber> {
  
  final _formKey = GlobalKey<FormState>();
  var dialcode ="+228";
  var number ="";

  @override
  void initState() {
    super.initState();
    //countryPicker = const FlCountryCodePicker();
  }

  @override
  void dispose() {
    //countryTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inscription', style:TextStyle(color:Colors.white))),
      body: Container(
        padding: EdgeInsets.fromLTRB(20,20, 20,20),
        child:Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("Numéro d'identification",style:TextStyle(fontSize: AppTheme.title2, fontWeight: FontWeight.w400,fontFamily:"OpenSans")),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child:TextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      maxLines: 1,    
                      initialValue: dialcode,    
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),   
                      decoration: const InputDecoration(
                        //labelStyle: TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
                        labelText: "",
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,)),   
                      ),
                      onSaved: (text) {
                        setState(() {
                          dialcode = text.toString();
                        });
                      },
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Requis';
                        }else{
                          return null;
                        }
                      },    
                    ), 
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    flex: 4,
                    child:TextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      maxLines: 1,    
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),   
                      decoration: const InputDecoration(
                        //labelStyle: TextStyle(fontSize: AppTheme.title4,fontFamily: "OpenSans",color:AppTheme.black,fontWeight: FontWeight.bold),
                        labelText: "Numéro de téléphone",
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,)),   
                      ),
                      onSaved: (text) {
                        setState(() {
                          dialcode = text.toString();
                        });
                      },
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Veuillez saisir votre numéro';
                        }else{
                          return null;
                        }
                      },      
                    ), 
                  ),                  
                ],
              ),
              SizedBox(height: 20,), 
              buildLoginButton()
            ]
          ),
        )
      )
                  
    );
  }

  Widget buildLoginButton() {
    return Container(
      alignment: AlignmentDirectional.bottomEnd,
      margin: const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: _saveForm,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Suivant",style: TextStyle(color: Colors.white),),
            Icon(Icons.arrow_right_alt, color:Colors.white)
          ],
        ),
        style: TextButton.styleFrom(
          //shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
          padding: const EdgeInsets.fromLTRB(30,10,30,10),
        ),    
      ),
    );
  }

  void _saveForm()async{   
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }
}