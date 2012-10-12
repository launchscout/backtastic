Backtastic
==========

Think formtastic meets backbone with some twitter bootstrap goodness.

At Gaslight we've built several rails apps with backbone and one of the more common complaints from new developers to this stuff is the lack of form helpery goodness that rails gives you.  This is our attempt to start filling this gap.  Most of the action right now happens in `Backtastic.Views.FormView`.  This view is designed to be as a superclass within your application and give you several bits of goodness:

* helpers to generate a form fields with twitter bootstrap compatible markup. So far textField, selectField, dateField
* default save implementation that updates the model from the form and persists
* handling validation errors from rails and displaying errors on individual fields
* composite views

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

The field helper method (`@textField()` in this example) creates a subview of the appropriate type which renders a label and form input using twitter bootstrap friendly markup.  They also listen to the model for validation errors and display appropriate styling and error messages.

Validation
----------

Backtastic supports both client side and server side validation. If you send back an error response with errors represented as jon, backtastic will decode the json and match up the error messages with fields.

As of 0.4, backtastic gives you a way to reflect (some) validations from rails models onto your backbone models. There is a rake task, backtastic:validations:build, which generates a coffeescript file that puts validation data from rails onto a Backtastic.Rails.validations. Then some where in your client side code, you can require this file and call Backtastic.applyValidations. See the example app code to understand better how all this fits together.

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


Shameless self-promotion
------------------------

If in-person training in all this is something that could help you or someone you know, we've [got you covered](http://training.gaslightsoftware.com).  Should you need help building a backbone rails app, we can [do that too](http://gaslightsoftware.com).






