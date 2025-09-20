part of '../imports/view_imports.dart';

class _ViewAllExpnsesBody extends StatefulWidget {
  const _ViewAllExpnsesBody();

  @override
  State<_ViewAllExpnsesBody> createState() => _ViewAllExpnsesBodyState();
}

class _ViewAllExpnsesBodyState extends State<_ViewAllExpnsesBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent * 0.8) {
      _loadMoreData();
    }
  }

  void _loadMoreData() {
    final bloc = context.read<BalanceBloc>();
    final state = bloc.state;

    if (!state.baseStatus.isLoadingMore && !state.hasReachedMax) {
      bloc.add(FetchBalanceEvent(
        filter: state.filter ?? DropDownModel.initial(),
        page: state.page + 1,
        pageSize: ConstantManager.paginationPageSize,
      ));
    }
  }

  Future<void> _refreshData() async {
    final bloc = context.read<BalanceBloc>();
    bloc.add(FetchBalanceEvent(
      page: 0,
      pageSize: ConstantManager.paginationPageSize,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: LocaleKeys.allExpenses,
      body: BlocConsumer<BalanceBloc, BalanceState>(
        listener: (context, state) {
          if (state.baseStatus == BaseStatus.error) {
            MessageUtils.showSnackBar(LocaleKeys.exceptionError);
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: _buildBody(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BalanceState state) {
    // Initial full-screen loader
    if (state.baseStatus == BaseStatus.loading && state.page == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(radius: 16),
            const SizedBox(height: 10),
            Text(
              "${LocaleKeys.loadingExpenses}...",
              style: const TextStyle().setBlackColor.s13.medium,
            ),
          ],
        ),
      );
    }

    if (state.baseStatus == BaseStatus.error && state.page == 0) {
      return ErrorView(error: LocaleKeys.exceptionError);
    }

    if (state.balanceEntity.expenses.isEmpty) {
      return const NotContainData();
    }

    // List with bottom loader for pagination
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.pH12,
        vertical: AppPadding.pH8,
      ),
      itemCount: state.balanceEntity.expenses.length +
          (state.baseStatus.isLoadingMore ? 1 : 0) +
          (state.hasReachedMax ? 1 : 0),
      itemBuilder: (context, index) {
        final expenses = state.balanceEntity.expenses;

        if (index < expenses.length) {
          return ExpensesCardWidget(expenses[index]);
        }

        if (state.baseStatus.isLoadingMore) {
          return Container(
            padding: EdgeInsets.all(AppPadding.pH16),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(radius: 12),
                  SizedBox(width: 8),
                  Text('Loading more...'),
                ],
              ),
            ),
          );
        }

        if (state.hasReachedMax) {
          return Container(
            padding: EdgeInsets.all(AppPadding.pH16),
            child: const Center(
              child: Text(
                'No more expenses to load',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
