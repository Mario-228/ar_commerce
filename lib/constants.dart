import 'package:graduation_project_new_version/core/utils/models/custom_product_item_model/custom_product_item_model.dart';

import 'features/profile_feature/data/models/profile_user_model.dart';

const String anonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJhenZmb2lpcWZhbXViZGpxZ29pIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQwODk0MzAsImV4cCI6MjA0OTY2NTQzMH0.C1PexAyagnfqHT6IwnXOziLMzSYQbJ8kmmioeTl4C_k';
const String baseUrl = 'https://bazvfoiiqfamubdjqgoi.supabase.co';

late String userToken;
late bool isVerified;
late String userEmail;

final defaultUser = UserModel(
  addresses: {},
  imageUrl:
      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  userModel: ProfileUserModel(
    email: "email",
    name: "john doe",
    phone: "phone",
    image: "image",
    googleId: "googleId",
    gender: "gender",
    emailVerifiedAt: "emailVerifiedAt",
    id: -1,
    createdAt: "createdAt",
    updatedAt: "updatedAt",
    role: "",
  ),
);

late UserModel userModel;

var customProductItemModel = CustomProductItemModel(
  id: 1,
  name: "Product",
  description: "product description",
  pictureUrl:
      "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?t=st=1733863368~exp=1733866968~hmac=dcf753cc48215353e01269e8d6aaf27adfa1e7eff7d23173fd74e6dda73b5dd2&w=740",
  price: 500.0,
  currency: "L.E",
  isFavorite: false,
  isLike: false,
  productBrandId: 0,
  productTypeId: 0,
  quantity: 5,
  productBrand: "",
  productType: "",
  image3DUrl: "https://modelviewer.dev/shared-assets/models/astronaut.glb",
);
