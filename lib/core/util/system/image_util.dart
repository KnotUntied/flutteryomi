import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mime/mime.dart';

part 'image_util.freezed.dart';

enum Side { right, left }

@freezed
class SplitData with _$SplitData {
  const SplitData._();
  const factory SplitData(
    int index,
    int topOffset,
    int splitHeight,
    int splitWidth,
  ) = _SplitData;

  int get bottomOffset => topOffset + splitHeight;
}

//TODO
abstract class ImageUtil {
  static final MimeTypeResolver resolver = MimeTypeResolver()
      ..addExtension('jxl', 'image/jxl')
      ..addMagicNumber([0xFF, 0x0A], 'image/jxl')
      ..addMagicNumber(
        [0x00, 0x00, 0x00, 0x0C, 0x4A, 0x58, 0x4C, 0x20, 0x0D, 0x0A, 0x87, 0x0A],
        'image/jxl',
      );

  static bool isImage(String? path, {List<int>? headerBytes}) {
    if (path == null) return false;
    final contentType = resolver.lookup(path, headerBytes: headerBytes);
    return contentType?.startsWith("image/") ?? false;
  }

  static String getExtensionFromMimeType(String? mime) {
    String extension = extensionFromMime(mime ?? 'image/jpeg');
    if (extension == mime) extension = _supplementaryMimetypeMapping[extension] ?? 'jpg';
    return extension;
  }

  static bool isAnimatedAndSupported(Stream<List<int>> stream) {
    try {
      //See https://github.com/tachiyomiorg/image-decoder/blob/main/library/src/main/java/tachiyomi/decoder/ImageType.kt
      //Will have to do checks in some other way
      //final type = _getImageType(stream);
      //if (type == null) return false;
      //return switch (type.format) {
      //  Format.gif => true,
      //  // Doc from Mihon, might be relevant
      //  // Coil supports animated WebP on Android 9.0+
      //  // https://coil-kt.github.io/coil/getting_started/#supported-image-formats
      //  Format.webp => type.isAnimated && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P,
      //  _ => false,
      //}
      return false;
    } catch (e) {
      // Do nothing
    }
    return false;
  }

  //static String? _getImageType(Stream<List<int>> stream) {
  //  final bytes = ByteArray(32);

  //  final length = if (stream.markSupported()) {
  //    stream.mark(bytes.size)
  //    stream.read(bytes, 0, bytes.size).also { stream.reset() }
  //  } else {
  //    stream.read(bytes, 0, bytes.size);
  //  }

  //  if (length == -1) return null;

  //  return ImageDecoder.findType(bytes);
  //}

  /// Check whether the image is wide (which we consider a double-page spread).
  ///
  /// Returns true if the width is greater than the height.
  //static bool isWideImage(BufferedInputStream imageStream) {
  //  final options = _extractImageOptions(imageStream);
  //  return options.outWidth > options.outHeight;
  //}

  /// Extract the 'side' part from imageStream and return it as InputStream.
  //static InputStream splitInHalf(InputStream imageStream, Side side) {
  //  final imageBytes = imageStream.readBytes();

  //  final imageBitmap = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size);
  //  final height = imageBitmap.height;
  //  final width = imageBitmap.width;

  //  final singlePage = Rect(0, 0, width / 2, height);

  //  final half = createBitmap(width / 2, height);
  //  final part = switch (side) {
  //    Side.right => Rect(width - width / 2, 0, width, height),
  //    Side.left => Rect(0, 0, width / 2, height),
  //  };
  //  half.applyCanvas {
  //    drawBitmap(imageBitmap, part, singlePage, null);
  //  }
  //  final output = ByteArrayOutputStream();
  //  half.compress(Bitmap.CompressFormat.JPEG, 100, output);

  //  return ByteArrayInputStream(output.toByteArray());
  //}

  //static InputStream rotateImage(InputStream imageStream, double degrees) {
  //  final imageBytes = imageStream.readBytes();

  //  final imageBitmap = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size);
  //  final rotated = _rotateBitMap(imageBitmap, degrees);

