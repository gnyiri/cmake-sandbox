#include "gtest/gtest.h"

#include "module_a/module_a.h"

namespace
{
  class ModuleATest : public ::testing::Test
  {
  public:
    //--------------------------------------------------------------
    ModuleATest()
    {
    }
    //--------------------------------------------------------------
    ~ModuleATest()
    {
    }
    //--------------------------------------------------------------
    static void SetUpTestCase()
    {
    }
    //--------------------------------------------------------------
    static void TearDownTestCase()
    {
    }
    //--------------------------------------------------------------
    void SetUp()
    {
    }
    //--------------------------------------------------------------
    void TearDown()
    {
    }
  };
}

//--------------------------------------------------------------
TEST_F(ModuleATest, Test_f)
{
  EXPECT_EQ(9, sts::module_a::f(3));
  EXPECT_EQ(16, sts::module_a::f(4));
}
