extension ImageExtension on String{
  get png=> 'assets/images/$this.png';
  get jpg=> 'assets/images/$this.jpg';
  get jpeg=> 'assets/images/$this.jpeg';
  get svg=> 'assets/images/$this.svg';
}