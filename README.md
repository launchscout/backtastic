Backtastic
==========

Think formtastic meets backbone with some twitter bootstrap goodness.

At Gaslight we've built several rails apps with backbone and one of the more common complaints from new developers to this stuff is the lack of form helpery goodness that rails gives you.  This is our attempt to start filling this gap.  Most of the action right now happens in `Backtastic.Views.FormView`.  This view is designed to be as a superclass within your application and give you several bits of goodness:

* helpers to generate a form fields with twitter bootstrap compatible markup. So far textField, selectField, dateField
* save implementation which does the following
  * settings attributes for each form field on the model
  * saves the model and listens for errors
  * parses validation errors from rails and displays errors on individual fields

Usage
-----

To get started, add it to your Gemfile:

    gem "backtastic"
    
Then, somewhere in your manifest, require it:

    #= require "backtastic"
    
Next, you'll create a view that is a subclass of Backtastic.Views.FormView

    class EditPersonView extends Backtastic.Views.FormView
      
      template: JST["edit_person_view_tempate"]

Backtastic provides a render method that will invoke your template with the view itself as the template context.  This means methods from the FormView are available for use in your templates, and this is how the form field helpers work.

    %form
      = @textField(label: "Name", field: "Name")
      
Example App
-----------

The best way to learn how to use backtastic is to spend some time checking out the example app.  Clone this repo and look in the example subdirectory.  To get it at running should be as simple as:

    bundle install
    rake db:migrate
    bundle exec rails s
    
Point your browser at localhost:3000. But then you probably knew that already

Running specs
-------------

The specs for backtastic are in the example as well so I can take advantage of the asset pipeline in my specs.  To run them, do:

    rake jasminerice:run
    
Future plans
------------

I'd like to have some metadata generated form rails and available to backbone so you could do something more formtasticy like:

    @form fields["first_name", "last_name"]
    
Also, it seems like making client side validation happen when appropriate would be nice.  And I'd like to refactor the way FormView deals with rails validation errors, sooner rather than later probably.

Shameless self-promotion
------------------------

If in-person training in all this is something that could help you or someone you know, we've [got you covered](http://training.gaslightsoftware.com).  Should you need help building a backbone rails app, we can [do that too](http://gaslightsoftware.com).

    




