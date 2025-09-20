import 'package:flutter_base/src/core/shared/base_state.dart';
import 'package:flutter_base/src/features/logic/main_tab/models/balance_entity.dart' show BalanceEntity;
import 'package:flutter_base/src/features/logic/main_tab/presentation/imports/view_imports.dart';
import 'package:flutter_test/flutter_test.dart';
 
void main() {
  group('BalanceBloc Unit Tests', () {
    late BalanceBloc balanceBloc;

    setUp(() {
      balanceBloc = BalanceBloc();
    });

    tearDown(() {
      balanceBloc.close();
    });

    test('initial state should be BalanceState.initial()', () {
      expect(balanceBloc.state, equals(BalanceState.initial()));
    });

    group('FetchBalanceEvent', () {
      test('should emit loading then success when data is fetched', () async {
        await expectLater(
          balanceBloc.stream,
          emitsInOrder([
            BalanceState(
              balanceEntity: BalanceEntity.initial(),
              baseStatus: BaseStatus.loading,
            ),
            BalanceState(
              balanceEntity: BalanceEntity.initial(),
              baseStatus: BaseStatus.success,
            ),
          ]),
        );

        balanceBloc.add(FetchBalanceEvent());
      });

      test('should emit error when data fetch fails', () async {
        await expectLater(
          balanceBloc.stream,
          emitsInOrder([
            BalanceState(
              balanceEntity: BalanceEntity.initial(),
              baseStatus: BaseStatus.loading,
            ),
            BalanceState(
              balanceEntity: BalanceEntity.initial(),
              baseStatus: BaseStatus.error,
            ),
          ]),
        );

        balanceBloc.add(FetchBalanceEvent());
      });
    });

    group('InitInitialBalanceEvent', () {
      test('should initialize balance if not exists', () async {

        await expectLater(
          balanceBloc.stream,
          emitsInOrder([
            BalanceState(
              balanceEntity: BalanceEntity.initial(),
              baseStatus: BaseStatus.initial,
            ),
          ]),
        );

        balanceBloc.add(InitInitialBalanceEvent());
      });
    });

    group('BalanceState', () {
      test('should support equality', () {
        final state1 = BalanceState(
          balanceEntity: BalanceEntity.initial(),
          baseStatus: BaseStatus.initial,
        );
        final state2 = BalanceState(
          balanceEntity: BalanceEntity.initial(),
          baseStatus: BaseStatus.initial,
        );
        final state3 = BalanceState(
          balanceEntity: BalanceEntity.initial(),
          baseStatus: BaseStatus.loading,
        );

        expect(state1, equals(state2));
        expect(state1, isNot(equals(state3)));
      });

      test('should support copyWith', () {
        final initialState = BalanceState(
          balanceEntity: BalanceEntity.initial(),
          baseStatus: BaseStatus.initial,
        );

        final newState = initialState.copyWith(
          baseStatus: BaseStatus.loading,
          page: 1,
        );

        expect(newState.baseStatus, equals(BaseStatus.loading));
        expect(newState.page, equals(1));
        expect(newState.balanceEntity, equals(BalanceEntity.initial()));
      });
    });
  });
}
