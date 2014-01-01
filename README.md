# Icofont

Provides a web interface to a large collection of free icon fonts, so that you can inlcude only the fonts you need in your application.

### Dependencies

Icofont depends on the awsome [fontcustom]() for building the fonts. Please check their README for instructions on how to install it.

### Installation

After installing fontcustom and its dependencies, add the gem to the Gemfile of your Rails app:

```ruby
gem 'icofont'
```

and run

```shell
bundle install
```

### Usage

**1.** Start by running the `icofont` generator, which will copy the SVG glyphs from the [icofont-glyphs] repository into your machine, usually at `~/.icofont/glyphs`:

```shell
rails generate icofont
```

**2.** Mount the `icofont` engine into your `routes.rb` file:

```ruby
if Rails.env.development?
  mount Icofont::Engine => "/icofont"
end
 ```

**3.** Now you can access the web interface of icofont at `/icofont` URL (e.g. `http://localhost:3000/icofont`). There you can select/unselect the glyphs you wish to be included on your font. Click on UPDATE to persist your changes, and create the font.

The class names can be found below the fonts. Once the font is created, the selected class names are ready to use, on your pages.

This way you will include the icons you need on your font.

### Licence

Icofont is licenced under MIT-LICENSE.