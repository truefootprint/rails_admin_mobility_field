# frozen_string_literal: true

require 'rails_admin/config/fields/association'
require 'rails_admin_mobility_field/tab'

# Custom rails_admin field to add tabs for mobility translations
module RailsAdminMobilityField
  class MobilityTabs < RailsAdmin::Config::Fields::Base
    RailsAdmin::Config::Fields::Types.register(:mobility_tabs, self)

    register_instance_option :partial do
      :form_mobility_tabs
    end

    register_instance_option :build_if_missing do
      true
    end

    register_instance_option :allowed_methods do
      # we need to allow every locale specific setter to be called
      # ex: title_en, title_fr, title_de
      available_locales.map { |locale| "#{method_name}_#{locale}".to_sym }
    end

    def method_name
      nested_form ? "#{name}_attributes".to_sym : super
    end

    def available_locales
      I18n.available_locales
    end

    def tabs
      tabs =
        available_locales.map do |locale|
          RailsAdminMobilityField::Tab.new(
            locale,
            name,
            value: bindings[:object].send("#{name}_#{locale}").present?
          )
        end.compact

      activate_tab(tabs)
      tabs
    end

    # Hack to distinguish between REST new/edit and create/update actions.
    # Taken from rails_admin/configs/new.rb
    def submit_action?
      !bindings[:controller].request.get?
    end

    def activate_tab(tabs)
      opened = tabs.first
      opened&.active!
    end
  end
end
