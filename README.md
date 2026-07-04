# Mini Katalog Uygulaması

Bu proje, Flutter eğitimi için hazırlanmış örnek bir Mini Katalog uygulamasıdır.

## Kısa Açıklama
- Flutter ile geliştirilmiş, GridView ile ürün listeleme, ürün detay sayfası ve basit sepet simülasyonu içeren eğitim projesi.

## Gereksinimler
- Flutter SDK (3.0 veya üstü)
- Dart SDK
- Android Studio (emülatör için önerilir)

## Çalıştırma Adımları
1. Terminalde proje klasörüne gidin:
```bash
cd d:/VSProjects/mini_katalog_app
```

2. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

3. Uygulamayı çalıştırın (emülatör veya bağlı cihaz):
```bash
flutter run
```

## Proje Yapısı (Öne Çıkanlar)
- `lib/main.dart` : Uygulama giriş noktası ve temel state yönetimi
- `lib/models/product.dart` : Ürün model sınıfı
- `lib/screens/home.dart` : Ürün liste ekranı (GridView)
- `lib/screens/product_detail.dart` : Ürün detay ekranı (Hero animasyonu ile)
- `lib/screens/cart.dart` : Basit sepet ekranı
- `assets/data/products.json` : Örnek ürün verisi
- `assets/images/` : Ürün görselleri

## Ekran Görüntüleri

### Ana Sayfa (Keşfet)
Ürünlerin GridView formatında listelendiği ana sayfa. Banner görseli, arama işlevi ve tüm ürünler görülüyor.

### Ürün Detayı
Seçilen ürünün detaylı bilgileri (başlık, açıklama, özellikler, fiyat) ve "Sepete Ekle" düğmesi.

### Sepetim
Sepete eklenen ürünlerin listesi, her ürün için silme seçeneği ve toplam fiyat hesaplaması.

## Özellikler
- ✅ GridView ile responsive ürün listeleme
- ✅ Hero animasyonu ile ürün detay geçişi
- ✅ Arama ve filtreleme fonksiyonu
- ✅ Sepete ekleme/çıkarma işlemleri
- ✅ Yerel asset yönetimi
- ✅ Türkçe arayüz

## Notlar
- Görseller yerel `assets/images/` klasöründen yüklenir
- `products.json` veri dosyasından ürün bilgileri okunur
- State yönetimi StatefulWidget ile gerçekleştirilmiştir
- Eğitim amaçlı minimal bir projedir