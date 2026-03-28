# DevRig

*Ansible-based Ubuntu dev environment setup. One command, fresh install to fully configured.*

![Ubuntu](https://img.shields.io/badge/Platform-Ubuntu-E95420?style=flat&logo=ubuntu&logoColor=white)
![WSL](https://img.shields.io/badge/Compatible-WSL-0078D6?style=flat&logo=windows&logoColor=white)

<hr>

## What it does

Takes a fresh Ubuntu install and sets up dev environment automatically.

<hr>

> **Note:** Don't run as root or with `sudo`. Running `sudo ./setup.sh` puts dotfiles in `/root` instead of your home directory.
>
> If you're on WSL, SSH agent forwarding between Windows and WSL uses `socat` and `npiperelay`. `socat` installs automatically; `npiperelay.exe` needs to be in your Windows PATH.

## Features

| Area | Description |
|------|-------------|
| Terminal | ZSH, Oh My Zsh, and terminal utilities |
| Core packages | Essential CLI tools and utilities |
| System updates | Keeps the system current before setup runs |
| Directory structure | Sets up proper dotfiles management |


## Tech stack

<table>
  <tr>
    <th align="left">Category</th>
    <th align="left">Tools</th>
  </tr>
  <tr>
    <td><b>Automation</b></td>
    <td>
      <img src="https://img.shields.io/badge/Ansible-808080?style=for-the-badge&logo=ansible&logoColor=white" />
      <img src="https://img.shields.io/badge/Bash-808080?style=for-the-badge&logo=gnu-bash&logoColor=white" />
    </td>
  </tr>
</table>

## Quick start

```bash
# Clone the repository
git clone git@github.com:fn-jakubkarp/ansible-dotfiles.git

cd ansible-dotfiles

chmod +x setup.sh

./setup.sh
```

---

## On the roadmap

Things I'll probably get to eventually:

- [ ] macOS support
- [ ] Opencode setup

<hr>

## Credits

Built on top of ideas from:
- [TechDufus](https://github.com/TechDufus)
- [Dreams Of Autonomy](https://github.com/dreamsofautonomy)
- [DevOps Toolbox](https://github.com/devopstoolbox)

<hr>

This is built for my own use. You're welcome to fork it as a starting point, but expect to change a fair bit before it fits your setup.

<div align="center">
  <p>Made by <a href="https://github.com/fn-jakubkarp">Jakub Karp</a> — <a href="https://github.com/fn-jakubkarp/devrig">star it</a> if it saved you some time</p>
</div>
