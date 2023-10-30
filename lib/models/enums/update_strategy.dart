enum UpdateStrategy {
  /// Series marked as always update will be included in the library
  /// update if they aren't excluded by additional restrictions.
  alwaysUpdate,

  /// Series marked as only fetch once will be automatically skipped
  /// during library updates. Useful for cases where the series is previously
  /// known to be finished and have only a single chapter, for example.
  onlyFetchOnce,
}
