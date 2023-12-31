class Post {
  int id;
  String image;
  String comment;
  String like;
  String date;
  String descrip;
  String image0;
  String image1;
  Post(
    this.id,
    this.image,
    this.like,
    this.comment,
    this.date,
    this.descrip,
    this.image0,
    this.image1,
  );
}
List<Post> posts = [
  Post(
      1,
      'asset/a1.jpg',
      '4',
      '10',
      '01/01/1991',
      'la protecton dela nature est crucial pour tous',
      'asset/00.jpg',
      'asset/11.jpg'),
  Post(
      2,
      'asset/b.jpg',
      '7',
      '10',
      '03/04/1993',
      'avec la revolution de la technologie par le lien de alibaba obtentez un drone a moin de 100.000fc',
      'asset/00.jpg',
      'asset/11.jpg'),
  Post(
      3,
      'asset/a.jpg',
      '8',
      '10',
      '05/04/1994',
      'le cinema , parmi les divertissement les plus rentable au monde',
      'asset/00.jpg',
      'asset/11.jpg'),
  Post(
      4,
      'asset/z.png',
      '9',
      '10',
      '09/05/1995',
      'la realite virtuel un jeux pour toutes les entreprises Itech',
      'asset/00.jpg',
      'asset/11.jpg'),
  Post(
      5,
      'asset/z1.jpg',
      '9',
      '10',
      '09/09/1996',
      'Quel beau paysage dans un petit village a norvege',
      'asset/00.jpg',
      'asset/11.jpg'),
  Post(
      6,
      'asset/aa.jpg',
      '9',
      '10',
      '10/09/1997',
      'Opppculus meata 3 deja disponible a 13000 dollars ameriacain',
      'asset/00.jpg',
      'asset/11.jpg'),
  Post(
      7,
      'asset/c1.jpg',
      '9',
      '10',
      '11/10/1998',
      'etre developpeur requiert une bonne machine Mdr',
      'asset/00.jpg',
      'asset/11.jpg'),
  Post(
      8,
      'asset/cc.jpg',
      '9',
      '10',
      '13/10/1999',
      'The Glass intelligent ; selon google de lunette intelligente',
      'asset/00.jpg',
      'asset/11.jpg'),
];
