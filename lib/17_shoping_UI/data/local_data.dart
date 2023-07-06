import '../constants/app_assets.dart';
import '../models/product.dart';
import '../models/tab_item.dart';

List<TabItemModel> itemList = [
  TabItemModel(0xE574, 'Category'), // Unicode code point for 'category'
  TabItemModel(
      0xE195, 'Flight'), // Unicode code point for 'airplanemode_active'
  TabItemModel(0xE53F, 'Bill'), // Unicode code point for 'receipt'
  TabItemModel(0xE894, 'Data plan'), // Unicode code point for 'language'
  TabItemModel(0xE263, 'Top up'), // Unicode code point for 'monetization_on'
];

// List<TabItemModel> itemList = [
//   TabItemModel(const Icon(Icons.category), 'Category'),
//   TabItemModel(const Icon(Icons.airplanemode_active), 'Flight'),
//   TabItemModel(const Icon(Icons.receipt), 'Bill'),
//   TabItemModel(const Icon(Icons.language), 'Data plan'),
//   TabItemModel(const Icon(Icons.monetization_on), 'Top up'),
// ];

List<ProductModel> productList = [
  ProductModel(
      name: 'KENZO Sailor Varsity Bomber Jacket Midnight Blue Regular Price',
      price: '22.00',
      productCategory: 'Jacket',
      rating: '5',
      images: [
        AppAssets.navyBlueJacket,
        AppAssets.navyBlueJacketTwo,
        AppAssets.navyBlueJacketThree,
        AppAssets.navyBlueJacketFour,
      ]),
  ProductModel(
      name: 'OFF-WHITE Varsity Hammer Leather Over Bomber Jacket Black/Blue',
      price: '18.00',
      productCategory: 'Jacket',
      rating: '5',
      images: [
        AppAssets.offWhiteJacket,
        AppAssets.offWhiteJacketTwo,
        AppAssets.offWhiteJacketThree,
        AppAssets.offWhiteJacketFour,
      ]),
  ProductModel(
      name: 'DSQUARED2 Logo Print Padded Jacket Black Regular Price',
      price: '60.00',
      productCategory: 'Jacket',
      rating: '3',
      images: [
        AppAssets.dsquaredJacket,
        AppAssets.dsquaredJacketTwo,
        AppAssets.dsquaredJacketThree,
        AppAssets.dsquaredJacketFour,
      ]),
  ProductModel(
      name: 'PALM ANGELS Upsidedown Palm Sukajan Brown',
      price: '25.00',
      productCategory: 'Jacket',
      rating: '5',
      images: [
        AppAssets.palmAngelJacket,
        AppAssets.palmAngelJacketTwo,
        AppAssets.palmAngelJacketThree,
        AppAssets.palmAngelJacketFour,
      ]),
  ProductModel(
      name: 'PALM ANGELS Pink Sunset Track Vest Purple/Black',
      price: '30.00',
      productCategory: 'Jacket',
      rating: '5',
      images: [
        AppAssets.palmAngelPinkJacket,
        AppAssets.palmAngelPinkJacketTwo,
        AppAssets.palmAngelPinkJacketThree,
        AppAssets.palmAngelPinkJacketFour,
      ]),
  ProductModel(
      name: 'STONE ISLAND SHADOW PROJECT Organza Ripstop Bomber Jacket Black',
      price: '30.00',
      productCategory: 'Jacket',
      rating: '5',
      images: [
        AppAssets.stoneSilverJacket,
        AppAssets.stoneSilverJacketTwo,
        AppAssets.stoneSilverJacketThree,
        AppAssets.stoneSilverJacketFour,
      ]),
];

final List allAsset = [
  AppAssets.stoneSilverJacket,
  AppAssets.stoneSilverJacketTwo,
  AppAssets.stoneSilverJacketThree,
  AppAssets.stoneSilverJacketFour,
  AppAssets.palmAngelPinkJacket,
  AppAssets.palmAngelPinkJacketTwo,
  AppAssets.palmAngelPinkJacketThree,
  AppAssets.palmAngelPinkJacketFour,
  AppAssets.palmAngelJacket,
  AppAssets.palmAngelJacketTwo,
  AppAssets.palmAngelJacketThree,
  AppAssets.palmAngelJacketFour,
  AppAssets.dsquaredJacket,
  AppAssets.dsquaredJacketTwo,
  AppAssets.dsquaredJacketThree,
  AppAssets.dsquaredJacketFour,
  AppAssets.navyBlueJacket,
  AppAssets.navyBlueJacketTwo,
  AppAssets.navyBlueJacketThree,
  AppAssets.navyBlueJacketFour,
  AppAssets.offWhiteJacket,
  AppAssets.offWhiteJacketTwo,
  AppAssets.offWhiteJacketThree,
  AppAssets.offWhiteJacketFour,
  AppAssets.advertOne,
  AppAssets.advertTwo
];
  ///tabbar
      