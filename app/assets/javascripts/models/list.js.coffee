class MyDashboard.Models.List extends Backbone.RelationalModel
  paramRooot: 'list'

  relations: [
    type: Backbone.HasMany,
    key: 'tasks',
    relatedModel: 'MyDashboard.Models.Task',
    collectionType: 'MyDashboard.Collections.Tasks',
    includeInJSON: false
    reverseRelation: 
      key: 'list_id',
      includeInJSON: 'id' 
  ]
