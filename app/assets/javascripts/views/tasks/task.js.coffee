class MyDashboard.Views.Task extends Backbone.View

  template: JST['tasks/task']
  tagName: 'tr'

  render: ->
    $(@el).html(@template(task: @model))
    @