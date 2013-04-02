class Tag < ActiveRecord::Base
  serialize :parameters, Hash
  belongs_to :tag_type, :class_name => "TagType", :foreign_key => :tid, :primary_key => :tid
  attr_accessible :parameters, :tid
  
  after_save :save_attributes
  
  def save_attributes
    self.parameters.to_a.map {|parameter| TagAttribute.find_or_create_by_key(:key => parameter[0]) }
  end
end
