import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/models/business.dart';
import 'package:trible/providers/sort.dart';
import 'package:trible/providers/businesses.dart';
import 'package:trible/repositories/businesses.dart';
import 'package:uuid/uuid.dart';

class _BusinessRepositoryImplDummy implements BusinessesRepository {
  List<Business> inMemoryBusinessList = [];

  @override
  Future<List<Business>> getBusinessList() async {
    return inMemoryBusinessList;
  }

  @override
  Future<void> saveBusinessList(List<Business> businessList) async {
    inMemoryBusinessList = businessList;
  }

  @override
  Future<Business> addBusiness(Business business) async {
    inMemoryBusinessList.add(business);
    return business.copyWith(id: const Uuid().v4());
  }

  @override
  Future<void> deleteBusiness(String businessId) async {
    inMemoryBusinessList.removeWhere((business) => business.id == businessId);
  }

  @override
  Future<Business?> getBusinessById(String businessId) async {
    try {
      return inMemoryBusinessList.firstWhere(
        (business) => business.id == businessId,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> updateBusiness(Business business) async {
    final index = inMemoryBusinessList.indexWhere((b) => b.id == business.id);
    if (index != -1) {
      inMemoryBusinessList[index] = business;
    }
  }
}

void main() {
  group('test ViewController behaviors:', () {
    final container = ProviderContainer(
      overrides: [
        /* businessesRepo.overrideWith(
          Provider.autoDispose<BusinessesRepository>((ref) => BusinessesRepository()),
        ) */
      ],
    );
    test('initial value of business list is null', () async {
      expect(container.read(businessesProvider), []);
    });

    test('initial load is empty array', () async {
      await container.read(businessesProvider.notifier).build();
      expect(container.read(businessesProvider), []);
    });

    /* test('add first business', () async {
      await container.read(businessesProvider.notifier)
        ..addBusiness(Business(
          id: const Uuid().v4(),
          name: TextEditingController(text: 'First Business').text,
          isActive: true,
        ));
      expect(container.read(businessesProvider)![0].name, 'First Business');
    }); */

    /* test('add second business', () async {
      await container.read(businessesProvider.notifier)
        ..addBusiness(Business(
          id: const Uuid().v4(),
          name: TextEditingController(text: 'Second Business').text,
          isActive: true,
        ));
      expect(container.read(sortedBusinessesProvider)![1].name, 'Second Business');
    }); */

    /* test('toggle status', () async {
      final Business firstBusiness = container.read(sortedBusinessesProvider)![0];
      await container.read(businessesProvider.notifier)
        ..toggle(firstBusiness.id);
      expect(container.read(sortedBusinessesProvider)![0].isActive, false);
    }); */

    /* test('change sort order', () async {
      container.read(sortProvider.notifier).state = SortOrder.ASC;
      expect(container.read(sortedBusinessesProvider)![0].name, 'Second Business');
    });

    test('dispose', () async {
      container.read(businessesProvider.notifier).build();
      expect(container.read(sortedBusinessesProvider), []);
    }); */
  });
}
