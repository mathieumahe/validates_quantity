class Tag < ActiveRecord::Base
end

class Topic < ActiveRecord::Base
	has_many :tags_topics
	has_many :tags, through: :tags_topics
end

class TagsTopic < ActiveRecord::Base
	belongs_to :tag
	belongs_to :topic
end