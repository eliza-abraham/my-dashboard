class MyDashboard.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  initialize: ->
    alert("tasks fetched are : #{@tasks}")
    @tasks.on('reset',@render, this)

  render: ->
    $(@el).html(@template(tasks: @tasks))
    this #@ in coffescript
