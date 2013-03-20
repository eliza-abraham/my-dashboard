class MyDashboard.Collections.Tasks extends Backbone.Collection
  url: '/api/tasks' # REST interface
  model: MyDashboard.Models.Task
