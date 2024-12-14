// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$testDetailControllerHash() =>
    r'2c7ab481270ef8d60bd52895b621ce9aefc658cc';

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

/// See also [testDetailController].
@ProviderFor(testDetailController)
const testDetailControllerProvider = TestDetailControllerFamily();

/// See also [testDetailController].
class TestDetailControllerFamily extends Family<AsyncValue<TestItem?>> {
  /// See also [testDetailController].
  const TestDetailControllerFamily();

  /// See also [testDetailController].
  TestDetailControllerProvider call({
    required int index,
  }) {
    return TestDetailControllerProvider(
      index: index,
    );
  }

  @override
  TestDetailControllerProvider getProviderOverride(
    covariant TestDetailControllerProvider provider,
  ) {
    return call(
      index: provider.index,
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
  String? get name => r'testDetailControllerProvider';
}

/// See also [testDetailController].
class TestDetailControllerProvider
    extends AutoDisposeFutureProvider<TestItem?> {
  /// See also [testDetailController].
  TestDetailControllerProvider({
    required int index,
  }) : this._internal(
          (ref) => testDetailController(
            ref as TestDetailControllerRef,
            index: index,
          ),
          from: testDetailControllerProvider,
          name: r'testDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$testDetailControllerHash,
          dependencies: TestDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              TestDetailControllerFamily._allTransitiveDependencies,
          index: index,
        );

  TestDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<TestItem?> Function(TestDetailControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TestDetailControllerProvider._internal(
        (ref) => create(ref as TestDetailControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TestItem?> createElement() {
    return _TestDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TestDetailControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TestDetailControllerRef on AutoDisposeFutureProviderRef<TestItem?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _TestDetailControllerProviderElement
    extends AutoDisposeFutureProviderElement<TestItem?>
    with TestDetailControllerRef {
  _TestDetailControllerProviderElement(super.provider);

  @override
  int get index => (origin as TestDetailControllerProvider).index;
}

String _$testExistControllerHash() =>
    r'7feb921b5fbf35827d2cc77b780e001277617833';

/// See also [testExistController].
@ProviderFor(testExistController)
const testExistControllerProvider = TestExistControllerFamily();

/// See also [testExistController].
class TestExistControllerFamily
    extends Family<AsyncValue<TestExistResponseEntity?>> {
  /// See also [testExistController].
  const TestExistControllerFamily();

  /// See also [testExistController].
  TestExistControllerProvider call({
    required int testId,
  }) {
    return TestExistControllerProvider(
      testId: testId,
    );
  }

  @override
  TestExistControllerProvider getProviderOverride(
    covariant TestExistControllerProvider provider,
  ) {
    return call(
      testId: provider.testId,
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
  String? get name => r'testExistControllerProvider';
}

/// See also [testExistController].
class TestExistControllerProvider
    extends AutoDisposeFutureProvider<TestExistResponseEntity?> {
  /// See also [testExistController].
  TestExistControllerProvider({
    required int testId,
  }) : this._internal(
          (ref) => testExistController(
            ref as TestExistControllerRef,
            testId: testId,
          ),
          from: testExistControllerProvider,
          name: r'testExistControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$testExistControllerHash,
          dependencies: TestExistControllerFamily._dependencies,
          allTransitiveDependencies:
              TestExistControllerFamily._allTransitiveDependencies,
          testId: testId,
        );

  TestExistControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.testId,
  }) : super.internal();

  final int testId;

  @override
  Override overrideWith(
    FutureOr<TestExistResponseEntity?> Function(TestExistControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TestExistControllerProvider._internal(
        (ref) => create(ref as TestExistControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        testId: testId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TestExistResponseEntity?> createElement() {
    return _TestExistControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TestExistControllerProvider && other.testId == testId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, testId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TestExistControllerRef
    on AutoDisposeFutureProviderRef<TestExistResponseEntity?> {
  /// The parameter `testId` of this provider.
  int get testId;
}

class _TestExistControllerProviderElement
    extends AutoDisposeFutureProviderElement<TestExistResponseEntity?>
    with TestExistControllerRef {
  _TestExistControllerProviderElement(super.provider);

  @override
  int get testId => (origin as TestExistControllerProvider).testId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
