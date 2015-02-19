TrelloClone.Views.NewBoardForm = Backbone.View.extend({
  template: JST["board/new_board"],
  tagName: "form",
  events: {
    "submit": "createBoard"
  },

  render: function () {
    var content = this.template({board: this.model});
    this.$el.html(content);
    return this;
  },

  createBoard: function(event){
    event.preventDefault();
    var data = $(event.currentTarget).serializeJSON();
    var newBoard = new TrelloClone.Models.Board(data);
    var view = this;
    newBoard.save({},{
      success: function () {
        view.collection.add(newBoard);
        Backbone.history.navigate("#boards/"+newBoard.id)
      }
    });
  }


});
