import 'package:flutter/material.dart';

class Specialities extends StatelessWidget {
  //getting name of speciality and corresponding icon
  final String specialityName;
  final String speclogoImagePath;

  //constructor fo the variables abve
  Specialities({
    required this.specialityName,
    required this.speclogoImagePath,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(12),
          color: Colors.white.withOpacity(0.2),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset(speclogoImagePath,
                ),
              ),
              SizedBox(height: 5),
              Text(specialityName,

              )
            ],
          ),





        ),
      ),
    );

  }

}