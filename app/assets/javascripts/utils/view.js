Backbone.View.prototype.render = function () {
  var content = this.template({board: this.model});
  this.$el.html(content);
  return this;
}

Backbone.View.prototype.onRender = function (){
  
}
