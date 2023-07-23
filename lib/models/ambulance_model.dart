class Ambulance {
  final String hospitalName;
  final String telephoneNumber;
  final String district;
  final double rating;
  final String image;
  final String details;

  const Ambulance({
    required this.hospitalName,
    required this.telephoneNumber,
    required this.district,
    required this.rating,
    required this.image,
    required this.details,
  });
}

List<Ambulance> ambulanceList = [
  const Ambulance(
    hospitalName: 'Kampala International Hospital',
    telephoneNumber: '+25670567894',
    district: 'Kampala',
    rating: 4.5,
    image: 'images/ambulance1.png',
    details:
        'These will be the details of this particular ambulance and they will enable a user to know just a little bit more about the ambulance and the hospital it is attached to.',
  ),
  const Ambulance(
    hospitalName: 'Norvik Hospital',
    telephoneNumber: '+25674567894',
    district: 'Mukono',
    rating: 4.0,
    image: 'images/ambulance2.png',
    details:
        'These will be the details of this particular ambulance and they will enable a user to know just a little bit more about the ambulance and the hospital it is attached to.',
  ),
  const Ambulance(
    hospitalName: 'Jehova Rapha Hospital',
    telephoneNumber: '+25670367894',
    district: 'Mukono',
    rating: 5.0,
    image: 'images/ambulance1.png',
    details:
        'These will be the details of this particular ambulance and they will enable a user to know just a little bit more about the ambulance and the hospital it is attached to.',
  ),
  const Ambulance(
    hospitalName: 'Mengo Hospital',
    telephoneNumber: '+25670527894',
    district: 'Kampala',
    rating: 4.0,
    image: 'images/ambulance3.png',
    details:
        'These will be the details of this particular ambulance and they will enable a user to know just a little bit more about the ambulance and the hospital it is attached to.',
  ),
  const Ambulance(
    hospitalName: 'Mulago Hospital',
    telephoneNumber: '+25670561894',
    district: 'Kampala',
    rating: 4.0,
    image: 'images/ambulance2.png',
    details:
        'These will be the details of this particular ambulance and they will enable a user to know just a little bit more about the ambulance and the hospital it is attached to.',
  ),
  const Ambulance(
    hospitalName: 'Naggalama Hospital',
    telephoneNumber: '+25670567094',
    district: 'Mukono',
    rating: 4.5,
    image: 'images/ambulance3.png',
    details:
        'These will be the details of this particular ambulance and they will enable a user to know just a little bit more about the ambulance and the hospital it is attached to.',
  ),
];
