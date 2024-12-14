// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$answerListForQuestionControllerHash() =>
    r'00cc310f67388cc478963704cb6b4d8d07ae3285';

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

/// See also [answerListForQuestionController].
@ProviderFor(answerListForQuestionController)
const answerListForQuestionControllerProvider =
    AnswerListForQuestionControllerFamily();

/// See also [answerListForQuestionController].
class AnswerListForQuestionControllerFamily
    extends Family<AsyncValue<List<AnswerItem>?>> {
  /// See also [answerListForQuestionController].
  const AnswerListForQuestionControllerFamily();

  /// See also [answerListForQuestionController].
  AnswerListForQuestionControllerProvider call({
    required int index,
  }) {
    return AnswerListForQuestionControllerProvider(
      index: index,
    );
  }

  @override
  AnswerListForQuestionControllerProvider getProviderOverride(
    covariant AnswerListForQuestionControllerProvider provider,
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
  String? get name => r'answerListForQuestionControllerProvider';
}

/// See also [answerListForQuestionController].
class AnswerListForQuestionControllerProvider
    extends AutoDisposeFutureProvider<List<AnswerItem>?> {
  /// See also [answerListForQuestionController].
  AnswerListForQuestionControllerProvider({
    required int index,
  }) : this._internal(
          (ref) => answerListForQuestionController(
            ref as AnswerListForQuestionControllerRef,
            index: index,
          ),
          from: answerListForQuestionControllerProvider,
          name: r'answerListForQuestionControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$answerListForQuestionControllerHash,
          dependencies: AnswerListForQuestionControllerFamily._dependencies,
          allTransitiveDependencies:
              AnswerListForQuestionControllerFamily._allTransitiveDependencies,
          index: index,
        );

  AnswerListForQuestionControllerProvider._internal(
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
    FutureOr<List<AnswerItem>?> Function(
            AnswerListForQuestionControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnswerListForQuestionControllerProvider._internal(
        (ref) => create(ref as AnswerListForQuestionControllerRef),
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
  AutoDisposeFutureProviderElement<List<AnswerItem>?> createElement() {
    return _AnswerListForQuestionControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnswerListForQuestionControllerProvider &&
        other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AnswerListForQuestionControllerRef
    on AutoDisposeFutureProviderRef<List<AnswerItem>?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _AnswerListForQuestionControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<AnswerItem>?>
    with AnswerListForQuestionControllerRef {
  _AnswerListForQuestionControllerProviderElement(super.provider);

  @override
  int get index => (origin as AnswerListForQuestionControllerProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
