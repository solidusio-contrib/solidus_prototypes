# frozen_string_literal: true

module BaseFeatureHelper
  def click_nav(nav_text)
    if Spree.solidus_gem_version > Gem::Version.new("4.2")
      primary_nav = find(".solidus-admin--nav--menu .tab-with-icon", text: /#{nav_text}/i)
    else
      primary_nav = find(".admin-nav-menu>ul>li>a", text: /#{nav_text}/i)
    end
    primary_nav.click
  end
end

RSpec.configure do |config|
  config.include BaseFeatureHelper, type: :feature
end
