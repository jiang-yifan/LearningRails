TrelloClone.Views.BoardShow = Backbone.CompositeView.extend({
  template: JST["board/board_show"],

  initialize: function(options){

    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.lists(), "add", this.addList);
    this.listenTo(this.model.lists(), "remove", this.removeList);
    this.model.lists().each(this.addList.bind(this));


    var newList = new TrelloClone.Views.NewListForm({
      board: this.model,
      lists: this.model.lists()
    });

    this.addSubview("#new_list", newList)
  },

  addList: function (list) {
    var listItem = new TrelloClone.Views.ListItem({
      model: list,
      collection: this.model.lists()
    });

    this.addSubview("#list", listItem);
  },

  removeList: function (list) {
    var view = this;
    this.subviews("#list").forEach( function(subview){
      if (subview.model == list) {
        view.removeSubview("#list", subview);
      }
    });
  },

  render: function () {
    var content = this.template({board: this.model});
    this.$el.html(content);
    this.attachSubviews();
    this.onRender();
    this.$("#list").sortable();
    return this

  }

});
