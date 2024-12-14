// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionListForTestControllerHash() =>
    r'a70348d26653c42d4befeb52b6e5b94b422a6bb7';

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

/// See also [questionListForTestController].
@ProviderFor(questionListForTestController)
const questionListForTestControllerProvider =
    QuestionListForTestControllerFamily();

/// See also [questionListForTestController].
class QuestionListForTestControllerFamily
    extends Family<AsyncValue<List<QuestionItem>?>> {
  /// See also [questionListForTestController].
  const QuestionListForTestControllerFamily();

  /// See also [questionListForTestController].
  QuestionListForTestControllerProvider call({
    required int index,
  }) {
    return QuestionListForTestControllerProvider(
      index: index,
    );
  }

  @override
  QuestionListForTestControllerProvider getProviderOverride(
    covariant QuestionListForTestControllerProvider provider,
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
  String? get name => r'questionListForTestControllerProvider';
}

/// See also [questionListForTestController].
class QuestionListForTestControllerProvider
    extends AutoDisposeFutureProvider<List<QuestionItem>?> {
  /// See also [questionListForTestController].
  QuestionListForTestControllerProvider({
    required int index,
  }) : this._internal(
          (ref) => questionListForTestController(
            ref as QuestionListForTestControllerRef,
            index: index,
          ),
          from: questionListForTestControllerProvider,
          name: r'questionListForTestControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questionListForTestControllerHash,
          dependencies: QuestionListForTestControllerFamily._dependencies,
          allTransitiveDependencies:
              QuestionListForTestControllerFamily._allTransitiveDependencies,
          index: index,
        );

  QuestionListForTestControllerProvider._internal(
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
    FutureOr<List<QuestionItem>?> Function(
            QuestionListForTestControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QuestionListForTestControllerProvider._internal(
        (ref) => create(ref as QuestionListForTestControllerRef),
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
  AutoDisposeFutureProviderElement<List<QuestionItem>?> createElement() {
    return _QuestionListForTestControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionListForTestControllerProvider &&
        other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuestionListForTestControllerRef
    on AutoDisposeFutureProviderRef<List<QuestionItem>?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _QuestionListForTestControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<QuestionItem>?>
    with QuestionListForTestControllerRef {
  _QuestionListForTestControllerProviderElement(super.provider);

  @override
  int get index => (origin as QuestionListForTestControllerProvider).index;
}

String _$question_selectedAnswerHash() =>
    r'a4b4136eb7f720e68ecfbbf43bf94712a829cc7f';

/// See also [Question_selectedAnswer].
@ProviderFor(Question_selectedAnswer)
final question_selectedAnswerProvider =
    AutoDisposeNotifierProvider<Question_selectedAnswer, int>.internal(
  Question_selectedAnswer.new,
  name: r'question_selectedAnswerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$question_selectedAnswerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Question_selectedAnswer = AutoDisposeNotifier<int>;
String _$nextQuestionHash() => r'3f2385001b11a691b04c0e804fdddf1e8ed89dd1';

/// See also [NextQuestion].
@ProviderFor(NextQuestion)
final nextQuestionProvider =
    AutoDisposeNotifierProvider<NextQuestion, int>.internal(
  NextQuestion.new,
  name: r'nextQuestionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nextQuestionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NextQuestion = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
