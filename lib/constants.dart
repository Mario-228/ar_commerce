import 'package:graduation_project/features/profile_feature/data/models/profile_user_model.dart';

const String anonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRocWpjeWlpc3VocGJ6c2hheG5tIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM3NDg3MTUsImV4cCI6MjA0OTMyNDcxNX0.bO0FfYvKRKLtqt7C0gT-ogUGKN0_oxn-A-gxQwMft1g';
const String baseUrl = 'https://dhqjcyiisuhpbzshaxnm.supabase.co';

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
  ),
);
