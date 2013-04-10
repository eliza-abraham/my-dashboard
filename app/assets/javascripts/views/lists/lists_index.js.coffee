MyDashboard.Views.Lists ||= {}

class MyDashboard.Views.ListsIndex extends Backbone.View

  template: JST['lists/index']

  initialize: -> 
    @collection.on('reset',@render,this)
    # @model.on('change', @render, this)
    # @model.on('destroy', @leave, this)

  render: ->
    $(@el).html(@template(lists: @collection))
    @

  # events: 
  #   'click #edit_list'     : 'editList'
  #   'click #delete_list'   : 'deleteTask'

