class MyDashboard.Routers.Lists extends Backbone.Router

  routes:
    ""              : "index"
    "/lists"        : "index"
    # "lists/new"     : "new"
    "lists/:id"     : "show"
    # "lists/:id/edit": "edit"

  initialize: -> 
    @lists = new MyDashboard.Collections.Lists()
    # @lists.reset($('#lists').data('lists'))
    @lists.fetch()

  index: ->
    view = new MyDashboard.Views.ListsIndex(collection: @lists)
    $('#container > .well').html(view.render().el)
  
  # index: ->
  #   console.log "in tasks"
  #   @collection =  new MyDashboard.Collections.Tasks()
  #   @collection.fetch()
  #   view = new MyDashboard.Views.TasksIndex(collection: @collection)
  #   $('#container > .well').html(view.render().el)
  
  # new: ->
  #   alert ("creating a new task")
  #   # view = new MyDashboard.Views.TasksNew(collection: @collection)

  show: (id) -> 
    list = @lists.get(id)
    view = new MyDashboard.Views.ListsShow(model: list)
    $('#container > .well').html(view.render().el)

  # edit: (id) ->
  #   alert ("Editing #{id}")
  #   # task = @collection.get(id)
  #   # view = new MyDashboard.Views.TasksEdit({collection: task}) 