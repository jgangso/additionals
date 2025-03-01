# frozen_string_literal: true

require File.expand_path '../../test_helper', __FILE__

class AdditionalsFontAwesomeTest < Additionals::TestCase
  include Redmine::I18n

  def setup
    set_language_if_valid 'en'
  end

  def test_value_info_should_return_infos
    info = AdditionalsFontAwesome.value_info 'invalid'

    assert_kind_of Hash, info
    assert_empty info

    info = AdditionalsFontAwesome.value_info 'fas_car'

    assert info.key?(:classes)
    assert_equal :fas, info[:type]
    assert_equal 'fas fa-car', info[:classes]
    assert_not info.key?(:unicode)
  end

  def test_value_info_regular_icons
    info = AdditionalsFontAwesome.value_info 'far_address-book'

    assert info.key?(:classes)
    assert_equal 'normal', info[:font_weight]
    assert_equal 'Font Awesome\ 5 Free', info[:font_family]
  end

  def test_value_info_solid_icons
    info = AdditionalsFontAwesome.value_info 'fas_address-book'

    assert info.key?(:classes)
    assert_equal 900, info[:font_weight]
    assert_equal 'Font Awesome\ 5 Free', info[:font_family]
  end

  def test_value_info_brands_icons
    info = AdditionalsFontAwesome.value_info 'fab_xing'

    assert info.key?(:classes)
    assert_equal 'normal', info[:font_weight]
    assert_equal 'Font Awesome\ 5 Brands', info[:font_family]
  end

  def test_brands_icon_with_details
    info = AdditionalsFontAwesome.value_info 'fab_amazon', with_details: true

    assert info.key?(:unicode)
    assert info.key?(:label)
    assert_equal '&#xf270;', info[:unicode]
    assert_equal 'Amazon', info[:label]
  end

  def test_regular_icon_with_details
    info = AdditionalsFontAwesome.value_info 'far_calendar', with_details: true

    assert info.key?(:unicode)
    assert info.key?(:label)
    assert_equal '&#xf133;', info[:unicode]
    assert_equal 'Calendar', info[:label]
  end

  def test_solid_icon_with_details
    info = AdditionalsFontAwesome.value_info 'fas_archive', with_details: true

    assert info.key?(:unicode)
    assert info.key?(:label)
    assert_equal '&#xf187;', info[:unicode]
    assert_equal 'Archive', info[:label]
  end
end
