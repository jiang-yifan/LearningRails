TrelloClone.Views.BoardIndex = Backbone.CompositeView.extend({
  template: JST["board/boards_list"],

  initialize: function(model, options){
    this.collection = options.collection;
    this.listenTo(this.collection, "add", this.addBoard);
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "remove", this.removeBoard);
  },

  addBoard: function(){

  },

  render: function () {
    var content = this.template({boards: this.collection});
    this.$el.html(content);
    var view = this;
    this.collection.each(function(model){
      var boardListItem = new TrelloClone.Views.BoardListItem({model: model,
         collection: this.collection});

      view.addSubview("ul", boardListItem);
    }, this);

    var newBoardForm = new TrelloClone.Views.NewBoardForm({collection: this.collection});
    view.addSubview("#new_board", newBoardForm);

    return this;
  }

});
