require "takeaway"

describe TakeAway do
  let(:menu) { double :menu, dispaly: { "kiwiburger" => 9.35 } }
  let(:order) { double :order, add: nil, sum: nil }
  let(:order_class) { double :order_class, new: order }
  subject(:takeaway) { described_class.new(menu, order_class: order_class) }

  describe "#read_menu" do
    it "should display the menu" do
      expect(menu).to receive(:display)
      subject.read_menu
    end
  end

  describe "#order" do
    it "should create a new order" do
      expect(order_class).to receive(:new).and_return(order)
      subject.order("skinny fries")
    end

    it "should add item to the order" do
      expect(order).to receive(:add)
      subject.order("skinny fries")
    end
  end

  describe "#total" do
    it "should return a total for the order" do
      expect(order).to receive(:sum)
      subject.total
    end
  end
end
