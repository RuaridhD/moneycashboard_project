require("minitest/autorun")
require("minitest/rg")

require_relative("../transaction.rb")

class TransactionTest < MiniTest::Test

  def setup()
    @transaction1 = Transaction.new ({
      "id" => 1,
      "merchant_id" => 2,
      "type_id" => 3,
      "cost" => 21.55
      })
    end

    def test_id
      assert_equal(1, @transaction1.id)
    end

    def test_merchant_id
      assert_equal(2, @transaction1.merchant_id)
    end

    def test_type_id
      assert_equal(3, @transaction1.type_id)
    end

    def test_cost()
      assert_equal(21.55, @transaction1.cost)
    end

  end
