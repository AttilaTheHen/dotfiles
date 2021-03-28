# .files
It just works. Sometimes. Work in progress!

### Todo/notes to keep in mind
- Need to add script to edit the `/etc/pam.d/sudo` file to allow TouchID to sudo for touchbar Macs (add `auth sufficient pam_tid.so` to the top of the `sudo` file).
- Also add script to edit the `/etc/pam.d/sudo` file to allow the Apple Watch to sudo? (`auth sufficient pam_watchid.so`)
- It would be cool to set up a basic Docker environment to test the dotfiles in.

## Acknowledgements
Special thanks to Ryan Kilby for letting me get started by looking at his excellent [dotfiles](https://github.com/rpkilby/dotfiles).
Most of what's here is from him.
