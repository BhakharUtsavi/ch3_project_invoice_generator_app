import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../utils/global_variable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? select = "all";
  File? imageFile;
  final ImagePicker picker = ImagePicker();

  List<Map<String, dynamic>> knife = [
    {
      "id": 1,
      "name": "Chef's Knife",
      "description": "A high-quality chef's knife made from premium stainless steel, perfect for slicing, dicing, and chopping.",
      "price": 89,
      "discountpercentage": 10,
      "rating": 4.8,
      "stock": 120,
      "brand": "KnivesPro",
      "category": "Kitchenware",
      "thumbnail": "https://rushskitchen.com/wp-content/uploads/2014/04/VICTORINOX-ROSEWOOD-8-INCH-CHEFS-KNIFE.jpg",
      "image": [
        "https://example.com/chefs-knife.png",
        "https://example.com/chefs-knife-2.png",
        "https://example.com/chefs-knife-3.png",
        "https://example.com/chefs-knife-4.png",
      ],
    },
    {
      "id": 2,
      "name": "Santoku Knife",
      "description": "A versatile Santoku knife with a granton edge, ideal for slicing, dicing, and mincing. Features a comfortable handle and razor-sharp blade.",
      "price": 2599,
      "discountpercentage": 10,
      "rating": 4.8,
      "stock": 60,
      "brand": "Kyocera",
      "category": "Cutlery",
      "thumbnail": "https://www.purplespoilz.com.au/assets/full/DM0717.jpg?20200404203317",
      "image": [
        "https://example.com/santoku-knife.png",
        "https://example.com/santoku-knife-side.png",
        "https://example.com/santoku-knife-detail.png"
      ]
    },
    {
      "id": 3,
      "name": "Paring Knife",
      "description": "A compact paring knife with a sharp, precise blade for peeling, trimming, and intricate work. Ideal for small, detailed tasks.",
      "price": 1199,
      "discountpercentage": 5,
      "rating": 4.6,
      "stock": 75,
      "brand": "Victorinox",
      "category": "Cutlery",
      "thumbnail": "https://kitchenpro.com.ph/wp-content/uploads/2017/11/3.5-Paring-Knife-KP-PK-PO.jpg",
      "image": [
        "https://example.com/parsing-knife.png",
        "https://example.com/parsing-knife-side.png",
        "https://example.com/parsing-knife-detail.png"
      ]
    },
    {
      "id": 4,
      "name": "Bread Knife",
      "description": "A serrated bread knife designed for slicing through crusty loaves without crushing them. Features a long, sharp blade and comfortable grip.",
      "price": 1899,
      "discountpercentage": 12,
      "rating": 4.7,
      "stock": 55,
      "brand": "Zwilling",
      "category": "Cutlery",
      "thumbnail": "https://assets.bonappetit.com/photos/5a0f6a37fef293410c3b4f07/4:3/w_7200,h_5400,c_limit/Basically-gift-guide-2017-Mercer-Knife.jpg",
      "image": [
        "https://example.com/bread-knife.png",
        "https://example.com/bread-knife-side.png",
        "https://example.com/bread-knife-detail.png"
      ]
    },
    {
      "id": 5,
      "name": "Cleaver Knife",
      "description": "A heavy-duty cleaver knife designed for chopping through bones and dense meats. Features a strong, wide blade and robust handle.",
      "price": 3499,
      "discountpercentage": 8,
      "rating": 4.9,
      "stock": 40,
      "brand": "Dalstrong",
      "category": "Cutlery",
      "thumbnail": "https://kitchenpro.com.ph/wp-content/uploads/2017/11/7-Cleaver-Knife-KP-CV-PO.jpg",
      "image": [
        "https://example.com/cleaver-knife.png",
        "https://example.com/cleaver-knife-side.png",
        "https://example.com/cleaver-knife-detail.png"
      ]
    },
    {
      "id": 6,
      "name": "Utility Knife",
      "description": "A versatile utility knife for general-purpose tasks in the kitchen. Features a sharp, durable blade and ergonomic handle.",
      "price": 999,
      "discountpercentage": 15,
      "rating": 4.5,
      "stock": 100,
      "brand": "Cuisinart",
      "category": "Cutlery",
      "thumbnail": "https://i5.walmartimages.com/asr/6e7e40f3-6348-4128-a47e-f7fe1429b410_1.e7abbade48267f75e78854210ed2e517.jpeg?odnWidth=1000&odnHeight=1000&odnBg=ffffff",
      "image": [
        "https://example.com/utility-knife.png",
        "https://example.com/utility-knife-side.png",
        "https://example.com/utility-knife-detail.png"
      ]
    },
    {
      "id": 7,
      "name": "Boning Knife",
      "description": "A flexible boning knife designed for deboning and filleting fish and poultry. Features a thin, sharp blade for precise cuts.",
      "price": 1599,
      "discountpercentage": 10,
      "rating": 4,
      "stock": 80,
      "brand": "Shun",
      "category": "Cutlery",
      "thumbnail": "https://cdnimg.webstaurantstore.com/images/products/xxl/547819/2175982.jpg",
      "image": [
        "https://example.com/boning-knife.png",
        "https://example.com/boning-knife-side.png",
        "https://example.com/boning-knife-detail.png"
      ]
    },
    {
      "id": 8,
      "name": "Chef's Knife Set",
      "description": "A set of three essential chef's knives including a paring knife, a Santoku knife, and a utility knife. Each knife features a sharp blade and ergonomic handle.",
      "price": 4999,
      "discountpercentage": 15,
      "rating": 3.8,
      "stock": 55,
      "brand": "Wüsthof",
      "category": "Cutlery",
      "thumbnail": "https://cdn.shocho.co/sc-image/1/8/f/6/18f6aa8d1dd46c74fec68ac893f7f423.jpg",
      "image": [
        "https://example.com/chefs-knife-set.png",
        "https://example.com/chefs-knife-set-side.png",
        "https://example.com/chefs-knife-set-detail.png"
      ]
    },
    {
      "id": 9,
      "name": "Fillet Knife",
      "description": "A flexible fillet knife with a razor-sharp blade for removing bones and skin from fish. Features a comfortable handle and precise edge.",
      "price": 1299,
      "discountpercentage": 12,
      "rating": 1.7,
      "stock": 70,
      "brand": "Mercer Culinary",
      "category": "Cutlery",
      "thumbnail": "https://images-na.ssl-images-amazon.com/images/I/81CG8Q5XEQL._SL1500_.jpg",
      "image": [
        "https://example.com/fillet-knife.png",
        "https://example.com/fillet-knife-side.png",
        "https://example.com/fillet-knife-detail.png"
      ]
    },
    {
      "id": 10,
      "name": "Cleaver Set",
      "description": "A set of two heavy-duty cleavers designed for chopping, slicing, and mincing meat. Includes a large cleaver and a small cleaver for versatile use.",
      "price": 3999,
      "discountpercentage": 18,
      "rating": 3.9,
      "stock": 30,
      "brand": "Kramer",
      "category": "Cutlery",
      "thumbnail": "https://i5.walmartimages.com/asr/1f18cf88-baa7-4fab-9edf-0f3b142acb27_1.b02bb713edfdaa317ff76772da1d0098.jpeg?odnWidth=1000&odnHeight=1000&odnBg=ffffff",
      "image": [
        "https://example.com/cleaver-set.png",
        "https://example.com/cleaver-set-side.png",
        "https://example.com/cleaver-set-detail.png"
      ]
    },
    {
      "id": 11,
      "name": "Japanese Nakiri Knife",
      "description": "A Japanese Nakiri knife with a straight blade designed for slicing vegetables. Features a sharp edge and lightweight design for precise cuts.",
      "price": 2299,
      "discountpercentage": 8,
      "rating": 2.8,
      "stock": 65,
      "brand": "Yoshihiro",
      "category": "Cutlery",
      "thumbnail": "http://new.uniquejapan.com/wp-content/uploads/2010/05/unsui_set.jpg",
      "image": [
        "https://example.com/nakiri-knife.png",
        "https://example.com/nakiri-knife-side.png",
        "https://example.com/nakiri-knife-detail.png"
      ]
    }
  ];
  List<Map<String, dynamic>> bowls = [
    {
      "id": 1,
      "name": "Mixing Bowl Set",
      "description": "A set of three mixing bowls made from durable stainless steel, perfect for baking and cooking preparation.",
      "price": 39,
      "discountpercentage": 15,
      "rating": 5.6,
      "stock": 85,
      "brand": "KitchenEssentials",
      "category": "Kitchenware",
      "thumbnail": "https://images-na.ssl-images-amazon.com/images/I/71DNibsW94L.jpg",
      "image": [
        "https://example.com/mixing-bowl-set-1.png",
        "https://example.com/mixing-bowl-set-2.png",
        "https://example.com/mixing-bowl-set-3.png",
      ],
    },
    {
      "id": 2,
      "name": "Ceramic Bowl Set",
      "description": "A set of four hand-painted ceramic bowls, perfect for serving salads, soups, and desserts.",
      "price": 29,
      "discountpercentage": 10,
      "rating": 1.8,
      "stock": 60,
      "brand": "ArtisanCraft",
      "category": "Kitchenware",
      "thumbnail": "https://i5.walmartimages.com/asr/0b583190-26b5-4650-b68e-e8a647a7a233_1.94b351097965ace825fdb693de689e46.jpeg",
      "image": [
        "https://example.com/ceramic-bowl-set-1.png",
        "https://example.com/ceramic-bowl-set-2.png",
      ],
    },
    {
      "id": 3,
      "name": "Glass Bowl Set",
      "description": "A set of five tempered glass bowls with lids, ideal for food storage and meal prep.",
      "price": 24,
      "discountpercentage": 5,
      "rating": 3.7,
      "stock": 100,
      "brand": "ClearView",
      "category": "Kitchenware",
      "thumbnail": "http://www.homedepot.com/catalog/productImages/1000/06/0613087c-7b26-4b8d-ac79-f61f3e2268db_1000.jpg",
      "image": [
        "https://example.com/glass-bowl-set-1.png",
        "https://example.com/glass-bowl-set-2.png",
      ],
    },
    {
      "id": 4,
      "name": "Wooden Salad Bowl",
      "description": "A large wooden salad bowl made from sustainable bamboo, perfect for serving salads and fruits.",
      "price": 34,
      "discountpercentage": 12,
      "rating": 4.9,
      "stock": 50,
      "brand": "EcoKitchen",
      "category": "Kitchenware",
      "thumbnail": "http://www.thegreenhead.com/imgs/kontra-bamboo-salad-bowl-with-stainless-steel-base-2.jpg",
      "image": [
        "https://example.com/wooden-salad-bowl-1.png",
        "https://example.com/wooden-salad-bowl-2.png",
      ],
    },
    {
      "id": 5,
      "name": "Plastic Mixing Bowls",
      "description": "A set of six color-coded plastic mixing bowls, stackable and versatile for all your cooking needs.",
      "price": 19,
      "discountpercentage": 20,
      "rating": 5.5,
      "stock": 120,
      "brand": "CookEasy",
      "category": "Kitchenware",
      "thumbnail": "http://crm.idecloudapps.com/wp-content/uploads/2017/09/OXO-Good-Grips%C2%AE-3-Piece-Stainless-Steel-Mixing-Bowl-Set-1024x1024.jpg",
      "image": [
        "https://example.com/plastic-mixing-bowls-1.png",
        "https://example.com/plastic-mixing-bowls-2.png",
      ],
    },
    {
      "id": 6,
      "name": "Stoneware Soup Bowls",
      "description": "A set of four heavy-duty stoneware soup bowls with handles, perfect for serving hot soups and stews.",
      "price": 44,
      "discountpercentage": 8,
      "rating": 1.7,
      "stock": 70,
      "brand": "HomeComforts",
      "category": "Kitchenware",
      "thumbnail": "https://3.imimg.com/data3/EK/XY/MY-1147817/jsi-229.jpg",
      "image": [
        "https://example.com/stoneware-soup-bowls-1.png",
        "https://example.com/stoneware-soup-bowls-2.png",
      ],
    },
    {
      "id": 7,
      "name": "Porcelain Rice Bowls",
      "description": "A set of six elegant porcelain rice bowls with intricate patterns, ideal for serving rice and small dishes.",
      "price": 22,
      "discountpercentage": 10,
      "rating": 5.9,
      "stock": 95,
      "brand": "EleganceWare",
      "category": "Kitchenware",
      "thumbnail": "https://i5.walmartimages.com/asr/53dae087-eeef-4ebb-bd1c-c2314e9f5256_1.d02551755d8b77716c6e1f206411e3c3.jpeg",
      "image": [
        "https://example.com/porcelain-rice-bowls-1.png",
        "https://example.com/porcelain-rice-bowls-2.png",
      ],
    },
    {
      "id": 8,
      "name": "Copper Serving Bowl",
      "description": "A handcrafted copper serving bowl with a hammered finish, perfect for special occasions and gatherings.",
      "price": 54,
      "discountpercentage": 15,
      "rating": 4.8,
      "stock": 40,
      "brand": "CopperCraft",
      "category": "Kitchenware",
      "thumbnail": "https://i.pinimg.com/originals/c3/6e/96/c36e96ff2e1602c167c6286a9575986c.jpg",
      "image": [
        "https://example.com/copper-serving-bowl-1.png",
        "https://example.com/copper-serving-bowl-2.png",
      ],
    },
    {
      "id": 9,
      "name": "Melamine Snack Bowls",
      "description": "A set of six melamine snack bowls, durable and perfect for outdoor dining and picnics.",
      "price": 17,
      "discountpercentage": 18,
      "rating": 3.6,
      "stock": 130,
      "brand": "OutdoorEssentials",
      "category": "Kitchenware",
      "thumbnail": "http://www.thegreenhead.com/imgs/tilted-stainless-steel-snack-bowl-1.jpg",
      "image": [
        "https://example.com/melamine-snack-bowls-1.png",
        "https://example.com/melamine-snack-bowls-2.png",
      ],
    },
  ];
  List<Map<String, dynamic>> spoons = [
    {
      "id": 1,
      "name": "Spoon Set",
      "description": "A set of six stainless steel spoons, perfect for everyday dining.",
      "price": 14,
      "discountpercentage": 10,
      "rating": 1.7,
      "stock": 100,
      "brand": "KitchenEssentials",
      "category": "Cutlery",
      "thumbnail": "https://partysupplyfactory.com/wp-content/uploads/2017/05/Eagrye-Stainless-Steel-Dinner-Spoons-Table-Spoons-set-of-12.jpg",
      "image": [
        "https://example.com/stainless-steel-spoon-set-1.png",
        "https://example.com/stainless-steel-spoon-set-2.png",
      ],
    },
    {
      "id": 2,
      "name": "Wooden Spoons",
      "description": "A set of three handcrafted wooden spoons, ideal for cooking and serving.",
      "price": 19,
      "discountpercentage": 15,
      "rating": 4.8,
      "stock": 75,
      "brand": "EcoKitchen",
      "category": "Cutlery",
      "thumbnail": "https://txonstores.com/content/images/thumbs/0000860_stainless-steel-spoon-with-wooden-handle-6-pcs-15-cm_550.jpeg",
      "image": [
        "https://example.com/wooden-spoons-1.png",
        "https://example.com/wooden-spoons-2.png",
      ],
    },
    {
      "id": 3,
      "name": "Plastic Measuring Spoons",
      "description": "A set of five color-coded plastic measuring spoons, perfect for baking and cooking.",
      "price": 9,
      "discountpercentage": 20,
      "rating": 2.6,
      "stock": 150,
      "brand": "CookEasy",
      "category": "Kitchenware",
      "thumbnail": "http://ecx.images-amazon.com/images/I/81nn5IV4VXL._SL1500_.jpg",
      "image": [
        "https://example.com/plastic-measuring-spoons-1.png",
        "https://example.com/plastic-measuring-spoons-2.png",
      ],
    },
    {
      "id": 4,
      "name": "Silver Plated Spoons",
      "description": "A set of four elegant silver plated spoons, perfect for special occasions.",
      "price": 29,
      "discountpercentage": 12,
      "rating": 1.9,
      "stock": 60,
      "brand": "EleganceWare",
      "category": "Cutlery",
      "thumbnail": "https://pitochina.com/wp-content/uploads/2022/05/Silver-Plated-Spoons-Forks-and-Knives-Stainless-Steel-3.jpg",
      "image": [
        "https://example.com/silver-plated-spoons-1.png",
        "https://example.com/silver-plated-spoons-2.png",
      ],
    },
    {
      "id": 5,
      "name": "Bamboo Tea Spoons",
      "description": "A set of six bamboo tea spoons, eco-friendly and perfect for daily use.",
      "price": 12,
      "discountpercentage": 18,
      "rating": 4.5,
      "stock": 90,
      "brand": "GreenLiving",
      "category": "Cutlery",
      "thumbnail": "https://cdn.shopify.com/s/files/1/0020/1677/2147/products/CUTTERBROOKS_MIKEGARLICK_02AUG2021_15325_WOOD_2C_x1600.jpg?v=1667397740",
      "image": [
        "https://example.com/bamboo-tea-spoons-1.png",
        "https://example.com/bamboo-tea-spoons-2.png",
      ],
    },
    {
      "id": 6,
      "name": "Gold Dessert Spoons",
      "description": "A set of six gold plated dessert spoons, perfect for serving desserts and small dishes.",
      "price": 34,
      "discountpercentage": 10,
      "rating": 4.8,
      "stock": 50,
      "brand": "LuxuryDining",
      "category": "Cutlery",
      "thumbnail": "https://i.pinimg.com/originals/ce/52/19/ce5219b41824ae0d880a3b28425b3acb.jpg",
      "image": [
        "https://example.com/gold-plated-dessert-spoons-1.png",
        "https://example.com/gold-plated-dessert-spoons-2.png",
      ],
    },
    {
      "id": 7,
      "name": "Porcelain Soup Spoons",
      "description": "A set of four porcelain soup spoons, ideal for enjoying soups and broths.",
      "price": 24,
      "discountpercentage": 8,
      "rating": 3.7,
      "stock": 70,
      "brand": "ArtisanCraft",
      "category": "Cutlery",
      "thumbnail": "https://images-na.ssl-images-amazon.com/images/I/61nOu1v8JmL._AC_SL1500_.jpg",
      "image": [
        "https://example.com/porcelain-soup-spoons-1.png",
        "https://example.com/porcelain-soup-spoons-2.png",
      ],
    },
    {
      "id": 8,
      "name": "Copper Serving Spoon",
      "description": "A handcrafted copper serving spoon with a hammered finish, perfect for serving dishes.",
      "price": 29,
      "discountpercentage": 15,
      "rating": 1.9,
      "stock": 40,
      "brand": "CopperCraft",
      "category": "Cutlery",
      "thumbnail": "https://www.puritandoors.co.uk/pub/media/catalog/product/cache/69f25477c875dbb9a8f98d2ca7ccbaf4/c/o/copperspoon.jpg",
      "image": [
        "https://example.com/copper-serving-spoon-1.png",
        "https://example.com/copper-serving-spoon-2.png",
      ],
    },
    {
      "id": 9,
      "name": "Titanium Spork",
      "description": "A lightweight titanium spork, perfect for camping and outdoor activities.",
      "price": 19,
      "discountpercentage": 12,
      "rating": 3.8,
      "stock": 80,
      "brand": "OutdoorEssentials",
      "category": "Cutlery",
      "thumbnail": "https://www.bhphotovideo.com/images/images1000x1000/light_my_fire_s_sp_titanium_spork_titanium_1202639.jpg",
      "image": [
        "https://example.com/titanium-spork-1.png",
        "https://example.com/titanium-spork-2.png",
      ],
    },
  ];
  List<Map<String, dynamic>> plates = [
    {
      "id": 1,
      "name": "Dinner Plate",
      "description": "A set of four ceramic dinner plates, perfect for everyday dining.",
      "price": 39,
      "discountpercentage": 10,
      "rating": 2.8,
      "stock": 120,
      "brand": "HomeEssentials",
      "category": "Dinnerware",
      "thumbnail": "https://i1.pepperfry.com/media/catalog/product/s/t/800x880/Steelcraft-Stainless-Steel-Double-Wall-Dinner-Plates---6Pcs-DP-535__-1372328120wJ0vWY.jpg",
      "image": [
        "https://example.com/ceramic-dinner-plate-set-1.png",
        "https://example.com/ceramic-dinner-plate-set-2.png",
      ],
    },
    {
      "id": 2,
      "name": "Salad Plates",
      "description": "A set of six porcelain salad plates, ideal for serving salads and appetizers.",
      "price": 29,
      "discountpercentage": 15,
      "rating": 1.7,
      "stock": 95,
      "brand": "ElegantDining",
      "category": "Dinnerware",
      "thumbnail": "https://images-na.ssl-images-amazon.com/images/I/71wSK9gsjdL._AC_SL1500_.jpg",
      "image": [
        "https://example.com/porcelain-salad-plates-1.png",
        "https://example.com/porcelain-salad-plates-2.png",
      ],
    },
    {
      "id": 3,
      "name": "Melamine Plates",
      "description": "A set of eight melamine plates, durable and perfect for outdoor picnics.",
      "price": 24,
      "discountpercentage": 20,
      "rating": 4.6,
      "stock": 150,
      "brand": "OutdoorDining",
      "category": "Dinnerware",
      "thumbnail": "https://cdn.shopify.com/s/files/1/2397/8493/products/IMG_1628_1024x1024.jpg?v=1540848375",
      "image": [
        "https://example.com/melamine-picnic-plates-1.png",
        "https://example.com/melamine-picnic-plates-2.png",
      ],
    },
    {
      "id": 4,
      "name": "Glass Dessert Plates",
      "description": "A set of four glass dessert plates, perfect for serving cakes and pastries.",
      "price": 34,
      "discountpercentage": 12,
      "rating": 3.9,
      "stock": 80,
      "brand": "GourmetKitchen",
      "category": "Dinnerware",
      "thumbnail": "https://n2.sdlcdn.com/imgs/d/4/k/Shubham-6-Pcs-Stainless-Steel-SDL811424308-1-97c38.jpg",
      "image": [
        "https://example.com/glass-dessert-plates-1.png",
        "https://example.com/glass-dessert-plates-2.png",
      ],
    },
    {
      "id": 5,
      "name": "Bamboo Charger Plates",
      "description": "A set of six eco-friendly bamboo charger plates, perfect for special occasions.",
      "price": 49,
      "discountpercentage": 18,
      "rating": 4.7,
      "stock": 70,
      "brand": "EcoDining",
      "category": "Dinnerware",
      "thumbnail": "https://www.drinkstuff.com/productimg/130353_large.jpg",
      "image": [
        "https://example.com/bamboo-charger-plates-1.png",
        "https://example.com/bamboo-charger-plates-2.png",
      ],
    },
    {
      "id": 6,
      "name": "Stoneware Dinner Plates",
      "description": "A set of four handcrafted stoneware dinner plates, durable and stylish.",
      "price": 44,
      "discountpercentage": 10,
      "rating": 2.8,
      "stock": 60,
      "brand": "CraftedKitchen",
      "category": "Dinnerware",
      "thumbnail": "https://images-na.ssl-images-amazon.com/images/I/91O7bHzQY0L._AC_SL1500_.jpg",
      "image": [
        "https://example.com/stoneware-dinner-plates-1.png",
        "https://example.com/stoneware-dinner-plates-2.png",
      ],
    },
    {
      "id": 7,
      "name": "Gold Rimmed Plates",
      "description": "A set of four gold rimmed plates, elegant and perfect for fine dining.",
      "price": 59,
      "discountpercentage": 8,
      "rating": 1.9,
      "stock": 50,
      "brand": "LuxuryTableware",
      "category": "Dinnerware",
      "thumbnail": "https://i.pinimg.com/originals/dd/49/9d/dd499d2fec5a83621adc35826ff6b59d.jpg",
      "image": [
        "https://example.com/gold-rimmed-plates-1.png",
        "https://example.com/gold-rimmed-plates-2.png",
      ],
    },
    {
      "id": 8,
      "name": "Plastic Divided Plates",
      "description": "A set of four plastic divided plates, perfect for kids and portion control.",
      "price": 19,
      "discountpercentage": 15,
      "rating": 3.7,
      "stock": 90,
      "brand": "FamilyDining",
      "category": "Dinnerware",
      "thumbnail": "https://images-na.ssl-images-amazon.com/images/I/511fvihEhnL._SL1002_.jpg",
      "image": [
        "https://example.com/plastic-divided-plates-1.png",
        "https://example.com/plastic-divided-plates-2.png",
      ],
    },
    {
      "id": 9,
      "name": "Dinner Plates",
      "description": "A set of four stainless steel dinner plates, durable and easy to clean.",
      "price": 34,
      "discountpercentage": 12,
      "rating": 4.8,
      "stock": 100,
      "brand": "SteelDining",
      "category": "Dinnerware",
      "thumbnail": "https://4.imimg.com/data4/OL/ES/MY-27583622/steel-dinner-plate-500x500.jpg",
      "image": [
        "https://example.com/stainless-steel-dinner-plates-1.png",
        "https://example.com/stainless-steel-dinner-plates-2.png",
      ],
    },
  ];
  List<Map<String, dynamic>> glassware = [
    {
      "id": 1,
      "name": "Crystal Wine Glasses",
      "description": "A set of four crystal wine glasses, perfect for red and white wines.",
      "price": 49,
      "discountpercentage": 15,
      "rating": 2.9,
      "stock": 85,
      "brand": "EleganceGlassware",
      "category": "Glassware",
      "thumbnail": "https://cdn.shopify.com/s/files/1/1324/6459/products/77372_1024x1024.jpg?v=1468526199",
      "image": [
        "https://example.com/crystal-wine-glasses-1.png",
        "https://example.com/crystal-wine-glasses-2.png",
      ],
    },
    {
      "id": 2,
      "name": "Glass Tumblers",
      "description": "A set of six glass tumblers, ideal for serving water and soft drinks.",
      "price": 29,
      "discountpercentage": 10,
      "rating": 1.8,
      "stock": 120,
      "brand": "EverydayGlass",
      "category": "Glassware",
      "thumbnail": "https://cdn.shopify.com/s/files/1/1324/6459/products/77366_1024x1024.jpg?v=1468525630",
      "image": [
        "https://example.com/glass-tumblers-1.png",
        "https://example.com/glass-tumblers-2.png",
      ],
    },
    {
      "id": 3,
      "name": "Martini Glasses",
      "description": "A set of four martini glasses, perfect for cocktail parties and special occasions.",
      "price": 39,
      "discountpercentage": 12,
      "rating": 3.7,
      "stock": 90,
      "brand": "CocktailClassics",
      "category": "Glassware",
      "thumbnail": "https://images.homedepot-static.com/productImages/90ab2559-5a09-4a51-8a69-f4715ef40b7c/svn/visol-cocktail-glasses-vac317-x2-64_1000.jpg",
      "image": [
        "https://example.com/martini-glasses-1.png",
        "https://example.com/martini-glasses-2.png",
      ],
    },
    {
      "id": 4,
      "name": "Champagne Flutes",
      "description": "A set of six champagne flutes, ideal for toasting special moments.",
      "price": 59,
      "discountpercentage": 10,
      "rating": 4.9,
      "stock": 70,
      "brand": "CelebrationGlassware",
      "category": "Glassware",
      "thumbnail": "https://images-na.ssl-images-amazon.com/images/I/518o0vphbhL._AC_SX522_.jpg",
      "image": [
        "https://example.com/champagne-flutes-1.png",
        "https://example.com/champagne-flutes-2.png",
      ],
    },
    {
      "id": 5,
      "name": "Mason Jar Mugs",
      "description": "A set of four mason jar mugs with handles, perfect for iced tea and lemonade.",
      "price": 24,
      "discountpercentage": 20,
      "rating": 1.6,
      "stock": 100,
      "brand": "RusticCharm",
      "category": "Glassware",
      "thumbnail": "https://image.dhgate.com/0x0s/f2-albu-g8-M00-2A-69-rBVaVF1uPSyAKWX_AAIkDErrcug720.jpg/700ml-stainless-steel-mason-jar-mugs-single.jpg",
      "image": [
        "https://example.com/mason-jar-mugs-1.png",
        "https://example.com/mason-jar-mugs-2.png",
      ],
    },
    {
      "id": 6,
      "name": "Highball Glasses",
      "description": "A set of six highball glasses, perfect for serving cocktails and mixed drinks.",
      "price": 34,
      "discountpercentage": 15,
      "rating": 3.8,
      "stock": 95,
      "brand": "MixologyEssentials",
      "category": "Glassware",
      "thumbnail": "https://www.drinkstuff.com/productimg/120900_large.jpg",
      "image": [
        "https://example.com/highball-glasses-1.png",
        "https://example.com/highball-glasses-2.png",
      ],
    },
    {
      "id": 7,
      "name": "Whiskey Glasses",
      "description": "A set of four whiskey glasses, perfect for enjoying your favorite spirits.",
      "price": 44,
      "discountpercentage": 12,
      "rating": 4.9,
      "stock": 80,
      "brand": "Gentleman'sChoice",
      "category": "Glassware",
      "thumbnail": "https://images-na.ssl-images-amazon.com/images/I/41bvZDlJFcL.jpg",
      "image": [
        "https://example.com/whiskey-glasses-1.png",
        "https://example.com/whiskey-glasses-2.png",
      ],
    },
    {
      "id": 8,
      "name": "Shot Glasses",
      "description": "A set of twelve shot glasses, essential for any home bar.",
      "price": 19,
      "discountpercentage": 18,
      "rating": 2.7,
      "stock": 110,
      "brand": "BarEssentials",
      "category": "Glassware",
      "thumbnail": "https://m.media-amazon.com/images/I/31lcPsO-i5L.jpg",
      "image": [
        "https://example.com/shot-glasses-1.png",
        "https://example.com/shot-glasses-2.png",
      ],
    },
    {
      "id": 9,
      "name": "Beer Mugs",
      "description": "A set of four large beer mugs, perfect for serving your favorite brews.",
      "price": 29,
      "discountpercentage": 15,
      "rating": 3.8,
      "stock": 100,
      "brand": "BrewMasters",
      "category": "Glassware",
      "thumbnail": "https://cdn.shopify.com/s/files/1/1324/6459/products/77311_1024x1024.jpg?v=1466890384",
      "image": [
        "https://example.com/beer-mugs-1.png",
        "https://example.com/beer-mugs-2.png",
      ],
    },
    {
      "id": 10,
      "name": "Water Goblets",
      "description": "A set of four water goblets, elegant and perfect for formal dining.",
      "price": 39,
      "discountpercentage": 10,
      "rating": 1.8,
      "stock": 85,
      "brand": "FormalDining",
      "category": "Glassware",
      "thumbnail": "http://www.packshine.com/wp-content/uploads/2018/04/goblet.jpg",
      "image": [
        "https://example.com/water-goblets-1.png",
        "https://example.com/water-goblets-2.png",
      ],
    },
  ];

  List<Map<String, dynamic>> filteredKnife = [];
  List<Map<String, dynamic>> filteredBowls = [];
  List<Map<String, dynamic>> filteredSpoons = [];
  List<Map<String, dynamic>> filteredPlates = [];
  List<Map<String, dynamic>> filteredGlassware = [];

  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    filteredKnife = knife;
    filteredBowls = bowls;
    filteredSpoons=spoons;
    filteredPlates=plates;
    filteredGlassware=glassware;
  }

  void filterSearchResults(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredKnife = knife.where((item) {
        return item['name'].toLowerCase().contains(searchQuery);
      }).toList();

      filteredBowls = bowls.where((item) {
        return item['name'].toLowerCase().contains(searchQuery);
      }).toList();

      filteredSpoons = spoons.where((item) {
        return item['name'].toLowerCase().contains(searchQuery);
      }).toList();

      filteredPlates = plates.where((item) {
        return item['name'].toLowerCase().contains(searchQuery);
      }).toList();

      filteredGlassware = glassware.where((item) {
        return item['name'].toLowerCase().contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child:Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      child: (imageFile == null) ? const Text("ADD") : Container(),
                      backgroundImage:
                      (imageFile == null) ? null : FileImage(imageFile!),
                    ),
                    FloatingActionButton(
                        mini: true,
                        child: const Icon(Icons.add),
                        elevation: 0,
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: const CircleBorder(),
                        onPressed: () async {
                          XFile? xFile = await picker.pickImage(
                              source: ImageSource.camera);
                          imageFile = File(xFile!.path);
                          setState(() {});
                        }),
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      onSaved: (val){
                        Globals.name=val;
                      },
                      validator: (val){
                        if(val!.isEmpty){
                          return "Please Enter Your Name";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Enter Your Name",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: (){
                            nameController.clear();
                            Globals.name=null;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller: emailController,
                      onSaved: (val){
                        Globals.email=val;
                      },
                      validator: (val){
                        if(val!.isEmpty){
                          return "Please Enter Your Email";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter Your Email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                        prefixIcon: const Icon(Icons.email),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: (){
                            emailController.clear();
                            Globals.email=null;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller: phoneController,
                      onSaved: (val){
                        Globals.phone=val;
                      },
                      validator: (val){
                        if(val!.isEmpty){
                          return "Please Enter Your Phone";
                        }else if (val.length < 10 || val.length > 10) {
                          return "Conact no. must be 10 digits...";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "Phone",
                        hintText: "Enter Your Phone",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                        prefixIcon: const Icon(Icons.phone),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: (){
                            phoneController.clear();
                            Globals.phone=null;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller: addressController,
                      onSaved: (val){
                        Globals.address=val;
                      },
                      validator: (val){
                        if(val!.isEmpty){
                          return "Please Enter Your Address";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "Address",
                        hintText: "Enter Your Address",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
                        prefixIcon: const Icon(Icons.location_on),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: (){
                            addressController.clear();
                            Globals.address=null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                            const Text("Form Validation Sucessful..."),
                            backgroundColor: Colors.grey,
                            behavior: SnackBarBehavior.floating,
                            action: SnackBarAction(
                              label: "DISMISS",
                              textColor: Colors.black,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                            Text("Form Validation Failed..."),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );

                        print("=========");
                        print("Form Validation is Failed...");
                        print("=========");
                      }
                      print("=========");
                      print(Globals.name);
                      print(Globals.email);
                      print(Globals.phone);
                      print(Globals.address);
                      print("=========");
                    },
                    child: const Text("Save",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    )
                ),
                const SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () {
                    formKey.currentState!.reset();

                    nameController.clear();
                    emailController.clear();
                    phoneController.clear();
                    addressController.clear();

                    Globals.name = null;
                    Globals.email = null;
                    Globals.phone = null;
                    Globals.address = null;

                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: const Text("Clear",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("wishlist");
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.favorite,color: Colors.red,),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("cart");
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterSearchResults,
              decoration: InputDecoration(
                hintText: "Search...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network("https://img.freepik.com/premium-photo/flat-lay-top-view-kitchen-utensils-cooking-tools-grey-background-horizontal-banner-layout-kitchenware-equipments-captured-from-generative-ai_750630-5560.jpg?w=2000"),
            ),
            SizedBox(height: 15,),
            SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  children: [
                  ActionChip(
                  shape: LinearBorder.bottom(),
                  backgroundColor: select == "all"
                  ? Colors.grey.shade100
                  : Colors.white,
                  label: const Text("All",
                    selectionColor: Colors.black,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      select = "all";
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  ActionChip(
                  shape: LinearBorder.bottom(),
                  backgroundColor: select == "knife"
                  ? Colors.grey.shade100
                  : Colors.white,
                  label: const Text("Knife",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      select = "knife";
                    });
                  },
                  ),
                  const SizedBox(width: 10),
                  ActionChip(
                  shape: LinearBorder.bottom(),
                  backgroundColor: select == "bowls"
                  ? Colors.grey.shade100
                  : Colors.white,
                  label: const Text("Bowls",
                  selectionColor: Colors.green,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      select = "bowls";
                     });
                  },
                  ),
                  const SizedBox(width: 10),
                  ActionChip(
                  shape: LinearBorder.bottom(),
                  backgroundColor: select == "spoons"
                  ? Colors.grey.shade100
                : Colors.white,
                  label: const Text(
                  "Spoons",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                  ),
                  ),
                  onPressed: () {
                  setState(() {
                  select = "spoons";
                  });
                  },
                  ),
                  const SizedBox(width: 10),
                  ActionChip(
                  shape: LinearBorder.bottom(),
                  backgroundColor: select == "plates"
                  ? Colors.grey.shade100
                : Colors.white,
                  label: const Text(
                  "Plates",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                  ),
                  ),
                  onPressed: () {
                  setState(() {
                  select = "plates";
                  });
                  },
                  ),
                  const SizedBox(width: 10),
                  ActionChip(
                  shape: LinearBorder.bottom(),
                  backgroundColor: select == "Glassware"
                  ? Colors.grey.shade100
                : Colors.white,
                  label: const Text(
                  "glassware",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                  ),
                  ),
                  onPressed: () {
                  setState(() {
                  select = "glassware";
                  });
                  },
                  ),
                  ],
                  ),
            ),
              ),

            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Visibility(
                          visible: select == "knife" || select == "all",
                          child: const Text(
                            "Knife",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: select == "knife" || select == "all",
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: filteredKnife.map((e) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("detail", arguments: e);
                                  },
                                  child: Container(
                                    height: 300,
                                    width: 160,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 3,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(
                                          e['thumbnail'],
                                          height: 180,
                                          width: 220,
                                        ),
                                        Text(
                                          e['name'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "₹ ${e['price']}",
                                          style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: double.parse("${e['rating']}"),
                                              allowHalfRating: true,
                                              direction: Axis.horizontal,
                                              itemSize: 15,
                                              itemPadding: const EdgeInsets.only(left: 10),
                                              itemBuilder: (context, val) {
                                                return const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                );
                                              },
                                              onRatingUpdate: (val) {},
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Visibility(
                          visible: select == "bowls" || select == "all",
                          child: const Text(
                            "Bowls",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: select == "bowls" || select == "all",
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: filteredBowls.map((e) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("detail", arguments: e);
                                  },
                                  child: Container(
                                    height: 300,
                                    width: 160,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 3,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(
                                          e['thumbnail'],
                                          height: 180,
                                          width: 220,
                                        ),
                                        Text(
                                          e['name'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "₹ ${e['price']}",
                                          style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: double.parse("${e['rating']}"),
                                              allowHalfRating: true,
                                              direction: Axis.horizontal,
                                              itemSize: 15,
                                              itemPadding: const EdgeInsets.only(left: 10),
                                              itemBuilder: (context, val) {
                                                return const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                );
                                              },
                                              onRatingUpdate: (val) {},
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Visibility(
                          visible: select == "spoons" || select == "all",
                          child: const Text(
                            "Spoons",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: select == "spoons" || select == "all",
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: filteredSpoons.map((e) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("detail", arguments: e);
                                  },
                                  child: Container(
                                    height: 300,
                                    width: 160,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 3,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(
                                          e['thumbnail'],
                                          height: 180,
                                          width: 220,
                                        ),
                                        Text(
                                          e['name'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "₹ ${e['price']}",
                                          style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: double.parse("${e['rating']}"),
                                              allowHalfRating: true,
                                              direction: Axis.horizontal,
                                              itemSize: 15,
                                              itemPadding: const EdgeInsets.only(left: 10),
                                              itemBuilder: (context, val) {
                                                return const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                );
                                              },
                                              onRatingUpdate: (val) {},
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Visibility(
                          visible: select == "plates" || select == "all",
                          child: const Text(
                            "Plates",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: select == "plates" || select == "all",
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: filteredPlates.map((e) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("detail", arguments: e);
                                  },
                                  child: Container(
                                    height: 300,
                                    width: 160,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 3,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(
                                          e['thumbnail'],
                                          height: 180,
                                          width: 220,
                                        ),
                                        Text(
                                          e['name'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "₹ ${e['price']}",
                                          style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: double.parse("${e['rating']}"),
                                              allowHalfRating: true,
                                              direction: Axis.horizontal,
                                              itemSize: 15,
                                              itemPadding: const EdgeInsets.only(left: 10),
                                              itemBuilder: (context, val) {
                                                return const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                );
                                              },
                                              onRatingUpdate: (val) {},
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Visibility(
                          visible: select == "glassware" || select == "all",
                          child: const Text(
                            "Glassware",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: select == "glassware" || select == "all",
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: filteredGlassware.map((e) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("detail", arguments: e);
                                  },
                                  child: Container(
                                    height: 300,
                                    width: 160,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 3,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(
                                          e['thumbnail'],
                                          height: 180,
                                          width: 220,
                                        ),
                                        Text(
                                          e['name'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "₹ ${e['price']}",
                                          style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: double.parse("${e['rating']}"),
                                              allowHalfRating: true,
                                              direction: Axis.horizontal,
                                              itemSize: 15,
                                              itemPadding: const EdgeInsets.only(left: 10),
                                              itemBuilder: (context, val) {
                                                return const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                );
                                              },
                                              onRatingUpdate: (val) {},
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
