#pragma once

#ifdef OWNFUNC
  void printf(char* x);
#else
  #include <stdio.h>
#endif
