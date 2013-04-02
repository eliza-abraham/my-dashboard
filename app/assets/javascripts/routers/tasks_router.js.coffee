class MyDashboard.Routers.Tasks extends Backbone.Router

  routes:
    ""              : "index"
    "tasks/"        : "index"
    # "tasks/new"     : "new"
    # "tasks/:id"     : "show"
    # "tasks/:id/edit": "edit"

  initialize: -> 
    @collection =  new MyDashboard.Collections.Tasks()
    @collection.fetch()

  index: ->
    view = new MyDashboard.Views.TasksIndex(collection: @collection)
    $('#container > .well').html(view.render().el)

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