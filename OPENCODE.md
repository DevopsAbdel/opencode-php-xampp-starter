# OpenCode Project Memory: [Project Name]

## Tech Stack Guidelines
- Runtime: PHP 8.2+ running on local XAMPP Apache
- Database: MySQL / MariaDB (InnoDB engine, utf8mb4 encoding)
- Autoloading: Composer PSR-4 standard (`App\`) maps to `src/`
- Web root: `public/` only — never expose `/src`, `/config`, or `.env` over HTTP

## Code Style & Rules
- Always add `declare(strict_types=1);` at the top of every PHP file.
- Use explicit class visibility modifiers (`public`, `protected`, `private`).
- Output escaping: all user-generated strings rendered in views MUST use
  `htmlspecialchars($data, ENT_QUOTES, 'UTF-8')`.

## Database Interaction Standards
- ONLY use the `Database::getConnection()` PDO instance
  (see `src/Helpers/Database.php`).
- ALL SQL queries MUST use prepared statements with bound parameters.
- Never concatenate variables directly into SQL strings.

## Architecture Rules
- Controllers in `src/Controllers/`, Models in `src/Models/`, Views in `src/Views/`.
- No business logic inside `public/index.php` — it only bootstraps and routes.
- All credentials and config values come from `$_ENV`, never hardcoded.

## Reference
Full guidelines: see `XAMPP_PHP_MySQL_OpenCode_Guide.md` in the project root.
