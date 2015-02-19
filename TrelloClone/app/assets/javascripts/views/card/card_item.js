TrelloClone.Views.CardItem = Backbone.View.extend({
  template: JST["card/card_item"],
  events: {
    "click .delete_card": "deleteCard"
  },

  render: function () {
    var content = this.template({card: this.model});
    this.$el.html(content);
    this.$el.addClass("card");
    this.$el.sortable();
    return this;
  },

  deleteCard: function (event) {
    event.preventDefault();
    var view = this;
    this.model.destroy({
      success: function(){
        view.collection.remove(view.model);
      }
    });
  }
});
