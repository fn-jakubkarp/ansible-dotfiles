# 🚀 DevRig

<img align="right" src="https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExeTI4NzE1dmhtcm04c3dlN29iaG4zd2owZHBwczJxbXYwOHVtdGZiaSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/aer096d3vD4rYVsgNn/giphy.gif" width="200" height="200" />
<p><i>One command to rule them all - your personal Ubuntu dev environment automation</i></p>
<img src="https://img.shields.io/badge/Platform-Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" alt="Ubuntu" />
<img src="https://img.shields.io/badge/Compatible-WSL-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="WSL Compatible" />
<img src="https://img.shields.io/badge/Coming%20(but%20not%20so%20soon)-macOS-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS Coming Soon" />

&nbsp;
<hr>

## Important!

Do not run as root or with sudo, as the playbook is designed to be run as a regular user. Running `sudo ./setup.sh` will put the dotfiles in `/root` instead of `/home/yourusername` directory.

If used through WSL, this dotfiles setup includes configuration for SSH agent socket forwarding between Windows and WSL using `socat` and `npiperelay`.
The `socat` package is installed in the common tasks, and the `.zshrc`.
Setup requires `npiperelay.exe` to be available in the system PATH on Windows.

<hr>

## ⚡ What is it all about?

<img align="right" src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExYTVhb3A2NWNybG11OWlmbWRuYnA5N3g2MzVsMW84N3E5c2NnMm9zZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/H62NM1ab7wzMXURdoi/giphy.gif" width="200" height="200" />

- 🛠️ **Personal Automation** | Transform a fresh Ubuntu install into my preferred dev setup
- 🧰 **Terminal-Focused** | Optimized for a terminal-centric workflow
- ⏱️ **Save Hours** | What took manual setup now runs automatically
- 🔄 **Reproducible** | Easily recreate your environment

<div align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&pause=1000&color=0969DA&center=true&vCenter=true&width=435&lines=My+terminal%2C+my+way;" alt="Typing SVG" />
</div>

<hr>

## 🎯 Features

<p align="left"><i>What devrig currently offers</i></p>

- 🖥️ **Terminal Environment** - ZSH, Oh My Zsh, and terminal utilities
- 📦 **Core Package Installation** - Essential CLI tools and utilities
- 🔄 **System Updates** - Ensures the system is up-to-date before setup
- 🗂️ **Directory Structure** - Creates directory structure for proper dotfiles management

<hr>


## 🛠️ Tech Stack

<p align="left"><i>The technology powering this personal automation</i></p>

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

<hr>

## 🚀 Quick Start

```bash
# Clone this repository
git clone git@github.com:fn-jakubkarp/devrig.git

# Navigate to the project directory
cd devrig

# Make the setup script executable
chmod +x setup.sh

# Run the setup script
./setup.sh
```

<hr>

## 🚧 Current Limitations

This project is personalized for my own use and currently:

- Does not support Docker or container tools
- Git configuration is hardcoded for my personal use
- Lacks customization options for other users
- Does not configure VSCode or extensions

<hr>

## 📝 Future Plans

While keeping the scope intentionally limited, I may eventually add:

- [ ] macOS support
- [ ] Devops tools like Docker and Kubernetes
- [ ] VSCode configuration and extensions

<hr>

## ❌ Not Planned

To maintain focus, this project will not support:

- Mobile development environments
- Theme customization options
- Multiple environment profiles

<hr>

## 🙏 Acknowledgements

Inspired by the fantastic work of:
- [TechDufus](https://github.com/TechDufus)
- [Dreams Of Autonomy](https://github.com/dreamsofautonomy)
- [DevOps Toolbox](https://github.com/devopstoolbox)

<hr>

<div style="display: flex; justify-content: space-between;">
  <div>
    <h2>⚠️ Personal Use</h2>
    <p>This project is primarily for my personal use. While you're welcome to fork it for your own needs, it's not designed with general usability in mind.</p>
  </div>
  <div>
    <h2>💭 Philosophy</h2>
    <p><i>"Solve your own problems first, then worry about scaling the solution."</i></p>
  </div>
</div>

<hr>

<div align="center">
  <p>Made with ❤️ by <a href="https://github.com/fn-jakubkarp">Jakub Karp</a></p>
  <p>If you find this useful as a starting point for your own automation, consider <a href="https://github.com/fn-jakubkarp/devrig">giving it a ⭐</a></p>
</div>