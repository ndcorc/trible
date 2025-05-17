// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$promotionHash() => r'174bd5bd164c3ff752693740bc93f0a563e85fb5';

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

/// See also [promotion].
@ProviderFor(promotion)
const promotionProvider = PromotionFamily();

/// See also [promotion].
class PromotionFamily extends Family<AsyncValue<Promotion>> {
  /// See also [promotion].
  const PromotionFamily();

  /// See also [promotion].
  PromotionProvider call(String promotionId) {
    return PromotionProvider(promotionId);
  }

  @override
  PromotionProvider getProviderOverride(covariant PromotionProvider provider) {
    return call(provider.promotionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'promotionProvider';
}

/// See also [promotion].
class PromotionProvider extends AutoDisposeFutureProvider<Promotion> {
  /// See also [promotion].
  PromotionProvider(String promotionId)
    : this._internal(
        (ref) => promotion(ref as PromotionRef, promotionId),
        from: promotionProvider,
        name: r'promotionProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$promotionHash,
        dependencies: PromotionFamily._dependencies,
        allTransitiveDependencies: PromotionFamily._allTransitiveDependencies,
        promotionId: promotionId,
      );

  PromotionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.promotionId,
  }) : super.internal();

  final String promotionId;

  @override
  Override overrideWith(
    FutureOr<Promotion> Function(PromotionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PromotionProvider._internal(
        (ref) => create(ref as PromotionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        promotionId: promotionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Promotion> createElement() {
    return _PromotionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PromotionProvider && other.promotionId == promotionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, promotionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PromotionRef on AutoDisposeFutureProviderRef<Promotion> {
  /// The parameter `promotionId` of this provider.
  String get promotionId;
}

class _PromotionProviderElement
    extends AutoDisposeFutureProviderElement<Promotion>
    with PromotionRef {
  _PromotionProviderElement(super.provider);

  @override
  String get promotionId => (origin as PromotionProvider).promotionId;
}

String _$promotionsHash() => r'36a75464b8f683cfe0610ad688a797e6a153d45c';

/// See also [Promotions].
@ProviderFor(Promotions)
final promotionsProvider =
    AutoDisposeAsyncNotifierProvider<Promotions, List<Promotion>>.internal(
      Promotions.new,
      name: r'promotionsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$promotionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Promotions = AutoDisposeAsyncNotifier<List<Promotion>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
