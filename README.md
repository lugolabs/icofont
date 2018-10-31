# Icofont

Provides a web interface to over 450 free icon fonts, so that you can inlcude only the fonts you need in your application.


### Dependencies

Icofont depends on the awsome [fontcustom](https://github.com/FontCustom/fontcustom) for building the fonts. Please check their README for instructions on how to install it.


### Installation

After installing fontcustom's dependencies, add the gem to the Gemfile of your Rails app:

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

The generator will also mount the `icofont` engine by injecting the following line into your `routes.rb` file:

```ruby
mount_icofont
 ```

Now you can access the web interface of icofont at `/icofont` URL (e.g. `http://localhost:3000/icofont`). There you can select/unselect the glyphs you wish to be included on your font. Click on UPDATE to persist your changes, and create the font.

The class names can be found below the fonts.

The names of the fonts used are saved in the `[rails_root]/.icofont/icofont.txt` file, which was generated and added to your git repository automatically by the generator.

**2.** Include `icofont.css.erb` in your `application.css` file:

```css
*= require icofont
```

Once the font is created, the selected class names are ready to use on your views.

This way you will include _only_ the icons you need on your font.


### Licence

Icofont is licenced under MIT-LICENSE.
