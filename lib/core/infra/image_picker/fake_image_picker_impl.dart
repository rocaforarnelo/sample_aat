import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_app/core/infra/image_picker/image_picker.dart';

@LazySingleton(as: AppImagePicker, env: [Environment.test])
class FakeImagePickerImpl implements AppImagePicker {
  @override
  Future<File?> pickImage() async {
    final Directory directory = await getTemporaryDirectory();
    String path = directory.path;

    File file = File('$path/test_photo.png');
    await file.writeAsBytes(testBytes);
    return file;
  }
}

final testBytes = [
  137,
  80,
  78,
  71,
  13,
  10,
  26,
  10,
  0,
  0,
  0,
  13,
  73,
  72,
  68,
  82,
  0,
  0,
  0,
  2,
  0,
  0,
  0,
  2,
  8,
  6,
  0,
  0,
  0,
  114,
  182,
  13,
  36,
  0,
  0,
  1,
  90,
  105,
  67,
  67,
  80,
  73,
  67,
  67,
  32,
  80,
  114,
  111,
  102,
  105,
  108,
  101,
  0,
  0,
  40,
  145,
  109,
  144,
  79,
  75,
  2,
  81,
  20,
  197,
  143,
  127,
  66,
  179,
  22,
  38,
  66,
  155,
  22,
  179,
  21,
  38,
  9,
  199,
  106,
  173,
  6,
  25,
  184,
  152,
  236,
  127,
  171,
  198,
  231,
  164,
  130,
  218,
  99,
  156,
  138,
  160,
  47,
  208,
  174,
  85,
  159,
  32,
  130,
  118,
  109,
  196,
  90,
  213,
  7,
  104,
  23,
  40,
  132,
  173,
  90,
  212,
  62,
  114,
  83,
  54,
  221,
  55,
  86,
  163,
  213,
  133,
  203,
  253,
  113,
  56,
  239,
  114,
  223,
  1,
  220,
  126,
  141,
  243,
  178,
  23,
  64,
  165,
  106,
  26,
  217,
  249,
  164,
  180,
  190,
  177,
  41,
  249,
  158,
  48,
  12,
  15,
  130,
  240,
  99,
  86,
  99,
  53,
  158,
  80,
  213,
  12,
  89,
  240,
  61,
  7,
  171,
  211,
  132,
  75,
  204,
  187,
  73,
  177,
  171,
  165,
  156,
  127,
  108,
  181,
  95,
  211,
  139,
  207,
  227,
  123,
  217,
  230,
  197,
  209,
  95,
  255,
  64,
  5,
  242,
  122,
  141,
  209,
  124,
  167,
  142,
  50,
  110,
  152,
  128,
  75,
  38,
  86,
  247,
  77,
  46,
  248,
  144,
  56,
  108,
  208,
  81,
  196,
  199,
  130,
  11,
  61,
  62,
  21,
  156,
  235,
  241,
  165,
  237,
  89,
  206,
  166,
  136,
  111,
  137,
  131,
  172,
  168,
  229,
  137,
  219,
  196,
  114,
  174,
  79,
  47,
  244,
  113,
  165,
  188,
  203,
  190,
  110,
  16,
  215,
  143,
  234,
  213,
  149,
  37,
  154,
  33,
  234,
  9,
  168,
  72,
  35,
  3,
  9,
  49,
  196,
  161,
  96,
  21,
  211,
  148,
  207,
  255,
  254,
  184,
  237,
  79,
  97,
  7,
  28,
  7,
  48,
  80,
  66,
  1,
  69,
  152,
  244,
  54,
  65,
  10,
  71,
  25,
  58,
  241,
  2,
  170,
  96,
  136,
  66,
  182,
  119,
  78,
  81,
  43,
  34,
  231,
  223,
  249,
  57,
  90,
  105,
  14,
  152,
  121,
  4,
  220,
  186,
  163,
  177,
  58,
  112,
  21,
  6,
  198,
  234,
  142,
  22,
  121,
  160,
  175,
  4,
  128,
  235,
  16,
  215,
  12,
  237,
  39,
  85,
  87,
  199,
  91,
  219,
  86,
  98,
  61,
  30,
  105,
  0,
  67,
  39,
  150,
  245,
  178,
  6,
  248,
  34,
  64,
  183,
  101,
  89,
  111,
  13,
  203,
  234,
  158,
  1,
  158,
  123,
  224,
  166,
  243,
  9,
  158,
  82,
  99,
  217,
  145,
  60,
  63,
  13,
  0,
  0,
  0,
  86,
  101,
  88,
  73,
  102,
  77,
  77,
  0,
  42,
  0,
  0,
  0,
  8,
  0,
  1,
  135,
  105,
  0,
  4,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  26,
  0,
  0,
  0,
  0,
  0,
  3,
  146,
  134,
  0,
  7,
  0,
  0,
  0,
  18,
  0,
  0,
  0,
  68,
  160,
  2,
  0,
  4,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  2,
  160,
  3,
  0,
  4,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  2,
  0,
  0,
  0,
  0,
  65,
  83,
  67,
  73,
  73,
  0,
  0,
  0,
  83,
  99,
  114,
  101,
  101,
  110,
  115,
  104,
  111,
  116,
  208,
  90,
  104,
  222,
  0,
  0,
  1,
  210,
  105,
  84,
  88,
  116,
  88,
  77,
  76,
  58,
  99,
  111,
  109,
  46,
  97,
  100,
  111,
  98,
  101,
  46,
  120,
  109,
  112,
  0,
  0,
  0,
  0,
  0,
  60,
  120,
  58,
  120,
  109,
  112,
  109,
  101,
  116,
  97,
  32,
  120,
  109,
  108,
  110,
  115,
  58,
  120,
  61,
  34,
  97,
  100,
  111,
  98,
  101,
  58,
  110,
  115,
  58,
  109,
  101,
  116,
  97,
  47,
  34,
  32,
  120,
  58,
  120,
  109,
  112,
  116,
  107,
  61,
  34,
  88,
  77,
  80,
  32,
  67,
  111,
  114,
  101,
  32,
  54,
  46,
  48,
  46,
  48,
  34,
  62,
  10,
  32,
  32,
  32,
  60,
  114,
  100,
  102,
  58,
  82,
  68,
  70,
  32,
  120,
  109,
  108,
  110,
  115,
  58,
  114,
  100,
  102,
  61,
  34,
  104,
  116,
  116,
  112,
  58,
  47,
  47,
  119,
  119,
  119,
  46,
  119,
  51,
  46,
  111,
  114,
  103,
  47,
  49,
  57,
  57,
  57,
  47,
  48,
  50,
  47,
  50,
  50,
  45,
  114,
  100,
  102,
  45,
  115,
  121,
  110,
  116,
  97,
  120,
  45,
  110,
  115,
  35,
  34,
  62,
  10,
  32,
  32,
  32,
  32,
  32,
  32,
  60,
  114,
  100,
  102,
  58,
  68,
  101,
  115,
  99,
  114,
  105,
  112,
  116,
  105,
  111,
  110,
  32,
  114,
  100,
  102,
  58,
  97,
  98,
  111,
  117,
  116,
  61,
  34,
  34,
  10,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  120,
  109,
  108,
  110,
  115,
  58,
  101,
  120,
  105,
  102,
  61,
  34,
  104,
  116,
  116,
  112,
  58,
  47,
  47,
  110,
  115,
  46,
  97,
  100,
  111,
  98,
  101,
  46,
  99,
  111,
  109,
  47,
  101,
  120,
  105,
  102,
  47,
  49,
  46,
  48,
  47,
  34,
  62,
  10,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  60,
  101,
  120,
  105,
  102,
  58,
  80,
  105,
  120,
  101,
  108,
  89,
  68,
  105,
  109,
  101,
  110,
  115,
  105,
  111,
  110,
  62,
  50,
  60,
  47,
  101,
  120,
  105,
  102,
  58,
  80,
  105,
  120,
  101,
  108,
  89,
  68,
  105,
  109,
  101,
  110,
  115,
  105,
  111,
  110,
  62,
  10,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  60,
  101,
  120,
  105,
  102,
  58,
  80,
  105,
  120,
  101,
  108,
  88,
  68,
  105,
  109,
  101,
  110,
  115,
  105,
  111,
  110,
  62,
  50,
  60,
  47,
  101,
  120,
  105,
  102,
  58,
  80,
  105,
  120,
  101,
  108,
  88,
  68,
  105,
  109,
  101,
  110,
  115,
  105,
  111,
  110,
  62,
  10,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  32,
  60,
  101,
  120,
  105,
  102,
  58,
  85,
  115,
  101,
  114,
  67,
  111,
  109,
  109,
  101,
  110,
  116,
  62,
  83,
  99,
  114,
  101,
  101,
  110,
  115,
  104,
  111,
  116,
  60,
  47,
  101,
  120,
  105,
  102,
  58,
  85,
  115,
  101,
  114,
  67,
  111,
  109,
  109,
  101,
  110,
  116,
  62,
  10,
  32,
  32,
  32,
  32,
  32,
  32,
  60,
  47,
  114,
  100,
  102,
  58,
  68,
  101,
  115,
  99,
  114,
  105,
  112,
  116,
  105,
  111,
  110,
  62,
  10,
  32,
  32,
  32,
  60,
  47,
  114,
  100,
  102,
  58,
  82,
  68,
  70,
  62,
  10,
  60,
  47,
  120,
  58,
  120,
  109,
  112,
  109,
  101,
  116,
  97,
  62,
  10,
  21,
  39,
  98,
  201,
  0,
  0,
  0,
  25,
  73,
  68,
  65,
  84,
  8,
  29,
  99,
  92,
  39,
  37,
  254,
  159,
  225,
  31,
  3,
  3,
  19,
  3,
  3,
  35,
  195,
  63,
  32,
  9,
  0,
  44,
  155,
  3,
  225,
  216,
  100,
  144,
  127,
  0,
  0,
  0,
  0,
  73,
  69,
  78,
  68,
  174,
  66,
  96,
  130
];
