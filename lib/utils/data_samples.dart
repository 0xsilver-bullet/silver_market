import 'package:silver_market/core/model/models.dart';

abstract class DataSamples {
  static const List<Story> stories = [
    Story(
      id: 0,
      name: 'Hot bed',
      imageUrl:
          'https://furniture-ideal.com/wp-content/uploads/2021/03/banner-bedroom-2.png',
    ),
    Story(
      id: 1,
      name: 'Good view',
      imageUrl:
          'https://zeitraumcdn-1db3c.kxcdn.com/wp-content/uploads/2022/12/zeitraummoebel-header-novelties-milandesignweek-3-1240x676.png',
    ),
    Story(
      id: 2,
      name: 'Good Chairs',
      imageUrl:
          'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg?cs=srgb&dl=pexels-eric-mufasa-1350789.jpg&fm=jpg',
    ),
    Story(
      id: 3,
      name: 'Dinning',
      imageUrl:
          'https://d13r0hznkpv24o.cloudfront.net/media/wysiwyg/Dining.jpg',
    ),
    Story(
      id: 4,
      name: 'Grey',
      imageUrl: 'https://i.ytimg.com/vi/QUV-PNwaQ0o/maxresdefault.jpg',
    ),
  ];

  static const List<HomePart> homeParts = [
    HomePart(
      id: 0,
      name: 'bedroom',
      imageUrl:
          'https://d13r0hznkpv24o.cloudfront.net/media/catalog/product/cache/e9da42a1907d51557ab3b33bb058386d/l/e/lego-beauty-2.jpg',
    ),
    HomePart(
      id: 1,
      name: 'living room',
      imageUrl:
          'https://elmalekfurniture.com/wp-content/uploads/2022/07/WhatsApp-Image-2022-06-23-at-3.35.16-PM.jpeg',
    ),
    HomePart(
      id: 2,
      name: 'kitchen',
      imageUrl:
          'https://d2zpvmybpipqvy.cloudfront.net/media/filer_public/a7/a0/a7a07756-89e4-4a0b-961d-fd43d894e2f6/joy-uno.jpg',
    ),
    HomePart(
      id: 3,
      name: 'bathroom',
      imageUrl:
          'https://d2zpvmybpipqvy.cloudfront.net/media/filer_public/a7/a0/a7a07756-89e4-4a0b-961d-fd43d894e2f6/joy-uno.jpg',
    )
  ];
  static const List<Category> categories = [
    Category(
      id: 0,
      name: 'Furniture',
      imageUrl:
          'https://furniture-ideal.com/wp-content/uploads/2021/03/banner-bedroom-2.png',
    ),
    Category(
      id: 1,
      name: 'Lighting',
      imageUrl:
          'https://furniture-ideal.com/wp-content/uploads/2021/03/banner-bedroom-2.png',
    ),
    Category(
      id: 2,
      name: 'Rugs',
      imageUrl:
          'https://furniture-ideal.com/wp-content/uploads/2021/03/banner-bedroom-2.png',
    ),
    Category(
      id: 3,
      name: 'Mirrors',
      imageUrl:
          'https://furniture-ideal.com/wp-content/uploads/2021/03/banner-bedroom-2.png',
    ),
    Category(
      id: 4,
      name: 'Blankets',
      imageUrl:
          'https://furniture-ideal.com/wp-content/uploads/2021/03/banner-bedroom-2.png',
    ),
    Category(
      id: 5,
      name: 'Cushions',
      imageUrl:
          'https://furniture-ideal.com/wp-content/uploads/2021/03/banner-bedroom-2.png',
    ),
    Category(
      id: 6,
      name: 'Curtains',
      imageUrl:
          'https://furniture-ideal.com/wp-content/uploads/2021/03/banner-bedroom-2.png',
    ),
    Category(
      id: 7,
      name: 'Whatever',
      imageUrl:
          'https://furniture-ideal.com/wp-content/uploads/2021/03/banner-bedroom-2.png',
    ),
  ];
}
