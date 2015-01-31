TrelloClone.Views.NewCard = Backbone.View.extend({
  template: JST["card/new_card"],

  render: function(){
    var content = this.template();
    this.$el.html(content);
    return this;
  }

})
