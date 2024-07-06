import 'package:class_catch/features/cgpa_calculator/course_meta_data.dart';
import 'package:class_catch/features/cgpa_calculator/services/dropdown_wo_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class CgpaCalculatorScreen extends StatefulWidget {
  const CgpaCalculatorScreen({super.key});

  @override
  State<CgpaCalculatorScreen> createState() => _CgpaCalculatorScreenState();
}

class _CgpaCalculatorScreenState extends State<CgpaCalculatorScreen> {
  List<String> cdcnames = compulsoryCoursesList.map((map) => map['courseTitle'].toString()).toList();
  double cgpa = 7.58;
  double sgpa = 8.51;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset('assets/CGPA.svg',fit: BoxFit.cover,),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10,left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/menu.svg'),
                      const SizedBox(width: 20,),
                      Text('CGPA Calculator',
                        style: GoogleFonts.lexend(
                            fontSize: 24
                        ),)
                    ],

                  ),
                ),
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.transparent
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      CircularPercentIndicator(
                        animation: true,
                        animationDuration: 500,
                        radius: 60,
                        lineWidth: 9,
                        percent: (cgpa/10),
                        progressColor: const Color.fromARGB(255, 0, 190, 87),
                        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Spacer(flex: 1,),
                            Text('CGPA',
                            style: GoogleFonts.lexend(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 132, 122, 122)
                            ),),
                            Text(cgpa.toString(),
                            style: GoogleFonts.lexend(
                              fontSize: 36,
                              fontWeight: FontWeight.bold
                            ),),
                            const Spacer(flex: 2,)
                          ],
                        ),
                      ),
                      CircularPercentIndicator(
                        animation: true,
                        animationDuration: 500,
                        radius: 60,
                        lineWidth: 9,
                        percent: (sgpa/10),
                        progressColor: const Color.fromARGB(255, 0, 190, 87),
                        backgroundColor: const Color.fromARGB(255, 217, 217, 217),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Spacer(flex: 1,),
                            Text('SGPA',
                              style: GoogleFonts.lexend(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 132, 122, 122)
                              ),),
                            Text(sgpa.toString(),
                              style: GoogleFonts.lexend(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold
                              ),),
                            const Spacer(flex: 2,)
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: DropdownWoSearch(list: semesterList,text: 'Choose Semester',)
                ),
                const SizedBox(height: 35,),
                Center(
                  child: DropdownWoSearch(list: cdcnames,text: 'Choose Course',),
                ),
                const SizedBox(height: 30,),
                Center(
                  child: DropdownWoSearch(list: gradesList,text: 'Choose Grade',),
                ),
                const SizedBox(height: 40,),
                Center(
                  child: Container(
                    height: 100,
                    width: 310,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 35, 35, 35),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: const Color.fromARGB(255, 53, 53, 53)
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 28,),
                Padding(
                    padding: const EdgeInsets.only(bottom: 31,left: 10,right: 10),
                    child: GestureDetector(
                      onTap: (){},
                      child: SvgPicture.asset('assets/done_button.svg'),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