  //  final output = ByteArrayOutputStream();
  //  rotated.compress(Bitmap.CompressFormat.JPEG, 100, output);

  //  return ByteArrayInputStream(output.toByteArray());
  //}

  //static Bitmap _rotateBitMap(Bitmap bitmap, double degrees) {
  //  final matrix = Matrix().apply { postRotate(degrees) };
  //  return Bitmap.createBitmap(bitmap, 0, 0, bitmap.width, bitmap.height, matrix, true);
  //}

  /// Split the image into left and right parts, then merge them into a new image.
  //static InputStream splitAndMerge(InputStream imageStream, Side upperSide) {
  //  final imageBytes = imageStream.readBytes();

  //  final imageBitmap = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size);
  //  final height = imageBitmap.height;
  //  final width = imageBitmap.width;

  //  final result = createBitmap(width / 2, height * 2);
  //  result.applyCanvas {
  //    // right -> upper
  //    final rightPart = switch (upperSide) {
  //      Side.right => Rect(width - width / 2, 0, width, height),
  //      Side.left => Rect(0, 0, width / 2, height),
  //    };
  //    final upperPart = Rect(0, 0, width / 2, height);
  //    drawBitmap(imageBitmap, rightPart, upperPart, null);
  //    // left -> bottom
  //    final leftPart = switch (upperSide) {
  //      Side.left => Rect(width - width / 2, 0, width, height),
  //      Side.right => Rect(0, 0, width / 2, height),
  //    };
  //    final bottomPart = Rect(0, height, width / 2, height * 2);
  //    drawBitmap(imageBitmap, leftPart, bottomPart, null);
  //  }

  //  final output = ByteArrayOutputStream();
  //  result.compress(Bitmap.CompressFormat.JPEG, 100, output);
  //  return ByteArrayInputStream(output.toByteArray());
  //}

  /// Check whether the image is considered a tall image.
  ///
  /// Returns true if the height:width ratio is greater than 3.
  //static bool _isTallImage(InputStream imageStream) {
  //  final options = _extractImageOptions(imageStream, resetAfterExtraction: false);
  //  return (options.outHeight / options.outWidth) > 3;
  //}

  /// Splits tall images to improve performance of reader
  static bool splitTallImage(Directory tmpDir, File imageFile, String filenamePrefix) {
  //  if (isAnimatedAndSupported(imageFile.openInputStream()) || !_isTallImage(imageFile.openInputStream())) {
  //    return true;
  //  }

  //  final bitmapRegionDecoder = _getBitmapRegionDecoder(imageFile.openInputStream())
  //  if (bitmapRegionDecoder == null) {
  //    logcat { "Failed to create new instance of BitmapRegionDecoder" }
  //    return false;
  //  }

  //  final options = _extractImageOptions(imageFile.openInputStream(), resetAfterExtraction: false).apply {
  //    inJustDecodeBounds = false;
  //  }

  //  final splitDataList = options.splitData;

  //  try {
  //    splitDataList.forEach((splitData) {
  //      final splitImageName = _splitImageName(filenamePrefix, splitData.index)
  //      // Remove pre-existing split if exists (this split shouldn't exist under normal circumstances)
  //      tmpDir.findFile(splitImageName)?.delete()

  //      final splitFile = tmpDir.createFile(splitImageName)!!

  //      final region = Rect(0, splitData.topOffset, splitData.splitWidth, splitData.bottomOffset)

  //      splitFile.openOutputStream().use { outputStream ->
  //        final splitBitmap = bitmapRegionDecoder.decodeRegion(region, options);
  //        splitBitmap.compress(Bitmap.CompressFormat.JPEG, 100, outputStream);
  //        splitBitmap.recycle();
  //      }
  //      logcat {
  //          "Success: Split #${splitData.index + 1} with topOffset=${splitData.topOffset} " +
  //              "height=${splitData.splitHeight} bottomOffset=${splitData.bottomOffset}"
  //      }
  //    });
  //    imageFile.delete();
  //    return true;
  //  } catch (e) {
  //    // Image splits were not successfully saved so delete them and keep the original image
  //    splitDataList
  //        .map((it) => _splitImageName(filenamePrefix, it.index))
  //        .forEach((it) => tmpDir.findFile(it)?.delete());
  //    logger.e(e);
  //    return false;
  //  } finally {
  //    bitmapRegionDecoder.recycle();
  //  }
    return false;
  }

