class Languages {
  Languages({
    required this.title,
    required this.image,
  });

  String title;
  String image;
}

List<Languages> languages = [
  Languages(
    title: 'العربية',
    image: 'assets/images/egypt.svg',
  ),
  Languages(
    title: 'English',
    image: 'assets/images/usa.svg',
  ),
];
