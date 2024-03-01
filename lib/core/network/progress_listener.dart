abstract interface class ProgressListener {
  void update(int bytesRead, int contentLength, bool done);
}
