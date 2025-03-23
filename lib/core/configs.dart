// configs.dart

import 'package:flutter_dotenv/flutter_dotenv.dart';

bool get isDev => dotenv.env['ENV'] == 'dev';
