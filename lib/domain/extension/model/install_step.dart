enum InstallStep {
  idle,
  pending,
  downloading,
  installing,
  installed,
  error;

  bool get isCompleted => this == installed || this == error || this == idle;
}
