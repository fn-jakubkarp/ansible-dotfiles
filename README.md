# 🚀 DevRig

<img align="right" src="https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExeTI4NzE1dmhtcm04c3dlN29iaG4zd2owZHBwczJxbXYwOHVtdGZiaSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/aer096d3vD4rYVsgNn/giphy.gif" width="200" height="200" />

**One command to rule them all** — your personal Ubuntu dev environment automation

![Ubuntu](https://img.shields.io/badge/Platform-Ubuntu-E95420?style=flat&logo=ubuntu&logoColor=white)
![WSL](https://img.shields.io/badge/Compatible-WSL-0078D6?style=flat&logo=windows&logoColor=white)
<!-- ![macOS](https://img.shields.io/badge/macOS-000000?style=flat&logo=apple&logoColor=white) -->


## ⚡ What is DevRig?

<img align="right" src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExYTVhb3A2NWNybG11OWlmbWRuYnA5N3g2MzVsMW84N3E5c2NnMm9zZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/H62NM1ab7wzMXURdoi/giphy.gif" width="200" height="200" />

- 🛠️ **Personal Automation** — Transform a fresh Ubuntu install into a fully configured dev environment
- 🧰 **Terminal-Focused** — Optimized for a terminal-centric workflow
- ⏱️ **Time Saver** — What took hours of manual setup now runs automatically
- 🔄 **Reproducible** — Recreate your environment anytime

<div align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&pause=1000&color=0969DA&center=true&vCenter=true&width=435&lines=My+terminal,+my+way;" alt="Typing SVG" />
</div>

---

> ⚠️ **Important:** Do not run as root or with `sudo`. The playbook is designed to run as a regular user — running `sudo ./setup.sh` will place dotfiles in `/root` instead of `/home/yourusername`.
>
> If using WSL, this setup includes SSH agent socket forwarding between Windows and WSL using `socat` and `npiperelay`. The `socat` package is installed automatically, and `npiperelay.exe` must be available in your Windows PATH.



## 🎯 Features

| Area | Description |
|------|-------------|
| 🖥️ **Terminal Environment** | ZSH, Oh My Zsh, and terminal utilities |
| 📦 **Core Packages** | Essential CLI tools and utilities |
| 🔄 **System Updates** | Ensures the system is up-to-date before setup |
| 🗂️ **Directory Structure** | Creates proper dotfiles management structure |


## 🛠️ Tech Stack

| Category | Tools |
|----------|-------|
| **Automation** | ![Ansible](https://img.shields.io/badge/Ansible-808080?style=flat&logo=ansible&logoColor=white) ![Bash](https://img.shields.io/badge/Bash-808080?style=flat&logo=gnu-bash&logoColor=white) |

---

## 🚀 Quick Start

```bash
# Clone the repository
git clone git@github.com:fn-jakubkarp/devrig.git

# Navigate to the project directory
cd devrig

# Make the setup script executable
chmod +x setup.sh

# Run the setup script
./setup.sh
```

---

## 🚧 Current Limitations

This project is personalized for my own use and currently:

- Does not support Docker or container tools
- Git configuration is hardcoded for personal use
- Lacks customization options for other users
- Does not configure VSCode or extensions

---

## 📝 Future Plans

While keeping the scope intentionally limited, I may eventually add:

- [ ] macOS support
- [ ] DevOps tools like Docker and Kubernetes
- [ ] VSCode configuration and extensions

---

## 🙏 Acknowledgements

Inspired by the fantastic work of:

- [TechDufus](https://github.com/TechDufus)
- [Dreams Of Autonomy](https://github.com/dreamsofautonomy)
- [DevOps Toolbox](https://github.com/devopstoolbox)

---

<div style="display: flex; justify-content: space-between;">

<div style="flex: 1; padding-right: 20px;">
<h3>⚠️ Personal Use</h3>
<p>This project is primarily for my personal use. While you're welcome to fork it for your own needs, it's not designed with general usability in mind.</p>
</div>

<div style="flex: 1; padding-left: 20px;">
<h3>💭 Philosophy</h3>
<p><i>"Solve your own problems first, then worry about scaling the solution."</i></p>
</div>

</div>

---

<div align="center">
  <p>Made with ❤️ by <a href="https://github.com/fn-jakubkarp">Jakub Karp</a></p>
  <p>If you find this useful as a starting point for your own automation, consider <a href="https://github.com/fn-jakubkarp/devrig">giving it a ⭐</a></p>
</div>
