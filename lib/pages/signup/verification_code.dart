// ignore: import_of_legacy_library_into_null_safe
// ignore: import_of_legacy_library_into_null_safe
import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../../utils/apptheme.dart';
import 'informations.dart';
// ignore: import_of_legacy_library_into_null_safe
class VerificationCode extends StatefulWidget{

  VerificationCode({Key? key,this.number,this.verificationId,this.otpCode,this.token}) : super(key: key);
  
  String ? email;
  String ?number;
  String ?verificationId;
  String ? otpCode;
  int ?token;

  @override
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  int state = 0;
  String ?code;
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: AppTheme.greyColor),
      borderRadius: BorderRadius.circular(0.0),
      color:Colors.grey
    );
  }
  @override
  void initState(){
    super.initState();
    //_verifyPhone();
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    /*final defaultPinTheme = PinTheme(
      width: size.width/12,
      height: size.width/12,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.black),
      ),
    );*/
    

    return Scaffold(
        appBar: AppBar(title: Text("Inscription",style:TextStyle(color:Colors.white)),),
        body: Container(
          padding:const EdgeInsets.all(20),
          child:Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height:20,
              ),
              buildTitle(),
              const SizedBox(
                height:15,
              ),
              /*Pinput(
                  length: 3,
                  onSubmitted: (String pin) {
                    setState(() {
                      state = 1;
                      code = pin;
                    });
                  },
                  defaultPinTheme: defaultPinTheme,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.red),
                  ),
                  followingPinTheme: PinTheme(),
                  
                ),*/
              PinPut(
                fieldsCount: 6,
                onSubmit: (String pin) {
                  setState(() {
                    state = 1;
                    code = pin;
                  });
                },
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                selectedFieldDecoration: _pinPutDecoration.copyWith(
                  border: Border.all(
                    color: AppTheme.black,
                  ),
                ),
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  //borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: AppTheme.greyColor,
                  ),
                ),
                eachFieldWidth: size.width/12,
                eachFieldHeight: size.width/12,
              ),
              const SizedBox(height: 15),
              const Divider(),
              resendCode(),
              const SizedBox(height:15 ),
              buildCodeText(),
              buildBackButton(size)
              
            ],
          ),             
        )
      );
  }
 

  Widget buildTitle(){
    return Text("Saisissez le code de 6 chiffres envoyé au ${widget.number}",style:const TextStyle(fontSize: AppTheme.title2,fontWeight: FontWeight.w400,color: AppTheme.black,fontFamily: "OpenSans"));
  }
  Widget buildCodeText(){
    return const InkWell(
      onTap: null,
      child:Text("Un nouveau code vous sera renvoyé sur votre numero.veuillez confirmer sur votre telephone!",style:TextStyle(fontWeight: FontWeight.w300, fontSize: AppTheme.title5,color: AppTheme.black,fontFamily: "OpenSans")),
    ) ;
  }
  Widget resendCode(){
    return TextButton(
        onPressed: (){
          _showDialog(context,"Envoie du code d'authentification en cours");
          _auth.verifyPhoneNumber(
            phoneNumber: widget.number.toString(),
            timeout:const Duration(seconds: 60),
            verificationCompleted: (PhoneAuthCredential credential) {
              _auth.signInWithCredential(credential).then((UserCredential result){
                // ignore: avoid_print
                if(result.user != null){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => Information(number:widget.number)
                ));
                }else{
                  _showMessage("Code de vérification non valide");
                }
              }).catchError((e){
                debugPrint(e.toString());
                _showMessage("Code de vérification non valide");
              });
            },
            verificationFailed: (FirebaseAuthException e) {
              debugPrint("erreur d'authentification" +e.toString());
              _showMessage('Une erreur s\'est produite.Veuillez réessayer ou vérifier votre connexion internet!',);
            },
            codeSent: (String verificationId, int? resendToken) {
              Navigator.pop(context);
              _showMessage("Code de vérification envoyé");
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              _showMessage("Code de vérification expiré.Veuillez réessayer");
            },
            forceResendingToken: widget.token
        
          );
        }, 
        child: Container(
            //color:AppTheme.greyColor,
            padding:const EdgeInsets.all(20),
            decoration: BoxDecoration(color:AppTheme.greyColor, borderRadius: BorderRadius.circular(20)),
            child:const Text("Je n'ai pas reçu de code",style:TextStyle(color:AppTheme.black)),
        )
    );
  }

 Widget buildBackButton(Size size) {
  return Expanded(
    child: Container(
      alignment: AlignmentDirectional.bottomStart,
      height:double.maxFinite,
      margin: const EdgeInsets.all(0),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          IconButton(
            onPressed:(){
              Navigator.pop(context);
            }, 
            icon:const Icon(Icons.arrow_back_rounded,color:AppTheme.greyColor,size:40,)
          ),
          Row(children: [
            ElevatedButton(      
              onPressed:(){
                if(state == 0){
                  _showMessage('Veuillez saisir le code que vous avez reçu!');
                }else{
                  AuthCredential _credential = PhoneAuthProvider.credential(verificationId:widget.verificationId.toString(), smsCode: code.toString());
                  _auth.signInWithCredential(_credential).then((UserCredential result){
                    if(result.user != null){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => Information(number:widget.number)
                    ));
                    }else{
                      _showMessage("Code de vérification non valide");
                    }
                    
                  }).catchError((e){
                    debugPrint(e.toString());
                    _showMessage("Code de vérification non valide");
                  });                 
                }
              },              
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Suivant",style: TextStyle(color: Colors.white, fontSize: AppTheme.title4),),
                  Icon(Icons.arrow_right_alt,color:AppTheme.white)
                ],
              ),
              style: TextButton.styleFrom(
                //backgroundColor: AppTheme.black,
                //shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18.0))),
                padding: const EdgeInsets.fromLTRB(30,10,30,10),
              ),
              
            ),
          ],)
        ]
      )          
    )
    );
  }
  void _showMessage(String texte){
    Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        borderRadius: const BorderRadius.all(Radius.circular(18.0)),
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        messageText: Text(
          texte,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: AppTheme.black,
        duration: const Duration(seconds:5),
      ).show(context);
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
              const CircularProgressIndicator(color:AppTheme.black),
              const SizedBox(width:10),
              Text(texte)
            ],),
          )
        );
       
      },
    );
  }


 _verifyPhone() async {
      await Future.delayed(const Duration(seconds:3), (){
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => Information(number:widget.number)
        ));
      });   
  }
}



