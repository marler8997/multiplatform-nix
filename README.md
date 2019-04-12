# Nix Store on Windows

The big question for the nix store on windows is user environments.  The biggest problem here is that you can't add symbolic links, so creating a combined user-environment with all the packages isn't straightforward.  My current idea is to create an "executable" user environment, where instead of symbolic links, we just use small bash wrappers, i.e.

```
c:\nix\store\...-coreutils-1.0.0\bin\ls
c:\nix\store\...-bash-1.0.0\bin\bash
```
```
c:\nix-store\...-user-environment\bin\ls.bat
c:\nix-store\...-user-environment\bin\bash.bat
```
