# OpenCode & XAMPP PHP/MySQL Project Structure: A Complete Beginner's Guide

Welcome to the ultimate guide for organizing, developing, and automating modern **PHP and MySQL** projects running on **XAMPP**, integrated with **OpenCode** AI workspace automation. 

Whether you are building a custom Web Application, an API, or a classic MVC app, this guide provides a production-grade folder structure, security patterns, context rules for OpenCode AI, and step-by-step local server deployment configurations.

---

## Table of Contents
1. [Introduction to OpenCode & XAMPP](#1-introduction-to-opencode--xampp)
2. [Project Directory & File Structure](#2-project-directory--file-structure)
3. [Core Architectural Components](#3-core-architectural-components)
4. [OPENCODE.md Context Essentials](#4-opencodemd-context-essentials)
5. [Configuring OpenCode Extensions & Commands](#5-configuring-opencode-extensions--commands)
6. [XAMPP Local Server Setup & Apache Configuration](#6-xampp-local-server-setup--apache-configuration)
7. [MySQL Database Connection & PDO Architecture](#7-mysql-database-connection--pdo-architecture)
8. [Slash Commands Reference for PHP Projects](#8-slash-commands-reference-for-php-projects)
9. [OpenCode AI Agent Workflow Patterns](#9-opencode-ai-agent-workflow-patterns)
10. [Getting Started Step-by-Step](#10-getting-started-step-by-step)
11. [Context & Token Management](#11-context--token-management)
12. [Security Best Practices for PHP & MySQL](#12-security-best-practices-for-php--mysql)
13. [PHP Anti-Patterns to Avoid](#13-php-anti-patterns-to-avoid)
14. [Debugging, Error Logging & Troubleshooting](#14-debugging-error-logging--troubleshooting)
15. [Pro Tips & Production Deployment Strategies](#15-pro-tips--production-deployment-strategies)
16. [Frequently Asked Questions (FAQs)](#16-frequently-asked-questions-faqs)

---

## 1. Introduction to OpenCode & XAMPP

### What is OpenCode?
**OpenCode** is an open-source, AI-driven developer workflow and terminal tool designed to automate code generation, refactoring, and context management across your development repository using customized Markdown instruction context files (`OPENCODE.md` or `AGENTS.md`).

### What is XAMPP?
**XAMPP** (Apache, MariaDB/MySQL, PHP, Perl) is a cross-platform local development server environment. It allows developers to run PHP scripts locally alongside a MySQL database engine without needing active cloud infrastructure.

### Key Glossary
* **`OPENCODE.md` / `AGENTS.md`**: The repository root instruction context file that teaches OpenCode AI about your project's architecture, PHP coding conventions, and database standards.
* **Document Root (`/public`)**: The publicly accessible web directory. Isolating entry files here prevents direct HTTP access to core application logic and configuration files.
* **PDO (PHP Data Objects)**: The standard PHP database abstraction interface that uses prepared statements to prevent SQL Injection vulnerabilities.
* **Virtual Host (VHost)**: An Apache configuration allowing you to map local domain names (e.g., `http://myproject.local`) directly to your project's `/public` folder.

---

## 2. Project Directory & File Structure

A clean separation of concerns is vital for security and scalability. Core business logic, configuration keys, and database scripts must remain outside the web server's public document root.

```text
my_php_project/
├── OPENCODE.md                    # Core OpenCode project memory & AI guidelines
├── AGENTS.md                      # Agent rules and task delegation instructions
├── .opencode/                     # OpenCode configuration and extension hub
│   ├── config.json                # Custom settings & plugin options
│   ├── commands/                  # Custom Slash Command markdown templates
│   │   ├── make-migration.md      # Command to generate database migration scripts
│   │   ├── test-db.md             # Connection and database query test script
│   │   ├── build-crud.md          # Automated MVC CRUD feature generator
│   │   └── security-audit.md      # PHP code vulnerability scanner prompt
│   └── agents/                    # Subagent definitions for automated workflows
│       ├── database-agent.md      # SQL schema design & migration specialist
│       └── php-reviewer.md        # Static code analysis & compliance agent
├── config/                        # Core application settings
│   ├── app.php                    # Application constants & global settings
│   └── database.php               # PDO MySQL connection settings
├── database/                      # Database setup scripts & migrations
│   ├── schema.sql                 # Baseline database tables structure
│   ├── seed.sql                   # Initial test data
│   └── migrations/                # Versioned SQL database changes
├── src/                           # Backend Application Code (MVC pattern)
│   ├── Controllers/               # Request handling logic
│   │   ├── AuthController.php
│   │   └── UserController.php
│   ├── Models/                    # Database models and queries
│   │   └── User.php
│   ├── Views/                     # HTML templates & UI blocks
│   │   ├── auth/
│   │   └── dashboard/
│   ├── Helpers/                   # Utility functions (Sanitization, Auth Guard)
│   │   ├── Sanitizer.php
│   │   └── Session.php
│   └── Services/                  # Business logic & third-party API handlers
├── public/                        # PUBLIC WEB ROOT (Only directory exposed via HTTP)
│   ├── index.php                  # Primary Application Front Controller Entrypoint
│   ├── .htaccess                  # Apache URL rewrite engine rules
│   ├── css/                       # Static stylesheets
│   ├── js/                        # Client-side JavaScript
│   └── assets/                    # Static images and web fonts
├── storage/                       # Internal app file storage
│   ├── logs/                      # PHP runtime & application log files
│   └── uploads/                   # User-uploaded files
├── tests/                         # Unit and integration test suites (PHPUnit)
├── vendor/                        # Composer dependencies (Auto-generated)
├── .env.example                   # Environment variables template
├── .env                           # Local secrets (Database credentials - Git-ignored)
├── .gitignore                     # Git exclusion definitions
├── composer.json                  # PHP Composer package file & PSR-4 autoloader
└── README.md                      # Human-readable documentation
```

---

## 3. Core Architectural Components

| Component | Path / Location | Purpose & Function |
| :--- | :--- | :--- |
| **OPENCODE.md** | `/OPENCODE.md` | Core context file for OpenCode AI, establishing project guidelines. |
| **Public Root** | `/public/` | Web entry folder. Isolates internal source code from direct web access. |
| **Front Controller** | `/public/index.php` | Receives all HTTP requests, initializes routing, and loads controllers. |
| **PDO Database Handler** | `/config/database.php` | Secure MySQL connection instance utilizing environment credentials. |
| **Commands Hub** | `/.opencode/commands/` | Workspace triggers for generating models, views, and migration scripts. |
| **Environment File** | `/.env` | Secure storage for database host, port, credentials, and app keys. |

---

## 4. OPENCODE.md Context Essentials

The `OPENCODE.md` file defines code style, database handling policies, and safety constraints for OpenCode AI when modifying your PHP application.

### Essential Rules to Define in `OPENCODE.md`

1. **PHP Version & Strict Typing**: Enforce `declare(strict_types=1);` across all PHP files.
2. **Database Security Protocol**: Mandatory use of PDO prepared statements with parameterized inputs. Direct variable interpolation in SQL queries is strictly prohibited.
3. **Architecture Rules**: Enforce PSR-4 class autoloading, proper controller/model separation, and forbid direct business logic inside `/public/index.php`.
4. **Environment Isolation**: Forbid hardcoded credentials. All database hosts, passwords, and API keys must read from `$_ENV`.

#### Example `OPENCODE.md` File Content
```markdown
# OpenCode Project Memory: XAMPP PHP & MySQL Stack

## Tech Stack Guidelines
- Runtime: PHP 8.2+ running on local XAMPP Apache
- Database: MySQL / MariaDB (InnoDB engine, utf8mb4 encoding)
- Autoloading: Composer PSR-4 standard (`App\`) maps to `src/`

## Code Style & Rules
- Always add `declare(strict_types=1);` at the top of every PHP file.
- Use explicit class visibility modifiers (`public`, `protected`, `private`).
- Output escaping: All user-generated strings rendered in views MUST use `htmlspecialchars($data, ENT_QUOTES, 'UTF-8')`.

## Database Interaction Standards
- ONLY use the `Database::getConnection()` PDO instance.
- ALL SQL queries MUST use prepared statements with bound parameters:
  ```php
  $stmt = $pdo->prepare("SELECT * FROM users WHERE email = :email");
  $stmt->execute(['email' => $email]);
  ```
```

---

## 5. Configuring OpenCode Extensions & Commands

Custom commands reside inside `/.opencode/commands/` as `.md` files containing template prompts that OpenCode executes on command.

### Example: Custom Command Template (`/.opencode/commands/build-crud.md`)
```markdown
# Action: Generate Complete MVC CRUD
When this command is invoked:
1. Ask the user for the entity name (e.g., `Product`).
2. Create a SQL migration file in `database/migrations/` with standard fields (`id`, `created_at`, `updated_at`).
3. Create a Model file in `src/Models/Product.php` using PDO prepared statements.
4. Create a Controller in `src/Controllers/ProductController.php` with index, create, store, edit, update, and delete actions.
5. Create corresponding HTML/PHP view files under `src/Views/products/`.
```

---

## 6. XAMPP Local Server Setup & Apache Configuration

To point your XAMPP installation correctly to the `/public` entry folder, configure an **Apache Virtual Host**.

### Step 1: Edit Virtual Hosts Configuration
Open `C:\xampp\apache\conf\extra\httpd-vhosts.conf` (Windows) or `/opt/lampp/etc/extra/httpd-vhosts.conf` (Linux/Mac) and add:

```apache
<VirtualHost *:80>
    ServerName myproject.local
    DocumentRoot "C:/xampp/htdocs/my_php_project/public"
    
    <Directory "C:/xampp/htdocs/my_php_project/public">
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>
    
    ErrorLog "logs/myproject-error.log"
    CustomLog "logs/myproject-access.log" combined
</VirtualHost>
```

### Step 2: Update Local `hosts` File
Open your system's `hosts` file (Windows: `C:\Windows\System32\drivers\etc\hosts`, Linux/Mac: `/etc/hosts`) as Administrator/Root and append:

```text
127.0.0.1    myproject.local
```

### Step 3: URL Rewriting (`public/.htaccess`)
Place this `.htaccess` file inside your `/public/` directory so Apache routes all HTTP requests to `index.php`:

```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    
    # Redirect calls to non-existing files/directories to index.php
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^ index.php [L]
</IfModule>
```

---

## 7. MySQL Database Connection & PDO Architecture

Use the Singleton pattern to handle PDO connections reliably while reading from a `.env` configuration file.

### Safe Connection Class (`src/Helpers/Database.php`)
```php
<?php
declare(strict_types=1);

namespace App\Helpers;

use PDO;
use PDOException;

class Database 
{
    private static ?PDO $instance = null;

    public static function getConnection(): PDO 
    {
        if (self::$instance === null) {
            $host = $_ENV['DB_HOST'] ?? '127.0.0.1';
            $db   = $_ENV['DB_DATABASE'] ?? 'my_app_db';
            $user = $_ENV['DB_USERNAME'] ?? 'root';
            $pass = $_ENV['DB_PASSWORD'] ?? '';
            $port = $_ENV['DB_PORT'] ?? '3306';
            $charset = 'utf8mb4';

            $dsn = "mysql:host={$host};port={$port};dbname={$db};charset={$charset}";

            $options = [
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES   => false,
            ];

            try {
                self::$instance = new PDO($dsn, $user, $pass, $options);
            } catch (PDOException $e) {
                error_log("Database Connection Error: " . $e->getMessage());
                throw new PDOException("Database connection failed.");
            }
        }

        return self::$instance;
    }
}
```

---

## 8. Slash Commands Reference for PHP Projects

| Command | Target Action | Purpose |
| :--- | :--- | :--- |
| `/make-migration` | Schema Management | Generates a structured timestamped SQL file in `database/migrations/`. |
| `/build-crud` | Feature Generator | Automatically creates Model, Controller, and View files for a feature entity. |
| `/security-audit` | Code Review | Scans PHP files for SQL injection, XSS vulnerability, or plain credentials. |
| `/test-db` | Verification | Executes a diagnostic script against the XAMPP MySQL database instance. |
| `/refactor-pdo` | Legacy Refactor | Scans legacy SQL queries and converts them to PDO prepared statements. |

---

## 9. OpenCode AI Agent Workflow Patterns

```
1. Feature Architect Agent      2. Migration Agent             3. Security Review Agent
   [Architect]                     [Database Agent]               [PHP Reviewer]
        │                               │                              │
        ▼                               ▼                              ▼
 Parses feature request         Generates `.sql` script        Scans PHP source files
 Creates Controller/Model       Applies schema to MySQL        Validates XSS & SQL inputs
```

* **Architect Agent**: Reads requirements, scaffolds the PHP class hierarchy, and updates Composer autoload targets.
* **Database Specialist**: Writes isolated, reversible migration SQL scripts and populates mock data in `database/seed.sql`.
* **Security & Quality Agent**: Performs static analysis to verify strict typing, checks for parameter escaping, and audits password hashing mechanisms.

---

## 10. Getting Started Step-by-Step

1. **Clone or create your project directory in XAMPP**:
   ```bash
   cd C:/xampp/htdocs/
   mkdir my_php_project && cd my_php_project
   ```
2. **Initialize Composer & PSR-4 Autoloading**:
   Create `composer.json`:
   ```json
   {
       "name": "app/my-project",
       "autoload": {
           "psr-4": {
               "App\\": "src/"
           }
       }
   }
   ```
   Run: `composer dump-autoload`
3. **Setup Context Rules**:
   Create `OPENCODE.md` in the repository root using the guidelines provided in Section 4.
4. **Setup Environment Credentials**:
   Copy `.env.example` to `.env` and configure your local XAMPP MySQL credentials.
5. **Configure Apache VHost & Hosts**:
   Map `myproject.local` to `my_php_project/public` and restart Apache via XAMPP Control Panel.
6. **Launch OpenCode CLI**:
   Execute `opencode` in your project terminal and begin generating features!

---

## 11. Context & Token Management

* **Isolate Heavy Documentation**: Store extensive database schemas in `docs/schema.md` or `database/schema.sql` rather than dumping everything in `OPENCODE.md`.
* **Use OpenCode Context Commands**: Use `/compact` periodically during long refactoring sessions to summarize historical chat logs.
* **Exclude Vendor Directory**: Ensure `vendor/` and `storage/` are listed in `.gitignore` and excluded from AI context scans to save token overhead.

---

## 12. Security Best Practices for PHP & MySQL

* **SQL Injection Prevention**: Never concatenate variables directly into SQL queries. Always use PDO parameter binding (`:param`).
* **Cross-Site Scripting (XSS)**: Always escape user data rendered in HTML using `htmlspecialchars($val, ENT_QUOTES, 'UTF-8')`.
* **Password Hashing**: Store user passwords exclusively using PHP's native `password_hash($password, PASSWORD_ARGON2ID)` or `PASSWORD_BCRYPT`. Never use `md5()` or `sha1()`.
* **CSRF Protection**: Generate random tokens for HTML forms using `bin2hex(random_bytes(32))` and validate them on form submission.
* **Hide Database Errors in Production**: Ensure `display_errors = Off` in production `php.ini` so raw SQL error strings and server directory paths are not displayed to end users.

---

## 13. PHP Anti-Patterns to Avoid

| Anti-Pattern | Why It Fails | Correct Solution |
| :--- | :--- | :--- |
| **Mixing SQL in HTML Views** | Creates severe maintenance and security vulnerabilities. | Separate data retrieval into Model files; pass variables to Views. |
| **Using `mysqli` without Binding** | Prone to raw string manipulation and SQL injection errors. | Use PDO instances with strictly bound array parameters. |
| **Exposing Configuration Root** | Placing `config.php` inside the web root exposes keys if PHP fails. | Keep all source files in `/src` or `/config` outside `/public`. |
| **Global `$_POST` Access** | Bypasses data validation and sanitization. | Pass request data through a dedicated Sanitizer/Request helper class. |

---

## 14. Debugging, Error Logging & Troubleshooting

### Enabling Development Errors in PHP
During local development in XAMPP, add these lines to the top of `/public/index.php`:

```php
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);
```

### Common Issues & Solutions

#### Problem 1: 404 Error when requesting sub-routes on `http://myproject.local/users`
* **Root Cause**: Apache `mod_rewrite` module is disabled or `.htaccess` is missing in `/public`.
* **Solution**: Enable `mod_rewrite` in XAMPP's `httpd.conf` (uncomment `LoadModule rewrite_module modules/mod_rewrite.so`) and confirm `.htaccess` exists in `/public/`.

#### Problem 2: PDO Exception "Access denied for user 'root'@'localhost'"
* **Root Cause**: Incorrect password or MySQL port mismatch in your `.env` configuration file.
* **Solution**: Verify MySQL port in XAMPP Control Panel (default: 3306) and match credentials in your `.env` file.

---

## 15. Pro Tips & Production Deployment Strategies

* **Keep Storage Directory Writeable**: Ensure Apache/web server processes have write permissions for `/storage/logs` and `/storage/uploads`.
* **Automate Schema Migrations**: Create an OpenCode command `/migrate` to auto-execute unapplied SQL migration files in `database/migrations/`.
* **Disable XAMPP Default Settings for Production**: Never deploy XAMPP directly to a public production server. Deploy your application to a secured Linux server (Ubuntu/Nginx/PHP-FPM) running properly isolated credentials.

---

## 16. Frequently Asked Questions (FAQs)

### Q: Why should I place `index.php` inside the `/public` folder instead of the root folder?
**A:** If Apache points directly to the project root directory, any server misconfiguration could expose your `.env` secrets file or source code directly to visitors in plain text. Placing `index.php` inside `/public` ensures root files are completely unreachable via HTTP.

### Q: Can I use OpenCode with standard PHP without Composer?
**A:** Yes, but using Composer for PSR-4 autoloading (`require __DIR__ . '/../vendor/autoload.php';`) eliminates tedious manual `require_once` statements across your controller and model files.

### Q: How does OpenCode compare to other AI tools when working on legacy PHP apps?
**A:** OpenCode allows you to define custom system instructions (`OPENCODE.md`) that force the AI to strictly adhere to modern PHP 8 features, PDO query standards, and custom organizational rules, preventing it from generating legacy procedural code.

---
*Guide compiled for modern XAMPP PHP & MySQL development with OpenCode integration.*
