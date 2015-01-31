TrelloClone.Routers.TrelloRouter = Backbone.Router.extend({
  routes:{
    "": "boardIndex",
    "boards/:id": "boardShow"
  },

  initialize: function(options){
    this.$rootEl = options.$rootEl
    this.collection = new TrelloClone.Collections.Boards();
  },

  boardIndex: function () {
    var boardIndex = new TrelloClone.Views.BoardIndex({}, {
      collection: this.collection
    });
    this.collection.fetch();
    this._swapView(boardIndex);
  },

  boardShow: function(id){
    var board = this.collection.getOrFetch(id);
    var boardShow = new TrelloClone.Views.BoardShow({model: board});
    this._swapView(boardShow)
  },

  _swapView: function (newView) {
    this.currentView && this.currentView.remove();
    this.currentView = newView;

    this.$rootEl.append(newView.render().$el);
  }

});
