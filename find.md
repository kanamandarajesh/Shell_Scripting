## Find command in detailed way

| Part    | Meaning                                                                                                      |
| ------- | ------------------------------------------------------------------------------------------------------------ |
| `-exec` | Tells `find` to **execute a command** on each file it finds.                                                 |
| `rm`    | The command to run (in this case, **remove/delete** the file).                                               |
| `{}`    | A **placeholder** that gets replaced by the current file `find` found.                                       |
| `\;`    | Ends the `-exec` command. The backslash (`\`) escapes the semicolon (`;`) so the shell doesn’t interpret it. |



find [path] [options] [expression]


| Option    | Description                                       | Example                       |
| --------- | ------------------------------------------------- | ------------------------------|
| -name   | Search by filename (case-sensitive)                 | -name "*.txt"                 |
| -iname  | Case-insensitive version of -name                   | -iname "README.md"            |
| -type   | Search by type: f = file, d = directory             | -type f                       |
| -size   | Search by file size                                 | -size +10M                    |
| -mtime  | Modified time in days (-mtime -7 = last 7 days)     | -mtime +30                    |
| -empty  | Find empty files or directories                     | -type f -empty                |
| -user   | Files owned by a specific user                      | -user john                    |
| -perm   | Search by permissions                               | -perm 644                     |
| -exec   | Run a command on each result                        | -exec rm {} \;                |
| -delete | Delete found files                                  | -type f -name "*.bak" -delete |





Absolutely! Here's a **comprehensive explanation** of the `find` command in Unix/Linux:

---

## 🧭 **What Is `find`?**

`find` is a powerful command-line tool used to **search for files and directories** in a directory hierarchy, based on various conditions like name, size, type, modification date, and more.

---

## 🔧 **Basic Syntax**


find [path] [options] [expression]


* `path` → Where to start searching (`.` means current directory)
* `options/expressions` → What to search for (name, size, type, etc.)

---

## ✅ **Commonly Used `find` Options**

| Option    | Description                                       | Example                         |
| --------- | ------------------------------------------------- | ------------------------------- |
| `-name`   | Search by filename (case-sensitive)               | `-name "*.txt"`                 |
| `-iname`  | Case-insensitive version of `-name`               | `-iname "README.md"`            |
| `-type`   | Search by type: `f` = file, `d` = directory       | `-type f`                       |
| `-size`   | Search by file size                               | `-size +10M`                    |
| `-mtime`  | Modified time in days (`-mtime -7` = last 7 days) | `-mtime +30`                    |
| `-empty`  | Find empty files or directories                   | `-type f -empty`                |
| `-user`   | Files owned by a specific user                    | `-user john`                    |
| `-perm`   | Search by permissions                             | `-perm 644`                     |
| `-exec`   | Run a command on each result                      | `-exec rm {} \;`                |
| `-delete` | Delete found files                                | `-type f -name "*.bak" -delete` |

---

## 🧪 **Examples of `find`**

### 1. 🔍 **Find Files by Name**


find . -name "file.txt"


Finds `file.txt` in current directory and all subdirectories.

---

### 2. 🗂️ **Find All `.log` Files in /var/log**


find /var/log -type f -name "*.log"


---

### 3. 🧹 **Delete Temporary Files**


find /tmp -type f -name "*.tmp" -exec rm {} \;


---

### 4. 📦 **Find Large Files (> 100MB)**


find / -type f -size +100M


---

### 5. ⏱️ **Find Files Modified in the Last 7 Days**


find . -type f -mtime -7


---

### 6. 📤 **Copy Recently Changed Files to Backup**


find /home/user/docs -type f -mtime -1 -exec cp {} /home/user/backup/ \;


---

## 💡 **Pro Tips**

* Use `\;` to end `-exec` commands.
* Use `+` instead of `\;` with `-exec` to execute the command on **multiple files at once** (faster):


find . -name "*.log" -exec rm {} +


* Combine conditions:


find . -type f \( -name "*.log" -o -name "*.txt" \)


---
