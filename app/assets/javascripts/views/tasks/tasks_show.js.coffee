class MyDashboard.Views.TasksShow extends Backbone.View

  template: JST['tasks/show']
  tagName: 'tr'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('destroy', @leave, this)
  
  render: ->
    $(@el).html(@template(task: @model))
    @

  events: 
    'click #edit_task'     : 'editTask'
    'click #delete_task'   : 'deleteTask'

  deleteTask: (event) -> 
    console.log "delete task"
    event.preventDefault()
    answer = confirm("Are you sure you want to delete this element?");
    if(answer)
      @model.destroy({
        wait: true
        success: ->       
          console.log "task deleted successfully"
        error: ->
          console.log "could not delete this task"
          
      })
      @$el.remove()

  editTask: (event) ->
    event.preventDefault()
    attribute =  !@model.attributes.checked
    @model.save checked: attribute,
      wait: true
      success: ->
        console.log "updated successfully"
      error: ->
        console.log "did not update"

    