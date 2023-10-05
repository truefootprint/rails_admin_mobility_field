# frozen_string_literal: true

module RailsAdminMobilityField
  class Tab
    LABEL_KEY = 'admin.mobility_field.tab_label'

    attr_reader :locale, :translation_key, :value

    def initialize(locale, translation_key, value: nil)
      @locale = locale
      @translation_key = translation_key
      @value = value
    end

    def id
      ['pane', translation_key, locale].join('-')
    end

    def param_key
      "#{translation_key}_#{locale}"
    end

    def label
      if I18n.exists?(LABEL_KEY, locale: locale)
        I18n.t(LABEL_KEY, locale: locale)
      else
        locale
      end
    end

    def active!
      @active = true
    end

    def active?
      @active
    end

    def filled?
      @value.present?
    end
  end
end
