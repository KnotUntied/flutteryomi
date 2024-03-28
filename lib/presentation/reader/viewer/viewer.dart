import 'package:flutter/widgets.dart';

import 'package:flutteryomi/domain/reader/model/reader_page.dart';
import 'package:flutteryomi/domain/reader/model/viewer_chapters.dart';

/// Interface for implementing a viewer.
abstract class Viewer {

  /// Returns the view this viewer uses.
  //View getView();

  /// Destroys this viewer. Called when leaving the reader or swapping viewers.
  void destroy();

  /// Tells this viewer to set the given [chapters] as active.
  void setChapters(ViewerChapters chapters);

  /// Tells this viewer to move to the given [page].
  void moveToPage(ReaderPage page);

  /// Called from the containing activity when a key [event] is received. It should return true
  /// if the event was handled, false otherwise.
  bool handleKeyEvent(KeyEvent event);

  /// Called from the containing activity when a generic motion [event] is received. It should
  /// return true if the event was handled, false otherwise.
  //bool handleGenericMotionEvent(MotionEvent event);
}
