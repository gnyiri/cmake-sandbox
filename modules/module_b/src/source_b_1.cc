#include "module_b/module_b.h"

#include "module_a/module_a.h"

namespace sandbox
{
  namespace module_b
  {
    int f_b(int x)
    {
      return module_a::f_a(x);
    }
  }
}
