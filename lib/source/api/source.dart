/// A basic interface for creating a source. It could be an online source, a local source, etc.
interface class Source {
  Source({
    required this.id,
    required this.name,
    this.lang = "",
  });

  /// ID for the source. Must be unique.
  final int id;
  /// Name of the source.
  final String name;
  final String lang;
}
