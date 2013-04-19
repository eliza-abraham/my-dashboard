<h1>My ToDo List</h1>

<p>This is a simple app that demostrate a CRUD with Backbone JS and Rails. </p>
<hr>
<h3>Getting Started</h3>
<div>
  <p>To run this project run the following command on your terminals</p>
  <ul>
    <li>
      1. Clone the project from github:<br/>
      $ git clone git@github.com:eliza-abraham/my-dashboard.git
    </li>
    <li>
      2. Move to the project folder:<br>
      $ cd my-dashboard
    </li>
    <li>
      3. Install the gems required for the project:<br>
      $ bundle install
    </li>
    <li>
      4. Create your database.yaml file for your database setup which lies in /config
    </li>
    <li>
      5. Create your database:<br>
      $ rake db:create
    </li>
    <li>
      6. Create all your tables by running the migrations<br>
      $ rake db:migrate
    </li>
    <li>
      7. Run the server<br>
      $ rails s <- If you are using the default rails server
    </li>
  </ul>
  <p>You can also view the running application on: 
    <a href="http://my-dashboard.herokuapp.com/">my-dashboard.herokuapp.com/</a>
  </p>
</div>
<br>
Understanding Backbone while working on Rails.

Backbone JS provides us with the benefit of working on the client side via Model Objects. This helps in un-tying our data from the DOM.

In our normal Rails Apps we create various js files for all our methods in which we need to update our DOM elements as and when our object state changes. To avoid this distributed code, Backbone provides us with a structure so that we can directly work with objects by using the benefit of events that occur on these objects.


Some important Components of Backbone:-

EVENTS

Everything in Backbone JS works on the basis of objects and the events bound to these objects.

Syntax:
<object>.on(<event>, <callback>, <context>)

Example:
model.on('change', this.render, this)


MODEL

It contains the logic and a set of functionality for managing changes. To create a model class we need to extend the Backbone.Model class 

Example:
class MyDashboard.Models.Task extends Backbone.Model
  defaults: 
    checked: false


COLLECTION

Collections are an ordered set of models, as the name suggests a collection of models. When an event is triggered on the model, the event is triggered to the collection to which the model belongs to as well. To create a collection class we need to extend the Backbone.Collection class.

Example: 
class MyDashboard.Collections.Tasks extends Backbone.Collection
  url: '/tasks' # REST interface
  model: MyDashboard.Models.Task


ROUTER

The router is a link between the events and the pages that need to be rendered. It provides methods to route pages and connects them to actions and events. To create a router class we need to extend the Backbone.Router

Example:
class MyDashboard.Routers.Tasks extends Backbone.Router

  routes:
    ""              : "index"
    "/tasks"        : "index"

  initialize: -> 
    @collection =  new MyDashboard.Collections.Tasks()
    @collection.fetch()

  index: ->
    view = new MyDashboard.Views.TasksIndex(collection: @collection)
    $('#container > .well').html(view.render().el)

VIEW

As one may assume, the view has nothing to with HTML or CSS. It is more of a convention than code. It organises your interface into logical views backed by models. These views can be updated as and when some event occurs and changes are made to the model without having to re-render the entire page.


Important objects and methods in views

el  => view.el
All views have a DOM element at all times (the el property). View can be rendered or inserted in to the dom  with this.  this.el is created from the tagName, className, id and attributes property.


$el => view.$el
A cached jQuery object for the view's element. A handy reference instead of re-wrapping the DOM element all the time.


render() => view.render()
It renders the view template from model data, and updates this.el with the new HTML

render: function() {
   this.$el.html(this.template(this.model.attributes));
   return this;
 }


@collection 
It is a collection of all the tasks passed on to the view from the router where all the tasks where fetched.


@model
It refers to the object on which the event occurs or changes take place on.


Example:
class MyDashboard.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  events: 
  	"submit #new_task"   : 'createTask'

  initialize: ->
    @collection.on('reset',@render,this)
    @collection.on('add',@render,this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTask)
    @

  appendTask: (task) ->
    view = new MyDashboard.Views.TasksShow(model: task)
    $('#tasks').append(view.render().el)

  createTask: (event) ->
    event.preventDefault()
    attributes = {name: $('#new_task_name').val(), description: $('#new_task_description').val() }
    @collection.create attributes,
      wait: true,
      success: -> $('#new_task')[0].reset(),
      error: @handleError

  handleError: (task, response) -> 
    if response.status == 422
      errors = response.responseText
      alert errors
<br>
<h3>References</h3>
<ul>
  <li><a href="http://backbonejs.org/">Backbone JS Documentation</a></li>
  <li>
    Railscasts
    <a href="http://railscasts.com/episodes/323-backbone-on-rails-part-1">Railscasts Part 1</a><br>
    <a href="http://railscasts.com/episodes/325-backbone-on-rails-part-2">Railscasts Part 2</a>
  </li>
  <li>
    <a href="https://github.com/ikido/backbone-rails-crud-example-app">CRUD in backbone + rails 3</a>    
  </li>  
  <li>
    <a href="https://github.com/mulderp/Backbone-on-Rails-todoDemo">TODO Demo</a>
  </li>
</ul>
