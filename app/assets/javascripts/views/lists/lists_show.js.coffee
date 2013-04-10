MyDashboard.Views.ListsShow ||= {}

class MyDashboard.Views.ListsShow extends Backbone.View

  template: JST['lists/show']

  initialize: ->
    console.log "show => init"
    console.log @model

  render: ->
    $(@el).html(@template(list: @model))
    @

  # fetchTasks: (list) -> 
    # tasks_view = new MyDashboard.Views.TasksIndex(tasks: list.get('tasks'))
    # @$el.$("#tasks").html(tasks_view.render().el)