  //static _splitImageName(String filenamePrefix, int index) => "${filenamePrefix}__${"%03d".format(
  //    Locale.ENGLISH,
  //    index + 1,
  //)}.jpg"
  static _splitImageName(String filenamePrefix, int index) => "example.jpg";

  //private val BitmapFactory.Options.splitData
  //    get(): List<SplitData> {
  //        val imageHeight = outHeight
  //        val imageWidth = outWidth

  //        // -1 so it doesn't try to split when imageHeight = _optimalImageHeight
  //        val partCount = (imageHeight - 1) / _optimalImageHeight + 1
  //        val optimalSplitHeight = imageHeight / partCount

  //        logcat {
  //            "Generating SplitData for image (height: $imageHeight): " +
  //                "$partCount parts @ ${optimalSplitHeight}px height per part"
  //        }

  //        return buildList {
  //            val range = 0..<partCount
  //            for (index in range) {
  //                // Only continue if the list is empty or there is image remaining
  //                if (isNotEmpty() && imageHeight <= last().bottomOffset) break

  //                val topOffset = index * optimalSplitHeight
  //                var splitHeight = min(optimalSplitHeight, imageHeight - topOffset)

  //                if (index == range.last) {
  //                    val remainingHeight = imageHeight - (topOffset + splitHeight)
  //                    splitHeight += remainingHeight
  //                }

  //                add(SplitData(index, topOffset, splitHeight, imageWidth))
  //            }
  //        }
  //    }

  /// Algorithm for determining what background to accompany a comic/manga page
  //static Drawable chooseBackground(InputStream imageStream) {
  //  final decoder = ImageDecoder.newInstance(imageStream);
  //  final image = decoder?.decode();
  //  decoder?.recycle();

  //  if (image == null) return ColorDrawable(Colors.white);
  //  if (image.width < 50 || image.height < 50) return ColorDrawable(Colors.white);

  //  const top = 5;
  //  final bot = image.height - 5;
  //  final left = (image.width * 0.0275).toInt();
  //  final right = image.width - left;
  //  final midX = image.width / 2;
  //  final midY = image.height / 2;
  //  final offsetX = (image.width * 0.01).toInt();
  //  final leftOffsetX = left - offsetX;
  //  final rightOffsetX = right + offsetX;

  //  final topLeftPixel = image[left, top];
  //  final topRightPixel = image[right, top];
  //  final midLeftPixel = image[left, midY];
  //  final midRightPixel = image[right, midY];
  //  final topCenterPixel = image[midX, top];
  //  final botLeftPixel = image[left, bot];
  //  final bottomCenterPixel = image[midX, bot];
  //  final botRightPixel = image[right, bot];

  //  final topLeftIsDark = topLeftPixel.isDark();
  //  final topRightIsDark = topRightPixel.isDark();
  //  final midLeftIsDark = midLeftPixel.isDark();
  //  final midRightIsDark = midRightPixel.isDark();
  //  final topMidIsDark = topCenterPixel.isDark();
  //  final botLeftIsDark = botLeftPixel.isDark();
  //  final botRightIsDark = botRightPixel.isDark();

  //  var darkBG =
  //      (topLeftIsDark && (botLeftIsDark || botRightIsDark || topRightIsDark || midLeftIsDark || topMidIsDark)) ||
  //          (topRightIsDark && (botRightIsDark || botLeftIsDark || midRightIsDark || topMidIsDark));

  //  final topAndBotPixels =
  //      [topLeftPixel, topCenterPixel, topRightPixel, botRightPixel, bottomCenterPixel, botLeftPixel];
  //  final isNotWhiteAndCloseTo = topAndBotPixels.mapIndexed((index, color) {
  //    final other = topAndBotPixels[(index + 1) % topAndBotPixels.size]
  //    !color.isWhite() && color.isCloseTo(other);
  //  })
  //  if (isNotWhiteAndCloseTo.all { it }) {
  //      return ColorDrawable(topLeftPixel);
  //  }

