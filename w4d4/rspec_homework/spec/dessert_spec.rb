require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:dessert) { Dessert.new("cake_slice", 5, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.instance_variable_get(:@type)).to eq("cake_slice")
    end

    it "sets a quantity" do
      expect(dessert.instance_variable_get(:@quantity)).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.instance_variable_get(:@ingredients)).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake_slice", "5", chef) }.to raise_error
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("flour")
      expect(dessert.instance_variable_get(:@ingredients)).to eq(["flour"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("flour")
      dessert.add_ingredient("eggs")
      dessert.add_ingredient("sugar")
      dessert.mix!
      expect(dessert.instance_variable_get(:@ingredients)).to match_array(["flour", "eggs", "sugar"])
      expect(dessert.instance_variable_get(:@ingredients)).not_to eq(["flour", "eggs", "sugar"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(2)
      expect(dessert.instance_variable_get(:@quantity)).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(6) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(dessert.instance_variable_get(:@chef)).to receive(:titleize).and_return("Chef")
      expect(dessert.serve).to include("Chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(dessert.instance_variable_get(:@chef)).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end