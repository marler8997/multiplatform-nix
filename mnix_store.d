#!/usr/bin/env rund
//!version NoStdc
//!noConfigFile
//!betterC
//!debug
//!debugSymbols
module __none;

/**
NOTE: only x86_64 is currently supported
*/
import mar.sentinel;
import mar.c;
import mar.stdio;

import mnix.store : createUserEnvironment;

//import mar.start;
//mixin(startMixin);

extern (C) int main(uint argc, SentinelPtr!cstring argv, SentinelPtr!cstring envp)
{
    stdout.write("Hello World!\n");
    return 0;
}


