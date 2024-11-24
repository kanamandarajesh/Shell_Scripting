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

======
======
Conditional operators in shell scripting are used to evaluate conditions and control the flow of the program. These operators can be used in `if`, `while`, `until`, and `test` (or `[ ]`) statements. Here's a list of common **conditional operators** used in shell scripting, categorized by their functionality:

### 1. **Numeric Comparison Operators**

These operators are used to compare numbers.

| Operator | Description                      | Example            |
|----------|----------------------------------|--------------------|
| `-eq`    | Equal to                         | `[ $a -eq $b ]`    |
| `-ne`    | Not equal to                     | `[ $a -ne $b ]`    |
| `-gt`    | Greater than                     | `[ $a -gt $b ]`    |
| `-lt`    | Less than                        | `[ $a -lt $b ]`    |
| `-ge`    | Greater than or equal to         | `[ $a -ge $b ]`    |
| `-le`    | Less than or equal to            | `[ $a -le $b ]`    |

#### Example:
```bash
a=10
b=5

if [ $a -gt $b ]; then
    echo "$a is greater than $b"
else
    echo "$a is not greater than $b"
fi
```

### 2. **String Comparison Operators**

These operators are used to compare strings.

| Operator | Description                     | Example               |
|----------|---------------------------------|-----------------------|
| `=`      | Equal to                        | `[ "$a" = "$b" ]`     |
| `!=`     | Not equal to                    | `[ "$a" != "$b" ]`    |
| `-z`     | String is empty (zero length)   | `[ -z "$a" ]`         |
| `-n`     | String is not empty (non-zero length) | `[ -n "$a" ]`    |

#### Example:
```bash
str1="hello"
str2="world"

if [ "$str1" = "$str2" ]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi
```

### 3. **File Test Operators**

These operators are used to check properties of files.

| Operator | Description                               | Example               |
|----------|-------------------------------------------|-----------------------|
| `-e`     | File exists                               | `[ -e "$file" ]`      |
| `-f`     | Regular file exists                       | `[ -f "$file" ]`      |
| `-d`     | Directory exists                          | `[ -d "$file" ]`      |
| `-r`     | File is readable                          | `[ -r "$file" ]`      |
| `-w`     | File is writable                          | `[ -w "$file" ]`      |
| `-x`     | File is executable                        | `[ -x "$file" ]`      |
| `-s`     | File is not empty (has size > 0)          | `[ -s "$file" ]`      |
| `-L`     | File is a symbolic link                   | `[ -L "$file" ]`      |

#### Example:
```bash
file="example.txt"

if [ -f "$file" ]; then
    echo "$file is a regular file"
else
    echo "$file is not a regular file"
fi
```

### 4. **Logical Operators**

These are used to combine multiple conditions.

| Operator | Description                           | Example                                |
|----------|---------------------------------------|----------------------------------------|
| `-a`     | AND (both conditions must be true)    | `[ condition1 -a condition2 ]`         |
| `-o`     | OR (either condition can be true)     | `[ condition1 -o condition2 ]`         |
| `!`      | NOT (negates the condition)           | `[ ! condition ]`                      |

#### Example using `-a` (AND):
```bash
a=10
b=5

if [ $a -gt $b -a $b -gt 0 ]; then
    echo "$a is greater than $b and $b is greater than 0"
else
    echo "One or both conditions are false"
fi
```

#### Example using `-o` (OR):
```bash
a=10
b=15

if [ $a -gt 5 -o $b -lt 10 ]; then
    echo "At least one condition is true"
else
    echo "Both conditions are false"
fi
```

#### Example using `!` (NOT):
```bash
file="example.txt"

if [ ! -e "$file" ]; then
    echo "$file does not exist"
else
    echo "$file exists"
fi
```

### 5. **Combination of Test Operators**

You can combine different types of test operators to create more complex conditions.

#### Example:
```bash
a=20
b=10
file="testfile.txt"

# Check if both numeric conditions are true and the file exists
if [ $a -gt $b -a -e "$file" ]; then
    echo "Both conditions are true and the file exists"
else
    echo "One or both conditions are false"
fi
```

### 6. **Arithmetic Comparison Operators**

If you need to perform arithmetic comparisons directly (without using `[ ]`), you can use the `(( ))` syntax, which allows for simpler arithmetic expressions.

| Operator | Description         | Example                    |
|----------|---------------------|----------------------------|
| `==`     | Equal to            | `(( a == b ))`             |
| `!=`     | Not equal to        | `(( a != b ))`             |
| `>`      | Greater than        | `(( a > b ))`              |
| `<`      | Less than           | `(( a < b ))`              |
| `>=`     | Greater than or equal to | `(( a >= b ))`        |
| `<=`     | Less than or equal to    | `(( a <= b ))`        |

#### Example:
```bash
a=10
b=20

if (( a > b )); then
    echo "$a is greater than $b"
else
    echo "$a is not greater than $b"
fi
```

### 7. **Special Variables in Conditional Tests**

You can use some special shell variables within your conditions:

- **`$?`**: Exit status of the last command (0 means success, non-zero means failure).
- **`$$`**: Process ID of the current shell.
- **`$USER`**: Current logged-in user.
- **`$HOME`**: Home directory of the current user.
- **`$PWD`**: Current working directory.

#### Example with `$?`:
```bash
ls /nonexistent/directory

if [ $? -ne 0 ]; then
    echo "The directory does not exist."
else
    echo "The directory exists."
fi
```

### Summary of Common Conditional Operators:

- **Numeric comparison**: `-eq`, `-ne`, `-gt`, `-lt`, `-ge`, `-le`
- **String comparison**: `=`, `!=`, `-z`, `-n`
- **File test**: `-e`, `-f`, `-d`, `-r`, `-w`, `-x`, `-s`
- **Logical operators**: `-a`, `-o`, `!`
- **Arithmetic comparisons**: `==`, `!=`, `>`, `<`, `>=`, `<=`

