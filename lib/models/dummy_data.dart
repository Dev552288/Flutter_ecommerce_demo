import '../models/product.dart';

class DummyData {
  static const List<Product> products = [
    Product(
      id: 1,
      name: 'Wireless Headphones',
      category: 'Electronics',
      price: 2499,
      oldPrice: 3499,
      rating: 4.6,
      image: 'https://picsum.photos/500/500?random=1',
      description:
          'Premium wireless headphones with excellent sound quality, '
          'comfortable ear cushions and long battery life.',
    ),

    Product(
      id: 2,
      name: 'Running Shoes',
      category: 'Shoes',
      price: 3999,
      oldPrice: 4999,
      rating: 4.7,
      image: 'https://picsum.photos/500/500?random=2',
      description:
          'Lightweight running shoes designed for everyday running '
          'and comfortable walking.',
    ),

    Product(
      id: 3,
      name: 'Smart Watch',
      category: 'Electronics',
      price: 2999,
      oldPrice: 4499,
      rating: 4.4,
      image: 'https://picsum.photos/500/500?random=3',
      description:
          'Smart watch with fitness tracking, heart monitoring, '
          'notifications and multiple sports modes.',
    ),

    Product(
      id: 4,
      name: 'Casual T-Shirt',
      category: 'Fashion',
      price: 799,
      oldPrice: 1199,
      rating: 4.3,
      image: 'https://picsum.photos/500/500?random=4',
      description:
          'Comfortable cotton casual T-shirt suitable for everyday wear.',
    ),

    Product(
      id: 5,
      name: 'Laptop Backpack',
      category: 'Accessories',
      price: 1499,
      oldPrice: 1999,
      rating: 4.5,
      image: 'https://picsum.photos/500/500?random=5',
      description:
          'Water-resistant laptop backpack with multiple compartments.',
    ),

    Product(
      id: 6,
      name: 'Bluetooth Speaker',
      category: 'Electronics',
      price: 1799,
      oldPrice: 2499,
      rating: 4.5,
      image: 'https://picsum.photos/500/500?random=6',
      description:
          'Portable Bluetooth speaker with powerful sound and '
          'long-lasting battery.',
    ),
  ];
}
