class Post < ApplicationRecord
  extend Mobility
  translates :title, type: :string,  locale_accessors: [:en, :"zh-TW"]
  translates :body, type: :text, locale_accessors: [:en, :"zh-TW"]
end
