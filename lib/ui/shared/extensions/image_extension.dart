extension ImageExtension on String{
  get png=> 'assets/images/$this.png';
  get svg=> 'assets/images/$this.svg';
}