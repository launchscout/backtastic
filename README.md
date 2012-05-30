Backtastic
==========

Think formtastic meets backbone with some twitter bootstrap goodness.

I've extracted this code after building something similar on several backbone projects.  Most of the action right now happens in `Backtastic.Views.FormView`.  This view is designed to be as a superclass within your application and give you several bits of goodness:

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

