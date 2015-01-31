TrelloClone.Views.BoardListItem = Backbone.View.extend({
  template: JST["board/board_list_item"],
  tagName: "li",
  events:{
    "click .delete": "deleteBoard"
  },

  deleteBoard: function (event) {
    event.preventDefault();
    var view = this;
    this.model.destroy({
      success: function () {
        view.collection.remove(view.model);
      }
    });
  }

});
