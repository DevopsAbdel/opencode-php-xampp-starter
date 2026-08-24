# OpenCode PHP/XAMPP Starter

Reusable guidelines, a kickoff prompt, and a scaffolding script for starting new **PHP + MySQL** projects on **XAMPP**, built to work with **OpenCode**.

Clone this repo once, then use it to spin up every new local project with a consistent, secure folder structure — no more copy-pasting boilerplate by hand.

---

## 📦 What's in this repo

```
opencode-php-xampp-starter/
├── README.md                              # This file
├── XAMPP_PHP_MySQL_OpenCode_Guide.md      # Full reference guide (architecture, security, PDO, Apache config)
├── OpenCode_Project_Kickoff_Template.md   # Copy-paste prompt to hand to OpenCode for a new project
├── scripts/
│   └── new-project.bat                    # Scaffolds a new project into C:\xampp\htdocs
└── templates/
    ├── OPENCODE.md                        # Starter AI context file, copied into every new project
    ├── .env.example                       # Environment variable template
    ├── .gitignore                         # Standard ignores for a PHP/Composer project
    ├── composer.json                      # PSR-4 autoload skeleton
    ├── index.php                          # Minimal front controller
    └── .htaccess                          # Apache rewrite rules for public/
```

**Golden rule:** the folder structure in `XAMPP_PHP_MySQL_OpenCode_Guide.md`, `OpenCode_Project_Kickoff_Template.md`, and `scripts/new-project.bat` must always match. If you change one, update all three.

---

## 🚀 Starting a new project

### Option A — Automated (recommended)

1. Clone this starter repo **outside** of `htdocs`, e.g. `C:\tools\opencode-php-xampp-starter`.
2. Open a terminal (cmd) in that folder.
3. Run:
   ```bat
   scripts\new-project.bat my-new-project
   ```
4. This creates `C:\xampp\htdocs\my-new-project` with the full folder structure, plus `OPENCODE.md`, `.env.example`, `.gitignore`, `composer.json`, and a working `public/index.php` + `public/.htaccess` already in place.
5. Follow the next-steps printed at the end of the script (VirtualHost, hosts file, `.env`, Composer, OpenCode prompt).

### Option B — Manual

1. Create the project folder in `C:\xampp\htdocs\your-project-name`.
2. Copy the structure from `XAMPP_PHP_MySQL_OpenCode_Guide.md` (Section 2) by hand, or copy the contents of `templates/` into the new folder.
3. Copy `XAMPP_PHP_MySQL_OpenCode_Guide.md` itself into the project root — OpenCode needs it there to read the rules.
4. Set up the Apache VirtualHost and `hosts` file entry (guide, Section 6).
5. Copy `.env.example` to `.env` and fill in your local MySQL credentials.
6. Open OpenCode in the project folder, paste the prompt from `OpenCode_Project_Kickoff_Template.md`, fill in Sections 1 and 2, and send it.
7. Review the SQL schema OpenCode proposes before approving full CRUD generation.

---

## 🔁 Keeping this starter up to date

- If you add a new coding rule, add it to **both** `XAMPP_PHP_MySQL_OpenCode_Guide.md` and `templates/OPENCODE.md` (the guide is the full explanation, the template is what actually ships with each project).
- If you change the folder structure, update it in the guide, the kickoff template, **and** `scripts/new-project.bat` in the same commit.
- Tag releases (`v1.0`, `v1.1`, …) once this stabilizes, so existing projects can note which starter version they were scaffolded from.
