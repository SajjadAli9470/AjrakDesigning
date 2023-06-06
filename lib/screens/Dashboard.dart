import 'package:design_ajrak2/main.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
@immutable
class Dashboard extends KFDrawerContent {
  Dashboard();

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          backgroundColor: color.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
                onPressed: widget.onMenuPressed,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 20,
                )),
          ),
          body: Center(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: width*0.1,
                    width: height*0.1,
                    child: Image.asset('assets/logo.png')),
                ),

                
                Center(
                  child: Container(
                      child: Text("Ajrak Customizer",style: TextStyle(
                        color: color.blue,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                ),
               
                Center(
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Welcome to Ajrak Customizer App",style: TextStyle(
                    color: color.red,fontSize: 30
                  ),)
                 ],)
                ),
               
                Container(
                  child:Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        height: height*0.1,
                        width: width*0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage('assets/design1.jpeg'),fit: BoxFit.fill),
                        ),
    //                     
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        height: height*0.1,
                        width: width*0.1,
                        decoration: BoxDecoration(
                           image: DecorationImage(image: AssetImage('assets/design2.jpeg'),fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
    //                    
    
                        ),
                       
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        height: height*0.1,
                        width: width*0.1,
                        decoration: BoxDecoration(
                           image: DecorationImage(image: AssetImage('assets/design3.webp'),fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
    //                    
                        ),
                       
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: color.red

                            ),
                            
                          )
                        ],
                      )

                    ],
                  ) 
                  ,
                ),
                
              ],
            )
          )),
    );
  }
}

// Widget CustomContainer( String ){
//   return
// }