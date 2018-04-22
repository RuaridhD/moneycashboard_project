require("minitest/autorun")
require("minitest/rg")

require_relative("../merchant.rb")

class MerchantTest < MiniTest::Test

  def setup()
    @merchant1 = Merchant.new ({
      "id" => 1,
      "name" => "Tesco"
      })
    end

    def test_id
      assert_equal(1, @merchant1.id)
    end

    def test_name()
      assert_equal("Tesco", @merchant1.name)
    end


  end
