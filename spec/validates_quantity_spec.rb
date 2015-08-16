require "spec_helper"

describe ActiveModel::Validations::QuantityValidator do
	before(:each) do
		Topic.clear_validators!
		(1..5).each { |i| Tag.new(id: i).save unless Tag.where(id: i).first }
  	end

	it "No validation : should work" do
		t = Topic.new(tag_ids: [1, 2])

		expect(t.save).to eq(true)
	end

	it "greater_than validation : should work" do
		Topic.validates_quantity_of :tags, :greater_than => 2
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(true)
	end

	it "greater_than validation : should not work" do
		Topic.validates_quantity_of :tags, :greater_than => 4
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(false)
	end

	it "greater_than_or_equal_to validation : should work" do
		Topic.validates_quantity_of :tags, :greater_than_or_equal_to => 3
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(true)
	end

	it "greater_than_or_equal_to validation : should not work" do
		Topic.validates_quantity_of :tags, :greater_than_or_equal_to => 5
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(false)
	end

	it "equal_to validation : should work" do
		Topic.validates_quantity_of :tags, :equal_to => 3
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(true)
	end

	it "equal_to validation : should not work" do
		Topic.validates_quantity_of :tags, :equal_to => 4
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(false)
	end

	it "less_than_or_equal_to validation : should work" do
		Topic.validates_quantity_of :tags, :less_than_or_equal_to => 3
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(true)
	end

	it "less_than_or_equal_to validation : should not work" do
		Topic.validates_quantity_of :tags, :less_than_or_equal_to => 2
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(false)
	end

	it "less_than validation : should work" do
		Topic.validates_quantity_of :tags, :less_than => 4
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(true)
	end

	it "less_than validation : should not work" do
		Topic.validates_quantity_of :tags, :less_than => 2
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(false)
	end
                 
	it "odd validation : should work" do
		Topic.validates_quantity_of :tags, :odd => true
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(true)
	end

	it "odd validation : should not work" do
		Topic.validates_quantity_of :tags, :odd => true
		t = Topic.new(tag_ids: [1, 2])

		expect(t.save).to eq(false)
	end

	it "even validation : should work" do
		Topic.validates_quantity_of :tags, :even => true
		t = Topic.new(tag_ids: [1, 2])

		expect(t.save).to eq(true)
	end

	it "even validation : should not work" do
		Topic.validates_quantity_of :tags, :even => true
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(false)
	end

	it "other_than validation : should work" do
		Topic.validates_quantity_of :tags, :other_than => 2
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(true)
	end

	it "lambda validation : should work" do
		Topic.validates_quantity_of :tags, :equal_to => -> (*) {2 + 1}
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(true)
	end

	it "lambda validation : should not work" do
		Topic.validates_quantity_of :tags, :equal_to => -> (*) {2 + 2}
		t = Topic.new(tag_ids: [1, 2, 3])

		expect(t.save).to eq(false)
	end

	# it "Error messages" do
	# 	Topic.validates_quantity_of :tags, :equal_to => -> (*) {2 + 1}
	# 	t = Topic.new(tag_ids: [1, 2])
	# 	t.save

	# 	expect(t.errors[:tags]).to eq(["The number of Tags must be equal to 3"])
	# end

end