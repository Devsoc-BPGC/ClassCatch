import 'package:class_catch/features/cgpa_calculator/data/course_meta_data.dart';
import 'package:class_catch/features/cgpa_calculator/data/courses_data.dart';
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
  List<String> cdcnames = coursesData
      .map((map) => map['courseTitle'].toString())
      .toList();
  List<String> grades = ['A', 'A-', 'B', 'B-', 'C', 'C-', 'D', 'E'];
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  bool doneClick = false;
  double cgpa = 7.58;
  double sgpa = 8.51;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    void doneClicked() {
      setState(() {
        doneClick = !doneClick;
      });
    }

    List<Widget> getGradeButtons() {
      List<Widget> widgets = [];
      for (int i = 0; i < grades.length; i++) {
        widgets.add(
          Padding(
            padding: EdgeInsets.only(right: 0.007 * screenHeight),
            child: SizedBox(
              height: 0.029 * screenHeight,
              width: 0.1 * screenWidth,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    for (int j = 0; j < grades.length; j++) {
                      isSelected[j] = false;
                    }
                    isSelected[i] = true;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all((isSelected[i])
                      ? const Color(0XFF005B61)
                      : const Color(0XFF393434)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: (i == 0)
                          ? (const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)))
                          : ((i == grades.length - 1)
                              ? (const BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5)))
                              : (const BorderRadius.only())))),
                  alignment: Alignment.center,
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                ),
                child: Text(grades[i],
                    maxLines: 1,
                    style:
                        GoogleFonts.lexend(fontSize: 16, color: Colors.white)),
              ),
            ),
          ),
        );
      }
      return widgets;
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.462,
              /*child: SvgPicture.asset(
                'assets/cgpa_calculator/bg.svg',
                fit: BoxFit.cover,
              ),*/
              child: Image.asset(
                'assets/cgpa_calculator/bg.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                SizedBox(height: screenHeight * 0.113),
                Expanded(
                  child: SizedBox(
                    width: screenWidth,
                    child: SvgPicture.asset(
                        'assets/cgpa_calculator/black_bg.svg',
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 0.03 * screenHeight, left: 0.046 * screenWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/cgpa_calculator/menu.svg'),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'CGPA Calculator',
                        style: GoogleFonts.lexend(fontSize: 24),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 0.02 * screenHeight,
                      left: 0.035 * screenWidth,
                      right: 0.035 * screenWidth),
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircularPercentIndicator(
                        animation: true,
                        animationDuration: 750,
                        radius: 0.095 * screenHeight,
                        lineWidth: 10,
                        percent: (cgpa / 10),
                        progressColor: const Color.fromARGB(255, 0, 190, 87),
                        backgroundColor:
                            const Color.fromARGB(255, 217, 217, 217),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CGPA',
                              style: GoogleFonts.lexend(
                                  fontSize: 16,
                                  color:
                                      const Color.fromARGB(255, 132, 122, 122)),
                            ),
                            Text(
                              cgpa.toString(),
                              style: GoogleFonts.lexend(
                                  fontSize: 36, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: screenWidth * 0.02,
                            )
                          ],
                        ),
                      ),
                      CircularPercentIndicator(
                        animation: true,
                        animationDuration: 750,
                        radius: 0.095 * screenHeight,
                        lineWidth: 10,
                        percent: (sgpa / 10),
                        progressColor: const Color.fromARGB(255, 0, 190, 87),
                        backgroundColor:
                            const Color.fromARGB(255, 217, 217, 217),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SGPA',
                              style: GoogleFonts.lexend(
                                  fontSize: 16,
                                  color:
                                      const Color.fromARGB(255, 132, 122, 122)),
                            ),
                            Text(
                              sgpa.toString(),
                              style: GoogleFonts.lexend(
                                  fontSize: 36, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: screenWidth * 0.02,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.075,
                            vertical: screenHeight * 0.007),
                        child: Text(
                          "Add Course:",
                          style: GoogleFonts.lexend(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.075,
                                vertical: screenHeight * 0.005),
                            child: Text(
                              "SEMESTER",
                              style: GoogleFonts.lexend(
                                  fontSize: 11, color: const Color(0xFF4E4E4E)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05),
                            child: DropdownWoSearch(
                              list: semesterList,
                              text: 'Choose Semester',
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.075,
                                vertical: screenHeight * 0.005),
                            child: Text(
                              "COURSE NAME",
                              style: GoogleFonts.lexend(
                                  fontSize: 11, color: const Color(0xFF4E4E4E)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05),
                            child: DropdownWoSearch(
                              list: cdcnames,
                              text: 'Choose Course',
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.075,
                                vertical: screenHeight * 0.005),
                            child: Text(
                              "GRADE",
                              style: GoogleFonts.lexend(
                                  fontSize: 11, color: const Color(0xFF4E4E4E)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05),
                            child: Container(
                                height: screenHeight * 0.045,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 35, 35, 35),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        width: 2,
                                        color: const Color.fromARGB(
                                            255, 53, 53, 53))),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 0.007 * screenHeight),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: getGradeButtons(),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.075,
                                vertical: screenHeight * 0.005),
                            child: Text(
                              "PREDICTED GPA",
                              style: GoogleFonts.lexend(
                                  fontSize: 11, color: const Color(0xFF4E4E4E)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05),
                            child: Container(
                              height: screenHeight * 0.15,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 35, 35, 35),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(
                                          255, 53, 53, 53))),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: SizedBox(
                          height: 0.045 * screenHeight,
                          width: screenWidth * 0.9,
                          child: ElevatedButton(
                            onPressed: doneClicked,
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  (doneClick)
                                      ? const Color(0XFF005B61)
                                      : Colors.white),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      color: Color(0XFF005B61), width: 2),
                                ),
                              ),
                            ),
                            child: Text(
                              (doneClick) ? 'Updated' : 'Done',
                              style: GoogleFonts.lexend(
                                  fontSize: 12,
                                  color: (doneClick)
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
