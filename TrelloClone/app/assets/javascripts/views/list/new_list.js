TrelloClone.Views.NewListForm = Backbone.View.extend({
  template: JST["list/new_list"],
  tagName: 'form',
  events:{
    "submit": "createList"
  },

  initialize: function (options) {
    this.board = options.board;
    this.lists = options.lists
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  createList: function(event){
    event.preventDefault();
    var data = $(event.currentTarget).serializeJSON();
    var newList = new TrelloClone.Models.List();
    data.list.board_id = this.board.id;
    var view = this;
    newList.save(data, {
      success: function () {
        view.lists.add(newList);
      }
    })
  }

});
