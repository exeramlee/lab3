/// Стан гарантії покупки.
enum WarrantyStatus { active, expiring, expired }

/// Покупка користувача. На цьому етапі дані беруться з [MockData].
class Purchase {
  final String id;
  final String name;
  final String store;
  final String purchaseDate;
  final String price;
  final int warrantyMonths;
  final String warrantyUntil;
  final String remaining;
  final WarrantyStatus status;
  final String notes;

  const Purchase({
    required this.id,
    required this.name,
    required this.store,
    required this.purchaseDate,
    required this.price,
    required this.warrantyMonths,
    required this.warrantyUntil,
    required this.remaining,
    required this.status,
    this.notes = '',
  });
}