  //  final cornerPixels = listOf(topLeftPixel, topRightPixel, botLeftPixel, botRightPixel)
  //  final numberOfWhiteCorners = cornerPixels.map((cornerPixel) => cornerPixel.isWhite())
  //      .filter { it }
  //      .length
  //  if (numberOfWhiteCorners > 2) darkBG = false;

  //  var blackColor = when {
  //    topLeftIsDark -> topLeftPixel
  //    topRightIsDark -> topRightPixel
  //    botLeftIsDark -> botLeftPixel
  //    botRightIsDark -> botRightPixel
  //    else -> Colors.white
  //  }

  //  int overallWhitePixels = 0
  //  int overallBlackPixels = 0
  //  int topBlackStreak = 0
  //  int topWhiteStreak = 0
  //  int botBlackStreak = 0
  //  int botWhiteStreak = 0
  //  outer@ for (x in [left, right, leftOffsetX, rightOffsetX]) {
  //      int whitePixelsStreak = 0
  //      int whitePixels = 0
  //      int blackPixelsStreak = 0
  //      int blackPixels = 0
  //      bool blackStreak = false
  //      bool whiteStreak = false
  //      val notOffset = x == left || x == right
  //      inner@ for ((index, y) in (0..<image.height step image.height / 25).withIndex()) {
  //          val pixel = image[x, y]
  //          val pixelOff = image[x + (if (x < image.width / 2) -offsetX else offsetX), y]
  //          if (pixel.isWhite()) {
  //              whitePixelsStreak++
  //              whitePixels++
  //              if (notOffset) {
  //                  overallWhitePixels++
  //              }
  //              if (whitePixelsStreak > 14) {
  //                  whiteStreak = true
  //              }
  //              if (whitePixelsStreak > 6 && whitePixelsStreak >= index - 1) {
  //                  topWhiteStreak = whitePixelsStreak
  //              }
  //          } else {
  //              whitePixelsStreak = 0
  //              if (pixel.isDark() && pixelOff.isDark()) {
  //                  blackPixels++
  //                  if (notOffset) {
  //                      overallBlackPixels++
  //                  }
  //                  blackPixelsStreak++
  //                  if (blackPixelsStreak >= 14) {
  //                      blackStreak = true
  //                  }
  //                  continue@inner
  //              }
  //          }
  //          if (blackPixelsStreak > 6 && blackPixelsStreak >= index - 1) {
  //              topBlackStreak = blackPixelsStreak
  //          }
  //          blackPixelsStreak = 0
  //      }
  //      if (blackPixelsStreak > 6) {
  //          botBlackStreak = blackPixelsStreak
  //      } else if (whitePixelsStreak > 6) {
  //          botWhiteStreak = whitePixelsStreak
  //      }
  //      when {
  //          blackPixels > 22 -> {
  //              if (x == right || x == rightOffsetX) {
  //                  blackColor = when {
  //                      topRightIsDark -> topRightPixel
  //                      botRightIsDark -> botRightPixel
  //                      else -> blackColor
  //                  }
  //              }
  //              darkBG = true
  //              overallWhitePixels = 0
  //              break@outer
  //          }
  //          blackStreak -> {
  //              darkBG = true
  //              if (x == right || x == rightOffsetX) {
  //                  blackColor = when {
  //                      topRightIsDark -> topRightPixel
  //                      botRightIsDark -> botRightPixel
  //                      else -> blackColor
  //                  }
  //              }
  //              if (blackPixels > 18) {
  //                  overallWhitePixels = 0
  //                  break@outer
  //              }
  //          }
  //          whiteStreak || whitePixels > 22 -> darkBG = false
  //      }
  //  }

