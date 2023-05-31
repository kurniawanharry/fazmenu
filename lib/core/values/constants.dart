import 'package:fazmenu/features/addition/data/models/addition.dart';
import 'package:fazmenu/features/category/data/models/category.dart';
import 'package:fazmenu/features/product/data/models/product.dart';
import 'package:uuid/uuid.dart';

class Constants {
  static const int maxWidth = 600;
  static const double drawerWidth = 250;
  static const String phoneNumberAllowance =
      r"(\+62 ((\d{3}([ -]\d{3,})([- ]\d{4,})?)|(\d+)))|\d{3}( \d+)+|(\d+[ -]\d+)|\d+";

  static const List<String> times = ['Menit', 'Jam', 'Hari'];

  static const List<String> productCategory = [
    'Semua kategori',
    'Food',
  ];

  static const List<String> orderHistory = [
    'Semua pesanan',
    'Pesanan Berlangsung',
    'Pesanan selesai',
    'Pesanan dibatalkan'
  ];

  static const List<String> promoList = [
    'Diskon Rupiah',
    'Diskon %',
    'Gratis Produk',
  ];

  static const List<String> bannerDummy = [
    'https://wallpapercave.com/wp/wp8399530.jpg',
    'https://i.ytimg.com/vi/d3gU0TCXyHs/maxresdefault.jpg',
  ];

  static const List<String> additionDummy = [
    'Affogato Option',
    'Milkshake Option',
    'Kuah/Goreng',
    'Single/Double',
    'Rasa',
    'Ice/Hot',
  ];

  List<Product> productDummy = [
    Product(
      id: const Uuid().v4(),
      productName: 'Tanderloin Steak',
      description: 'Juicy Steak',
      image: 'https://asset-a.grid.id//crop/0x0:0x0/700x465/photo/2019/11/28/2766948574.jpg',
      price: 100000,
      isReady: false,
      isStock: false,
    ),
    Product(
      id: const Uuid().v4(),
      productName: 'Grilled Fish',
      description: 'Juicy Fish',
      image:
          'https://www.lanascooking.com/wp-content/uploads/2021/07/simple-seasoned-grilled-fish-feature-1200.jpg',
      price: 50000,
      isReady: false,
      isStock: false,
    ),
    Product(
      id: const Uuid().v4(),
      productName: 'Ramen Udon',
      description: 'Juicy Ramen',
      image:
          'https://asset.kompas.com/crops/_Kb9S7P9DSiujYQKPeXGL6iCFzs=/0x0:1000x667/750x500/data/photo/2021/10/29/617b934a3da5a.jpg',
      price: 80000,
      isReady: false,
      isStock: false,
    ),
  ];

  List<Addition> additionListDummy = [
    Addition(
      id: const Uuid().v4(),
      additionName: 'Steak Option',
      optional: [
        AdditionOptional(name: 'Rare', price: 0),
        AdditionOptional(name: 'Medium Rare', price: 0),
        AdditionOptional(name: 'Well Done', price: 0),
      ],
    ),
    Addition(
      id: const Uuid().v4(),
      additionName: 'Spiciness Level',
      optional: [
        AdditionOptional(name: 'Level 1', price: 0),
        AdditionOptional(name: 'Level 2', price: 0),
        AdditionOptional(name: 'Level 3', price: 0),
        AdditionOptional(name: 'Level 4', price: 500),
        AdditionOptional(name: 'Level 5', price: 1000),
      ],
    ),
    Addition(
      id: const Uuid().v4(),
      additionName: 'Ice/Hot',
      optional: [
        AdditionOptional(name: 'Ice', price: 0),
        AdditionOptional(name: 'Hot', price: 0),
      ],
    ),
  ];

  List<Category> categoryDummy = [
    Category(
      id: const Uuid().v4(),
      type: 100,
      categoryName: 'Food',
    ),
    Category(
      id: const Uuid().v4(),
      type: 200,
      categoryName: 'Drink',
    ),
  ];
}
