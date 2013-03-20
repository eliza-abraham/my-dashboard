class MyDashboard.Routers.Tasks extends Backbone.Router

  initialize: -> 
    @tasks =  new MyDashboard.Collections.Tasks()
    @tasks.fetch()

  routes:
    ""              : "index"
    "tasks/new"     : "new"
    "tasks/:id"     : "show"
    "tasks/:id/edit": "edit"

  index: ->
    view = new MyDashboard.Views.TasksIndex({collection: @tasks})
    $('#container').html(view.render().el)

  new: ->
    alert ("creating a new task")
    view = new MyDashboard.Views.TasksNew({collection: @tasks})

  show: (id) -> 
    alert "Task #{id}"
    #task = @tasks.get(id)
    #@tasks = new MyDashboard.Views.TasksShow({collection: task})

  edit: (id) ->
    alert ("Editing #{id}")
    #task = @tasks.get(id)
    #s@view = new MyDashboard.Views.TasksEdit({collection: task}) 