import '../models/purchase.dart';

/// Hardcoded-дані замість реального бекенду (Firebase буде підключено пізніше).
abstract final class MockData {
  static const String userFirstName = 'Дмитро';
  static const String userLastName = 'Антончик';
  static const String userEmail = 'dmytro@example.com';

  static String get userFullName => '$userFirstName $userLastName';

  static String get userInitials => '${userFirstName[0]}${userLastName[0]}';

  static const List<Purchase> purchases = [
    Purchase(
      id: '1',
      name: 'Смартфон Samsung Galaxy S24',
      store: 'Comfy',
      purchaseDate: '14.03.2026',
      price: '28 999 ₴',
      warrantyMonths: 24,
      warrantyUntil: '14.03.2028',
      remaining: '17 міс.',
      status: WarrantyStatus.active,
      notes: 'Талон у коробці',
    ),
    Purchase(
      id: '2',
      name: 'Телевізор LG OLED C4',
      store: 'Eldorado',
      purchaseDate: '05.01.2026',
      price: '41 299 ₴',
      warrantyMonths: 36,
      warrantyUntil: '05.01.2029',
      remaining: '27 міс.',
      status: WarrantyStatus.active,
    ),
    Purchase(
      id: '3',
      name: 'Ноутбук Lenovo IdeaPad 5',
      store: 'Rozetka',
      purchaseDate: '02.11.2025',
      price: '32 499 ₴',
      warrantyMonths: 12,
      warrantyUntil: '02.11.2026',
      remaining: '32 дн.',
      status: WarrantyStatus.expiring,
    ),
    Purchase(
      id: '4',
      name: 'Навушники Sony WH-1000XM5',
      store: 'Allo',
      purchaseDate: '15.06.2025',
      price: '10 999 ₴',
      warrantyMonths: 12,
      warrantyUntil: '15.06.2026',
      remaining: '—',
      status: WarrantyStatus.expired,
    ),
    Purchase(
      id: '5',
      name: 'Пральна машина Bosch Serie 4',
      store: 'Фокстрот',
      purchaseDate: '20.10.2024',
      price: '19 799 ₴',
      warrantyMonths: 24,
      warrantyUntil: '20.10.2026',
      remaining: '19 дн.',
      status: WarrantyStatus.expiring,
    ),
  ];

  /// Гарантії, відсортовані за датою завершення (як на екрані «Гарантії»).
  static List<Purchase> get warranties => [
        purchases[4],
        purchases[2],
        purchases[0],
        purchases[1],
        purchases[3],
      ];

  static List<Purchase> get expiringSoon => [purchases[4], purchases[2]];
}
