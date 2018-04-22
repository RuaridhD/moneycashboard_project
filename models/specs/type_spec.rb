require("minitest/autorun")
require("minitest/rg")

require_relative("../type.rb")

class TypeTest < MiniTest::Test

  def setup()
    @type1 = Type.new ({
      "id" => 1,
      "type" => "Groceries"
      })
    end

    def test_id()
      assert_equal(1, @type1.id)
    end

    def test_type()
      assert_equal("Groceries", @type1.type)
    end

    def test_update()
      @type1.type = "Clothes"
      @type1.update
      assert_equal("Clothes", @type1.type)
    end



  end
