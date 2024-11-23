In shell scripting, conditional operators are used within `if`, `elif`, and `case` statements to perform different types of comparisons and logical operations. Below are the commonly used conditional operators in shell scripting:

---

### 📋 **Basic Conditional Syntax:**
```bash
if [ condition ]; then
    # Commands to run if the condition is true
fi
```

---

### 🔢 **1. Numerical Comparisons:**
| **Operator** | **Description**           | **Example**               |
|--------------|---------------------------|---------------------------|
| `-eq`        | Equal to                  | `[ "$a" -eq "$b" ]`       |
| `-ne`        | Not equal to              | `[ "$a" -ne "$b" ]`       |
| `-lt`        | Less than                 | `[ "$a" -lt "$b" ]`       |
| `-le`        | Less than or equal to     | `[ "$a" -le "$b" ]`       |
| `-gt`        | Greater than              | `[ "$a" -gt "$b" ]`       |
| `-ge`        | Greater than or equal to  | `[ "$a" -ge "$b" ]`       |

**Example:**
```bash
a=5
b=10
if [ $a -lt $b ]; then
    echo "$a is less than $b"
fi
```

---

### 🔤 **2. String Comparisons:**
| **Operator** | **Description**              | **Example**                     |
|--------------|------------------------------|---------------------------------|
| `=`          | Equal to                     | `[ "$str1" = "$str2" ]`         |
| `!=`         | Not equal to                 | `[ "$str1" != "$str2" ]`        |
| `<`          | Lexicographically less than | `[ "$str1" \< "$str2" ]`        |
| `>`          | Lexicographically greater   | `[ "$str1" \> "$str2" ]`        |
| `-z`         | String is empty              | `[ -z "$str" ]`                 |
| `-n`         | String is not empty          | `[ -n "$str" ]`                 |

**Example:**
```bash
str1="hello"
str2="world"
if [ "$str1" != "$str2" ]; then
    echo "Strings are not equal"
fi
```

---

### 📂 **3. File Comparisons:**
| **Operator** | **Description**                         | **Example**                   |
|--------------|-----------------------------------------|-------------------------------|
| `-e`         | File exists                             | `[ -e "$file" ]`              |
| `-f`         | File is a regular file                  | `[ -f "$file" ]`              |
| `-d`         | File is a directory                     | `[ -d "$dir" ]`               |
| `-r`         | File is readable                        | `[ -r "$file" ]`              |
| `-w`         | File is writable                        | `[ -w "$file" ]`              |
| `-x`         | File is executable                      | `[ -x "$file" ]`              |
| `-s`         | File is not empty                       | `[ -s "$file" ]`              |
| `-L`         | File is a symbolic link                 | `[ -L "$file" ]`              |

**Example:**
```bash
file="example.txt"
if [ -f "$file" ]; then
    echo "$file is a regular file"
fi
```

---

### 🔗 **4. Logical Operators:**
| **Operator** | **Description**           | **Example**                       |
|--------------|---------------------------|-----------------------------------|
| `&&`         | Logical AND (within `[[ ]]`) | `[[ $a -gt 5 && $b -lt 10 ]]`     |
| `\|\|`        | Logical OR (within `[[ ]]`)  | `[[ $a -gt 5 || $b -lt 10 ]]`     |
| `!`          | Logical NOT               | `[[ ! -f "$file" ]]`              |

**Example:**
```bash
a=5
b=10
if [[ $a -gt 3 && $b -lt 15 ]]; then
    echo "Both conditions are true"
fi
```

---

### 🧩 **5. Case Statement:**
For pattern matching:

```bash
fruit="apple"
case $fruit in
    "apple")
        echo "It's an apple." ;;
    "banana")
        echo "It's a banana." ;;
    *)
        echo "Unknown fruit." ;;
esac
```

---

### 📝 **Tip: Brackets in Conditions**
- `[ ... ]` is the traditional test syntax (requires spaces around brackets).
- `[[ ... ]]` is a more advanced version, supporting logical operators and regular expressions.

---

These conditional operators help you build powerful and flexible shell scripts! 🚀
