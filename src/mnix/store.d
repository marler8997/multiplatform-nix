module mnix.store;

version (Windows)
    enum DefaultNixStorePath = lit!"C:\nix\store";
else
    enum DefaultNixStorePath = lit!"/nix/store";

private __gshared SentinelString 
SentinelString getNixStorePath()
{
    return DefaultNixStore;
}

void createUserEnvironment()
{
    
}