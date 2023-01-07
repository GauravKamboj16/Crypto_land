import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
class DetailsPageShimmer extends StatelessWidget {
   const DetailsPageShimmer({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Column(
       children: [
         // SizedBox(height: 30,),
         Padding(
           padding: const EdgeInsets.all(1.0),
           child: Container(
             color: Colors.black26,
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: Column(
                 children: [
                   Stack(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 5),
                         child: Align(
                           alignment: Alignment.topLeft,
                           child:Container(
                            width: MediaQuery.of(context).size.width,
                             height:  MediaQuery.of(context).size.height/5.3,

                           ),
                         ),
                       ),
                       Align(
                         alignment: Alignment.topLeft,
                         child: Text(
                           "    ",
                           style: GoogleFonts.lato(
                               fontSize: 23,
                               fontWeight: FontWeight.w800,
                               color: Colors.white),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         height: 28,
                         width: 70,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.lightGreenAccent[700]),
                         child: Center(
                             child: Text(
                               "   ",
                               style: GoogleFonts.poppins(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w400),
                             )),
                       ),
                       Container(
                         height: 28,
                         width: 70,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.lightGreenAccent[700]),
                         child: Center(
                             child: Text( "...%",
                                 style: GoogleFonts.poppins(
                                     color: Colors.white,
                                     fontWeight: FontWeight.w400))),
                       )
                     ],
                   )
                 ],
               ),
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               SizedBox(
                 height: 10,
               ),
               Align(
                 alignment: Alignment.center,
                 child:  Container(
                   height: 20,
                   width: 90,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10)
                   ),
                 ),
               ),
               SizedBox(
                 height: 8,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "price",
                     style: GoogleFonts.poppins(
                       color: Colors.white,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                   Text(
                    "----",
                     style: GoogleFonts.poppins(
                       color: Colors.blue,
                       fontWeight: FontWeight.w600,
                     ),
                   )
                 ],
               ),
               SizedBox(
                 height: 8,
               ),
               Divider(
                 height: 1,
                 color: Colors.white38,
               ),
               SizedBox(
                 height: 8,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Market Cap",
                     style: GoogleFonts.poppins(
                       color: Colors.white,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                   Text("----",
                     style: GoogleFonts.poppins(
                       color: Colors.blue,
                       fontWeight: FontWeight.w600,
                     ),
                   )
                 ],
               ),
               SizedBox(
                 height: 8,
               ),
               Divider(
                 height: 1,
                 color: Colors.white38,
               ),
               SizedBox(
                 height: 8,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Rank",
                     style: GoogleFonts.poppins(
                       color: Colors.white,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                   Text(
                     "----",
                     style: GoogleFonts.poppins(
                       color: Colors.blue,
                       fontWeight: FontWeight.w600,
                     ),
                   )
                 ],
               ),
               SizedBox(
                 height: 8,
               ),
               Divider(
                 height: 1,
                 color: Colors.white38,
               ),
               SizedBox(
                 height: 8,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Listed At",
                     style: GoogleFonts.poppins(
                       color: Colors.white,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                   Text("----",
                     style: GoogleFonts.poppins(
                       color: Colors.blue,
                       fontWeight: FontWeight.w600,
                     ),
                   )
                 ],
               ),
               SizedBox(
                 height: 8,
               ),
               Divider(
                 height: 1,
                 color: Colors.white38,
               ),
               SizedBox(
                 height: 8,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "24 Hours Volume",
                     style: GoogleFonts.poppins(
                       color: Colors.white,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                   Text(
                     "----",
                     style: GoogleFonts.poppins(
                       color: Colors.blue,
                       fontWeight: FontWeight.w600,
                     ),
                   )
                 ],
               ),
               SizedBox(
                 height: 8,
               ),
               Divider(
                 height: 1,
                 color: Colors.white38,
               ),
             ],
           ),
         )
       ],
     );
   }
 }
