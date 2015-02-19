TrelloClone.Views.ListItem = Backbone.CompositeView.extend({
  template: JST["list/list_item"],
  events: {
    "click h3": "showDelete",
    "click .delete": "newCard",
    "click .cancel": "unshowDelete",
    "click button": "newCard"
  },

  initialize: function (options) {
    this.listenTo(this.model.cards(), "remove", this.removeCard);
    this.listenTo(this.model.cards(), "add", this.addCard);

  },

  unshowDelete: function(){
    this.$(".delete_list").css("display", "none")
  },

  showDelete: function(){
    this.$(".delete_list").css("display", "block")
  },

  newCard: function () {
    var newCard = new TrelloClone.Views.NewCard();
    this.addSubview("body", newCard);
  },

  addCard: function (card) {
    var cardItem = new TrelloClone.Views.CardItem({
      model: card,
      collection: this.model.cards()
    });

    this.addSubview(".cards", cardItem);
  },

  removeCard: function (card) {
    var view = this;
    this.subviews(".cards").forEach( function(subview){
      if (subview.model == card) {
        view.removeSubview(".cards", subview);
      }
    });
  },

  onRender: function() {
    this.$(".cards").sortable();
  },


  render: function () {
    var content = this.template({list: this.model});
    this.$el.html(content);
    this.$el.addClass("list_item");
    this.model.cards().each(this.addCard.bind(this));
    return this;
  },

  deleteList: function(event){
    event.preventDefault();
    var view = this;
    this.model.destroy({
      success: function(){
        view.collection.remove(view.movel);
      }
    });
  }
})
