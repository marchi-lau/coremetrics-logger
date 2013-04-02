class TagType < ActiveRecord::Base
  attr_accessible :name, :tid
  has_many :tags, :class_name => "Tag", :foreign_key => :tid, :primary_key => :tid
end