  //  final topIsBlackStreak = topBlackStreak > topWhiteStreak;
  //  final bottomIsBlackStreak = botBlackStreak > botWhiteStreak;
  //  if (overallWhitePixels > 9 && overallWhitePixels > overallBlackPixels) darkBG = false;
  //  if (topIsBlackStreak && bottomIsBlackStreak) darkBG = true;

  //  final isLandscape = context.resources.configuration?.orientation == Configuration.ORIENTATION_LANDSCAPE;
  //  if (isLandscape) {
  //    return when {
  //      darkBG => ColorDrawable(blackColor)
  //      else => ColorDrawable(Colors.white)
  //    }
  //  }

  //  final botCornersIsWhite = botLeftPixel.isWhite() && botRightPixel.isWhite();
  //  final topCornersIsWhite = topLeftPixel.isWhite() && topRightPixel.isWhite();

  //  final topCornersIsDark = topLeftIsDark && topRightIsDark;
  //  final botCornersIsDark = botLeftIsDark && botRightIsDark;

  //  final topOffsetCornersIsDark = image[leftOffsetX, top].isDark() && image[rightOffsetX, top].isDark();
  //  final botOffsetCornersIsDark = image[leftOffsetX, bot].isDark() && image[rightOffsetX, bot].isDark();

  //  final gradient = when {
  //    darkBG && botCornersIsWhite => {
  //      intArrayOf(blackColor, blackColor, Colors.white, Colors.white)
  //    }
  //    darkBG && topCornersIsWhite => {
  //      intArrayOf(Colors.white, Colors.white, blackColor, blackColor)
  //    }
  //    darkBG => {
  //      return ColorDrawable(blackColor)
  //    }
  //    topIsBlackStreak || (
  //      topCornersIsDark && topOffsetCornersIsDark &&
  //          (topMidIsDark || overallBlackPixels > 9)
  //      ) => {
  //      intArrayOf(blackColor, blackColor, Colors.white, Colors.white)
  //    }
  //    bottomIsBlackStreak || (
  //      botCornersIsDark && botOffsetCornersIsDark &&
  //          (bottomCenterPixel.isDark() || overallBlackPixels > 9)
  //      ) => {
  //      intArrayOf(Colors.white, Colors.white, blackColor, blackColor)
  //    }
  //    else => {
  //      return ColorDrawable(Colors.white)
  //    }
  //  }

  //  return GradientDrawable(
  //    GradientDrawable.Orientation.TOP_BOTTOM,
  //    gradient,
  //  )
  //}

  //private fun @receiver:ColorInt Int.isDark(): Boolean =
  //    red < 40 && blue < 40 && green < 40 && alpha > 200

  //private fun @receiver:ColorInt Int.isCloseTo(other: Int): Boolean =
  //    abs(red - other.red) < 30 && abs(green - other.green) < 30 && abs(blue - other.blue) < 30

  //private fun @receiver:ColorInt Int.isWhite(): Boolean =
  //    red + blue + green > 740

  /// Used to check an image's dimensions without loading it in the memory.
  //static BitmapFactory.Options _extractImageOptions(
  //  InputStream imageStream, {
  //  bool resetAfterExtraction = true,
  //}) {
  //  imageStream.mark(imageStream.available() + 1);

  //  final imageBytes = imageStream.readBytes();
  //  final options = BitmapFactory.Options().apply { inJustDecodeBounds = true };
  //  BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.size, options);
  //  if (resetAfterExtraction) imageStream.reset();
  //  return options;
  //}

  //static BitmapRegionDecoder? _getBitmapRegionDecoder(InputStream imageStream) {
  //  return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
  //      ? BitmapRegionDecoder.newInstance(imageStream)
  //      : BitmapRegionDecoder.newInstance(imageStream, false);
  //}

  static const _optimalImageHeight = getDisplayMaxHeightInPx * 2;

  // jxl is not in defaultExtensionMap
  static const _supplementaryMimetypeMapping = {
    // https://issuetracker.google.com/issues/182703810
    "image/jxl": "jxl",
  };
}

//int get getDisplayMaxHeightInPx => Resources.getSystem().displayMetrics.let { max(it.heightPixels, it.widthPixels) };
const getDisplayMaxHeightInPx = 1000;