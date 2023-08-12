import 'package:flutter/material.dart';
import 'package:medicine_app/enums%20and%20extensions/medicine_type_enum.dart';
import 'package:medicine_app/models/disease.dart';
import 'package:medicine_app/screens/disease_detail_screen.dart';

class DiseaseCard extends StatelessWidget {
  final Disease disease;
  const DiseaseCard({
    Key? key,
    required this.disease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DiseaseDetailScreen(disease: disease),
          ));
        },
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // elevation: 2,
          child: Stack(children: [
            FadeInImage(
              placeholder: const AssetImage('assets/images/bgimg.jpg'),
              // placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                disease.imageUrl,
              ),
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (final type in disease.medicineTypesAvailable)
                        MedicineTrait(medicineType: type.toStr())
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        disease.title,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Recovery Days: ${disease.recoveryDays}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class MedicineTrait extends StatelessWidget {
  final String medicineType;
  const MedicineTrait({
    Key? key,
    required this.medicineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          medicineType,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 5),
        const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 20,
        )
      ],
    );
  }
}
