window.MyDashboard =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new MyDashboard.Routers.Tasks()
    Backbone.history.start()

$(document).ready ->
  MyDashboard.init()
 