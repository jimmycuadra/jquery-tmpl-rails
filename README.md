[![endorse](http://api.coderwall.com/jimmycuadra/endorsecount.png)](http://coderwall.com/jimmycuadra)

# jquery-tmpl-rails

This gem adds the jQuery Templates plugin and a corresponding Sprockets engine to the asset pipeline in Rails >= 3.1 applications.

## Installation

Add it to your Gemfile and run `bundle`.

## Usage

jQuery templates will be recognized by Sprockets with the `.tmpl` extension. Place them anywhere in the Sprockets load path.

```html
<!-- app/assets/javascripts/templates/author.tmpl -->
<div class="author">${name}</div>
```

In your application's JavaScript manifest file, require the jQuery Templates plugin followed by your templates. The templates are compiled and named with their Sprockets logical path:

```javascript
//= require jquery-tmpl
//= require_tree ./templates

$.tmpl("templates/author", { name: "Jimmy" }).appendTo("#author");
```

## Configuration

If the path to all of your templates have a common prefix that you prefer is not included in the template's name, you can set this option in an initializer such as `config/initializers/jquery_templates.rb`:

```ruby
JqueryTmplRails.configure do |config|
  config.prefix = "templates"
end
```

That would change the previous example to this:

```javascript
$.tmpl("author", { name: "Jimmy" }).appendTo("#author");
```

Note: If you want to use only the name of your file for the template name, you can do so:

```ruby
JqueryTmplRails.configure do |config|
  config.prefix = /([^\/]*\/)*/
end
```

Happy templating!

## Acknowledgements

The Sprockets engine was originally derived from the [sprockets-jquery-tmpl](https://github.com/rdy/sprockets-jquery-tmpl) gem. If you want a similar mechanism for use outside of Rails, take a look at this project.
