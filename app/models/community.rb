class Community
  include Mongoid::Document	
  include Mongoid::Timestamps

  field :name, type: String
  field :brief, type: String
  field :last_updated_at, type: Time

  validates_presence_of :name
  validates_uniqueness_of :name
  attr_accessible :name, :brief

  has_and_belongs_to_many :users
  has_many :articles
  has_many :questions

  def activities
    Activity.where(target_object:{"id" => self.id, "type"=>"Community"})
  end
end