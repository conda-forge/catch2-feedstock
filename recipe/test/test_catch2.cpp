#define CATCH_CONFIG_MAIN
#include "catch2/catch.hpp" 

TEST_CASE( "Some test", "[test1]" ) {
  REQUIRE( 1 == 1 );
}
