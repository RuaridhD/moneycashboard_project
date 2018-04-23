require("minitest/autorun")
require("minitest/rg")
require('pry')

require_relative("../transaction.rb")

class TransactionTest < MiniTest::Test

  def setup()
    @transaction1 = Transaction.new ({
      "id" => 1,
      "merchant_id" => 1,
      "type_id" => 1,
      "cost" => 21.55
      })
    end

    def test_id
      assert_equal(1, @transaction1.id)
    end

    def test_merchant_id
      assert_equal(1, @transaction1.merchant.id)
    end

    def test_type_id
      assert_equal(1, @transaction1.type_id)
    end

    def test_cost()
      assert_equal(21.55, @transaction1.cost)
    end

    def test_update()
      @transaction1.cost = 22.55
      @transaction1.update
      assert_equal(22.55, @transaction1.cost)
    end

    def test_type
      assert_equal("Groceries", @transaction1.type.type)
    end

    def test_merchant
      assert_equal("Tesco", @transaction1.merchant.name)
    end

    def test_count
      count = Transaction.count()
      binding.pry
      nil
    end

  end
