// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_result_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$testResultControllerHash() =>
    r'5b2e409f2bf4625ea49aa521bf210ac6950af5bd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [testResultController].
@ProviderFor(testResultController)
const testResultControllerProvider = TestResultControllerFamily();

/// See also [testResultController].
class TestResultControllerFamily
    extends Family<AsyncValue<SubmittedResultResponseEntities?>> {
  /// See also [testResultController].
  const TestResultControllerFamily();

  /// See also [testResultController].
  TestResultControllerProvider call({
    required int testId,
    required String status,
    required List<Map<String, int>> results,
  }) {
    return TestResultControllerProvider(
      testId: testId,
      status: status,
      results: results,
    );
  }

  @override
  TestResultControllerProvider getProviderOverride(
    covariant TestResultControllerProvider provider,
  ) {
    return call(
      testId: provider.testId,
      status: provider.status,
      results: provider.results,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'testResultControllerProvider';
}

/// See also [testResultController].
class TestResultControllerProvider
    extends AutoDisposeFutureProvider<SubmittedResultResponseEntities?> {
  /// See also [testResultController].
  TestResultControllerProvider({
    required int testId,
    required String status,
    required List<Map<String, int>> results,
  }) : this._internal(
          (ref) => testResultController(
            ref as TestResultControllerRef,
            testId: testId,
            status: status,
            results: results,
          ),
          from: testResultControllerProvider,
          name: r'testResultControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$testResultControllerHash,
          dependencies: TestResultControllerFamily._dependencies,
          allTransitiveDependencies:
              TestResultControllerFamily._allTransitiveDependencies,
          testId: testId,
          status: status,
          results: results,
        );

  TestResultControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.testId,
    required this.status,
    required this.results,
  }) : super.internal();

  final int testId;
  final String status;
  final List<Map<String, int>> results;

  @override
  Override overrideWith(
    FutureOr<SubmittedResultResponseEntities?> Function(
            TestResultControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TestResultControllerProvider._internal(
        (ref) => create(ref as TestResultControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        testId: testId,
        status: status,
        results: results,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SubmittedResultResponseEntities?>
      createElement() {
    return _TestResultControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TestResultControllerProvider &&
        other.testId == testId &&
        other.status == status &&
        other.results == results;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, testId.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);
    hash = _SystemHash.combine(hash, results.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TestResultControllerRef
    on AutoDisposeFutureProviderRef<SubmittedResultResponseEntities?> {
  /// The parameter `testId` of this provider.
  int get testId;

  /// The parameter `status` of this provider.
  String get status;

  /// The parameter `results` of this provider.
  List<Map<String, int>> get results;
}

class _TestResultControllerProviderElement
    extends AutoDisposeFutureProviderElement<SubmittedResultResponseEntities?>
    with TestResultControllerRef {
  _TestResultControllerProviderElement(super.provider);

  @override
  int get testId => (origin as TestResultControllerProvider).testId;
  @override
  String get status => (origin as TestResultControllerProvider).status;
  @override
  List<Map<String, int>> get results =>
      (origin as TestResultControllerProvider).results;
}

String _$testResultContinueControllerHash() =>
    r'3dcafed9bbe51af88633aadd06733c72f8c0c367';

/// See also [testResultContinueController].
@ProviderFor(testResultContinueController)
const testResultContinueControllerProvider =
    TestResultContinueControllerFamily();

/// See also [testResultContinueController].
class TestResultContinueControllerFamily
    extends Family<AsyncValue<NoSubmittedDataResponseEntities?>> {
  /// See also [testResultContinueController].
  const TestResultContinueControllerFamily();

  /// See also [testResultContinueController].
  TestResultContinueControllerProvider call({
    required int testId,
    required String status,
    required List<Map<String, int>> results,
  }) {
    return TestResultContinueControllerProvider(
      testId: testId,
      status: status,
      results: results,
    );
  }

  @override
  TestResultContinueControllerProvider getProviderOverride(
    covariant TestResultContinueControllerProvider provider,
  ) {
    return call(
      testId: provider.testId,
      status: provider.status,
      results: provider.results,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'testResultContinueControllerProvider';
}

/// See also [testResultContinueController].
class TestResultContinueControllerProvider
    extends AutoDisposeFutureProvider<NoSubmittedDataResponseEntities?> {
  /// See also [testResultContinueController].
  TestResultContinueControllerProvider({
    required int testId,
    required String status,
    required List<Map<String, int>> results,
  }) : this._internal(
          (ref) => testResultContinueController(
            ref as TestResultContinueControllerRef,
            testId: testId,
            status: status,
            results: results,
          ),
          from: testResultContinueControllerProvider,
          name: r'testResultContinueControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$testResultContinueControllerHash,
          dependencies: TestResultContinueControllerFamily._dependencies,
          allTransitiveDependencies:
              TestResultContinueControllerFamily._allTransitiveDependencies,
          testId: testId,
          status: status,
          results: results,
        );

  TestResultContinueControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.testId,
    required this.status,
    required this.results,
  }) : super.internal();

  final int testId;
  final String status;
  final List<Map<String, int>> results;

  @override
  Override overrideWith(
    FutureOr<NoSubmittedDataResponseEntities?> Function(
            TestResultContinueControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TestResultContinueControllerProvider._internal(
        (ref) => create(ref as TestResultContinueControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        testId: testId,
        status: status,
        results: results,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<NoSubmittedDataResponseEntities?>
      createElement() {
    return _TestResultContinueControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TestResultContinueControllerProvider &&
        other.testId == testId &&
        other.status == status &&
        other.results == results;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, testId.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);
    hash = _SystemHash.combine(hash, results.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TestResultContinueControllerRef
    on AutoDisposeFutureProviderRef<NoSubmittedDataResponseEntities?> {
  /// The parameter `testId` of this provider.
  int get testId;

  /// The parameter `status` of this provider.
  String get status;

  /// The parameter `results` of this provider.
  List<Map<String, int>> get results;
}

class _TestResultContinueControllerProviderElement
    extends AutoDisposeFutureProviderElement<NoSubmittedDataResponseEntities?>
    with TestResultContinueControllerRef {
  _TestResultContinueControllerProviderElement(super.provider);

  @override
  int get testId => (origin as TestResultContinueControllerProvider).testId;
  @override
  String get status => (origin as TestResultContinueControllerProvider).status;
  @override
  List<Map<String, int>> get results =>
      (origin as TestResultContinueControllerProvider).results;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
