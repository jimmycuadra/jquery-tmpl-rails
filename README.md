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

If the path to all of your templates have a common prefix that you prefer is not included in the template's name, you can set this option in `config/application.rb`:

```ruby
config.jquery_templates.prefix = "templates"
```

That would change the previous example to this:

```javascript
$.tmpl("author", { name: "Jimmy" }).appendTo("#author");
```

The prefix can also be a regular expression. For example, to use only the name of the file for the template name, regardless of directory structure:

```ruby
config.jquery_templates.prefix = %r{([^/]*/)*}
```

Happy templating!

## Acknowledgements

The Sprockets engine was originally derived from the [sprockets-jquery-tmpl](https://github.com/rdy/sprockets-jquery-tmpl) gem. If you want a similar mechanism for use outside of Rails, take a look at this project.
