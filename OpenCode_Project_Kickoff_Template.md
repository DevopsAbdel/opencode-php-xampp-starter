# OpenCode Project Kickoff Prompt Template

Use this document to initiate new PHP/MySQL projects with OpenCode in your XAMPP local environment. Copy the prompt below, fill in the bracketed sections, and paste it as your first message to OpenCode for any new project.

---

## 🚀 Copy-Paste Prompt Template

```
I want to start developing a new project. I am attaching my project guidelines
from `XAMPP_PHP_MySQL_OpenCode_Guide.md`. Please read and strictly adhere to
all instructions, architectural constraints, and coding standards outlined in
that guide.

### 1. Project Overview
- **Project Name:** [Insert Project Name]
- **Target Location:** C:\xampp\htdocs\[your-folder-name]
  (http://localhost/[your-folder-name])
- **Core Idea & Goal:** [Describe what the application does, who it is for,
  and the core workflow it solves]

### 2. Key Features & Capabilities
1. **Authentication & Roles:** [e.g., Admin / User role access control]
2. **Core Workflow:** [e.g., File tracking, client management, form submission]
3. **Data Storage:** [e.g., Storing structured client data in MySQL with
   status flags]
4. **Export / Reporting:** [e.g., Generate PDF reports or Word documents]

### 3. Immediate Action Plan Required
Before writing complete feature files, please execute the following steps:

1. **Rule Verification:** Acknowledge that you have loaded
   `XAMPP_PHP_MySQL_OpenCode_Guide.md` and list the primary tech stack rules
   (PHP version, PDO usage, folder structure).
2. **Database Schema:** Provide the initial SQL creation script
   (`sql/schema.sql`) tailored for MySQL/phpMyAdmin on XAMPP.
3. **Project Structure:** Confirm the local XAMPP folder tree layout.
4. **Boilerplate Setup:** Generate the core configuration files:
   - `config/db.php` (PDO database connection with XAMPP default credentials
     `localhost`, `root`, `""`)
   - `.env.example` or configuration constants file
   - `index.php` (main entry point router)

Wait for my review and approval of the database schema before writing the
full CRUD logic.
```

---

## 📁 Standard Project Structure

```
C:\xampp\htdocs\your-project-name\
│
├── .opencode/                         # OpenCode agent context & custom rules
├── config/                            # Core application configurations
│   ├── config.php                     # App settings (BASE_URL, database credentials)
│   └── db.php                         # PDO MySQL connection helper
│
├── includes/                          # Shared UI partials & utilities
│   ├── header.php                     # Global HTML header & nav
│   ├── footer.php                     # Global HTML footer & scripts
│   └── functions.php                  # Helper functions (sanitization, session checks)
│
├── controllers/                       # Request processing logic (POST handling, API routes)
├── models/                            # Database interactions & PDO query functions
├── views/                             # UI pages & templates (dashboard, forms, lists)
│
├── assets/                            # Public static web assets
│   ├── css/                           # Stylesheets (Bootstrap, custom CSS)
│   ├── js/                            # JavaScript files
│   └── images/                        # Uploaded or local images
│
├── sql/                               # Database setup and migrations
│   └── schema.sql                     # Importable script for phpMyAdmin
│
├── uploads/                           # Local file uploads directory
├── .htaccess                          # Apache routing & security rules (XAMPP root)
├── index.php                          # Main application entry point / router
├── OPENCODE.md                        # Master AI instructions
└── XAMPP_PHP_MySQL_OpenCode_Guide.md  # Detailed dev guidelines file
```

---

## ✅ Pre-Flight Checklist

Before pasting the prompt, make sure you have:

- [ ] `XAMPP_PHP_MySQL_OpenCode_Guide.md` written/updated and ready to attach
- [ ] Chosen a project folder name (no spaces, lowercase, hyphens if needed)
- [ ] A clear one-paragraph description of the core workflow
- [ ] A rough list of the main data entities (e.g., users, clients, orders)
- [ ] Decided whether the project needs auth/roles from day one

---

## 🧭 Usage Notes

- **Wait for schema approval** before letting OpenCode generate full CRUD
  logic — this avoids rework if the data model needs adjusting.
- **Keep `XAMPP_PHP_MySQL_OpenCode_Guide.md` versioned** alongside this
  template so both evolve together; if you change a coding standard, update
  the guide, not just this prompt.
- **Reuse this file as-is** for every new project — only Sections 1 and 2 of
  the prompt need to change per project.
