ActiveRecord::Schema.define do
  self.verbose = false

  create_table :tags, :force => true do |t|
    t.string :name
    t.timestamps
  end

  create_table :topics, :force => true do |t|
    t.string :name
    t.timestamps
  end

  create_table :tags_topics, :force => true do |t|
    t.belongs_to :tag
    t.belongs_to :topic
    t.timestamps
  end
end