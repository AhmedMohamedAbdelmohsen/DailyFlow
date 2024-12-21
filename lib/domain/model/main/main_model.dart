class MainModel {
  MetaModel? meta;
  MessageModel? message;

  MainModel(
    this.meta,
    this.message,
  );
}

class MetaModel {
  num pageCount;
  num totalItemCount;
  num pageNumber;
  num pageSize;
  bool hasPreviousPage;
  bool hasNextPage;
  bool isFirstPage;
  bool isLastPage;
  num firstItemOnPage;
  num lastItemOnPage;

  MetaModel(
    this.pageCount,
    this.totalItemCount,
    this.pageNumber,
    this.pageSize,
    this.hasPreviousPage,
    this.hasNextPage,
    this.isFirstPage,
    this.isLastPage,
    this.firstItemOnPage,
    this.lastItemOnPage,
  );
}

class MessageModel {
  num messageType;
  String messageTypeName;
  List<MessageItemModel>? messages;

  MessageModel(
    this.messageType,
    this.messageTypeName,
    this.messages,
  );
}

class MessageItemModel {
  num code;
  String message;

  MessageItemModel(
    this.code,
    this.message,
  );
}

