import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../Screens/ItemDesign.dart';
class ItemShimmer extends StatelessWidget {
  const ItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.deepPurple,
                  highlightColor: Colors.grey,

                  child: ListView.builder(
                    itemBuilder: (_, __) => Column(
                      children: [
                        SizedBox(height: 30,),
                        Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(height: 20,width: 100,color: Colors.deepPurple[900],
                                            ),
                                          SizedBox(height: 3,),
                                          Container(height: 30,width: 150,color: Colors.deepPurple[900],
                                            )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.notifications_outlined,color: Colors.white,size: 20,),
                              SizedBox(width: 25,),
                              Container(
                                decoration: BoxDecoration(
                                    color:Colors.cyanAccent,
                                    borderRadius: BorderRadius.circular(12)),
                                height: 35,width: 35,child: Icon(Icons.menu,color: Colors.white,),)
                              ,SizedBox(width: 25,),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height/1.2,
                            child: ListView.builder(
                                itemCount:20,
                                itemBuilder: (context,index){
                                  return Container(
                                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    width: MediaQuery.of(context).size.width,
                                    height: 76,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple[900],
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    // child: Row(
                                    //   // mainAxisAlignment: MainAxisAlignment.end,
                                    //   // crossAxisAlignment: CrossAxisAlignment.center,
                                    //   children: [
                                    //     SizedBox(width: 12,),
                                    //     Expanded(
                                    //       child: CircleAvatar(
                                    //         child: Container(
                                    //           height: 30,
                                    //           width: 30,
                                    //           decoration: BoxDecoration(
                                    //               shape: BoxShape.circle,
                                    //               color: Colors.deepPurple[800]
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     // Image.network("https://th.bing.com/th/id/OIP.YBKxF3DlVPHLunAGuqRC5gHaFO?w=251&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",height: 35,width: 35,fit: BoxFit.fill,)),
                                    //     SizedBox(width: 10,),
                                    //     // Expanded(
                                    //     //   flex: 2,
                                    //     //   child: Column(
                                    //     //     crossAxisAlignment: CrossAxisAlignment.start,
                                    //     //     mainAxisAlignment: MainAxisAlignment.center,
                                    //     //     children: [
                                    //     //
                                    //     //       Container(width: MediaQuery.of(context).size.width,
                                    //     //           height: 30,color: Colors.deepPurple[800]
                                    //     //       ),
                                    //     //       SizedBox(height: 4,),
                                    //     //       Container(width: MediaQuery.of(context).size.width,
                                    //     //           height: 20,color: Colors.deepPurple[800]
                                    //     //       )
                                    //     //
                                    //     //     ],),
                                    //     // ),
                                    //
                                    //
                                    //
                                    //     SizedBox(width: 10,),
                                    //     // Sparkline(data: numbers)
                                    //
                                    //
                                    //   ],
                                    // ),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                    itemCount: 16,
                  ),
                ),
              )
            ]
        )
    );

  }
}




/*
 Container(
        color: Colors.deepPurple[800],
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(height: 20,width: 150,color: Colors.deepPurple[900],),
                                SizedBox(height: 3,),
                                Container(height: 30,width: 200,color: Colors.deepPurple[900],)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications_outlined,color: Colors.white,size: 20,),
                    SizedBox(width: 25,),
                    Container(
                      decoration: BoxDecoration(
                          color:Colors.cyanAccent,
                          borderRadius: BorderRadius.circular(12)),
                      height: 35,width: 35,child: Icon(Icons.menu,color: Colors.white,),)
                    ,SizedBox(width: 25,),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height/1.2,
                  child: ListView.builder(
                      itemCount:20,
                      itemBuilder: (context,index){
                        return Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          width: MediaQuery.of(context).size.width,
                          height: 76,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[900],
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 12,),
                              Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.deepPurple[800]
                                    ),
                                  ),
                                    ),
                              ),
                              // Image.network("https://th.bing.com/th/id/OIP.YBKxF3DlVPHLunAGuqRC5gHaFO?w=251&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",height: 35,width: 35,fit: BoxFit.fill,)),
                              SizedBox(width: 10,),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Container(width: MediaQuery.of(context).size.width,
                                    height: 30,color: Colors.deepPurple[800]
                                    ),
                                    SizedBox(height: 4,),
                                    Container(width: MediaQuery.of(context).size.width,
                                        height: 20,color: Colors.deepPurple[800]
                                    )

                                  ],),
                              ),



                              SizedBox(width: 10,),
                              // Sparkline(data: numbers)


                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          )

      );
 */

