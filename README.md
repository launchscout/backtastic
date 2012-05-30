Backtastic
==========

Think formtastic meets backbone with some twitter bootstrap goodness.

I've extracted this code after building something similar on several backbone projects.  Most of the action right now happens in `Backtastic.Views.Formview`.  This view is designed to be as a superclass within your application and give you several bits of goodness:

* helpers to generate a form fields with twitter bootstrap compatible markup. So far textField, selectField, dateField
* save implementation which does the following
  * settings attributes for each form field on the model
  * saves the model and listens for errors
  * parses validation errors from rails and displays errors on individual fields