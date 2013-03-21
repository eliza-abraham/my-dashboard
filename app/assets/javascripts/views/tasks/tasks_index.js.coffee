class MyDashboard.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  events: 
  	"submit #new_task" : 'createTask'
    # "submit #task_done" : ''

  initialize: ->
    @collection.on('reset',@render,this)
    @collection.on('add',@render,this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTask)
    @

  appendTask: (task) ->
    view = new MyDashboard.Views.Task(model: task)
    $('#tasks').append(view.render().el)

  createTask: (event) ->
    event.preventDefault()
    attributes = {name: $('#new_task_name').val(), description: $('#new_task_description').val(), checked: false }
    @collection.create attributes,
      wait: true,
      success: -> $('#new_task')[0].reset(),
      error: @handleError
  
  handleError: (task, response) -> 
    if response.status == 422
      errors = response.responseText
      alert errors