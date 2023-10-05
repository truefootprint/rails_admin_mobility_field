# RailsAdminMobilityField

An addapted version of [rails_admin_globalize_field] https://github.com/scarfaceDeb/rails_admin_globalize_field

RailsAdminMobilityField adds tabbed interface to [rails_admin](https://github.com/sferik/rails_admin) for multilingual models (using [mobility](https://github.com/shioyama/mobility/) gem)

It adds custom field type that you can use for mobility's translations association.


## Installation

Add and configure mobility first.

``` ruby
  gem 'mobility', '1.3.0.rc1'
```

The known compatible Mobility configuration 
So far tested only with jsonb fields.
Durring the implenetation I've discovered a bug in mobility. If a field's specific translation was missing, any attempt to set or access the value with {field}_{locale} was returning missing_method. With version 1.3.0.rc1 it works correctly: returns nil if translation is not defined and allows to set it.

``` ruby
  plugins do
    backend :jsonb
    reader                             # Explicitly declare readers,
    writer                             # writers, and
    backend_reader                     # backend reader (post.title_backend, etc).

    active_record

    query                              # i18n is the default scope
    cache                              # previously implicit
    fallbacks
    presence                           # previously implicit
    default
    attribute_methods

    # locale_accessors I18n.available_locales
    fallthrough_accessors
  end
```

Add this gem and run `bundle`.

``` ruby
  gem 'rails_admin_mobility_field' 
```


## Usage

> Don't forget to set I18n.available_locale, because it uses that to determine what tabs to show

Add configuration to your **translated** model and associated **translation** model. `:locale` field is always required.
``` ruby
  config.model 'Post' do
    field :text, :mobility_tabs
  end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
