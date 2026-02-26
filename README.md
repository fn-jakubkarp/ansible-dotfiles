## Important!

Do not run as root or with sudo, as the playbook is designed to be run as a regular user. Running `sudo ./setup.sh` will put the dotfiles in `/root` instead of `/home/yourusername` directory.

---


If used through WSL, this dotfiles setup includes configuration for SSH agent socket forwarding between Windows and WSL using `socat` and `npiperelay`.
The `socat` package is installed in the common tasks, and the `.zshrc`.
Setup requires `npiperelay.exe` to be available in the system PATH on Windows.