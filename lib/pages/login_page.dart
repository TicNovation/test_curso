import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_curso/controllers/login_controller.dart';
import 'package:test_curso/second_page.dart';

class HomePage extends StatefulWidget {

  HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final loginController = LoginController();

  var isLoading = false;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal:70),
                  child: Image.asset('assets/logo.png',)
                  ),  
                const SizedBox(height: 30,),
                Padding(
                  padding:  const EdgeInsets.only(left:8.0, right:8.0,),
                  child: TextFormField(
                    initialValue: loginController.user.user,//Se inicializa el valor del campo
                    onChanged: (val){//Se agregó para que pueda pasarle su valor al usuario del controlador
                    loginController.user.user = val;
                  },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Correo',
                      suffixIcon: Icon(Icons.mail)
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  initialValue: loginController.user.password,//Se inicializa el valor del campo
                  onChanged: (val){//Se agregó para que pueda pasarle su valor al usuario del controlador
                    loginController.user.password = val;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    suffixIcon: Icon(Icons.lock)
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * .8, 50)
                  ),
                  child: const Text('Iniciar sesión' , style: TextStyle(fontWeight: FontWeight.bold),),
                  onPressed: () async {
                    print(loginController.user.user);
                    print(loginController.user.password);
                    setState(() {
                      isLoading = true;
                    });
          
                    final bool resp = await loginController.login();
          
                    setState(() {
                      isLoading = false;
                    });
          
                    if (!mounted) return; //Se agregó para eliminar las líneas azules
                    
                    if(resp == true){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const SecondPage(texto: 'Bienvenido')));
          
                    }else{
          
                      Platform.isIOS ? showDialog(
                        context: context, 
                        builder: (_){
                          return  CupertinoAlertDialog(
                            title: const Text('Error'),
                            content: const Text('Su credenciales son incorrectas'),
                            actions: [
                                CupertinoDialogAction(
                                onPressed: ()=>Navigator.pop(context), 
                                child: const Text('Aceptar')
                              )
                            ],
                          );
                        }
                        ) : showDialog(
                        context: context, 
                        builder: (_){
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Su credenciales son incorrectas'),
                            actions: [
                              TextButton(
                                onPressed: ()=>Navigator.pop(context), 
                                child: const Text('Aceptar')
                              )
                            ],
                          );
                        }
                        );
                  } 
                  }
                )
          
            ],
            ),
          ),
          if(isLoading)...[
            const Center(
            child: CircularProgressIndicator(),
            )
          ]
  
        ],
      )
    );
  }

}