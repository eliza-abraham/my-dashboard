class MyDashboard.Routers.Dashboard extends Backbone.Router

  routes:
    ""              : "index"
    "/lists"        : "index"
    # "/tasks"        : "index"
    # "tasks/new"     : "new"
    # "tasks/:id"     : "show"
    # "tasks/:id/edit": "edit"

  initialize: -> 
    @collection =  new MyDashboard.Collections.Lists()
    @collection.fetch()

  index: ->
    console.log "in index retrieving lists"
    view = new MyDashboard.Views.ListIndex(collection: @collection)
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

  # show: (id) -> 
  #   alert "Task #{id}"
  #   # task = @collection.get(id)
  #   # view = new MyDashboard.Views.TasksShow({collection: task})

  # edit: (id) ->
  #   alert ("Editing #{id}")
  #   # task = @collection.get(id)
  #   # view = new MyDashboard.Views.TasksEdit({collection: task}) 