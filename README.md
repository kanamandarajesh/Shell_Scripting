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

========
========

### **Overview of `for` and `while` Loops in Shell Scripting**

In shell scripting, both `for` and `while` loops are used to automate repetitive tasks. These loops allow you to execute commands multiple times based on a specific condition or a sequence of values. Below is an overview of both loops, how they are used, and when you might prefer one over the other.

---

### **1. `for` Loop in Shell Scripting**

The `for` loop is used when you know the number of iterations in advance, or when you want to iterate over a known list of items (e.g., a range of numbers, file names, or strings).

#### **Syntax:**
```bash
for VARIABLE in ITEM1 ITEM2 ITEM3
do
    # Commands to execute for each item
done
```

- **VARIABLE**: A placeholder for the current item in each iteration.
- **ITEM1, ITEM2, ITEM3, ...**: The list of items (which could be numbers, strings, filenames, etc.) that the loop will iterate over.

#### **Key Use Cases:**
- Iterating over a list of values.
- Repeating an operation a fixed number of times.
- Processing files in a directory or performing operations on elements in a list.

#### **Examples:**

**Iterating over a list of values:**
```bash
#!/bin/bash
for i in 1 2 3 4 5
do
    echo "Number $i"
done
```
**Output:**
```
Number 1
Number 2
Number 3
Number 4
Number 5
```

**Iterating over files in a directory:**
```bash
#!/bin/bash
for file in /path/to/directory/*.txt
do
    echo "Processing file: $file"
done
```

**Using a range of numbers:**
```bash
#!/bin/bash
for i in {1..5}
do
    echo "Iteration: $i"
done
```
**Output:**
```
Iteration: 1
Iteration: 2
Iteration: 3
Iteration: 4
Iteration: 5
```

#### **Advantages of the `for` loop:**
- Best suited when you have a fixed number of items to iterate over.
- More concise and readable when iterating over a list or range.
- Easy to use for iterating over files or directories with wildcards (`*`).

---

### **2. `while` Loop in Shell Scripting**

The `while` loop is used when you want to repeat a block of code **while a specific condition is true**. It continues executing as long as the condition evaluates to true.

#### **Syntax:**
```bash
while CONDITION
do
    # Commands to execute while the condition is true
done
```

- **CONDITION**: A test or condition that is evaluated before each iteration. If it returns true (exit code `0`), the loop continues. If false (non-zero exit code), the loop terminates.

#### **Key Use Cases:**
- Repeating tasks while waiting for a specific condition (e.g., waiting for a file to exist, checking if a process is running).
- Waiting for user input or processing unknown-length data (such as reading from a file or stream).

#### **Examples:**

**Simple counter:**
```bash
#!/bin/bash
counter=1
while [ $counter -le 5 ]
do
    echo "Counter: $counter"
    ((counter++))  # Increment counter
done
```
**Output:**
```
Counter: 1
Counter: 2
Counter: 3
Counter: 4
Counter: 5
```

**Waiting for user input:**
```bash
#!/bin/bash
while true
do
    read -p "Enter 'y' to continue or 'n' to exit: " input
    if [ "$input" == "y" ]; then
        echo "Continuing..."
    elif [ "$input" == "n" ]; then
        echo "Exiting..."
        break
    else
        echo "Invalid input. Please try again."
    fi
done
```

**Reading lines from a file:**
```bash
#!/bin/bash
filename="example.txt"
while IFS= read -r line
do
    echo "Read line: $line"
done < "$filename"
```

#### **Advantages of the `while` loop:**
- Useful for repeating an action based on dynamic or uncertain conditions (e.g., until a condition is met).
- Ideal for loops that process streaming input, such as reading from a file or user input.
- More flexible when you don’t know the exact number of iterations in advance.

---

### **Key Differences Between `for` and `while` Loops**

| Feature               | `for` Loop                                        | `while` Loop                                      |
|-----------------------|--------------------------------------------------|--------------------------------------------------|
| **Usage**             | Used when you know the number of iterations or have a list of values to iterate over. | Used when you want to repeat actions as long as a condition is true. |
| **Iteration Basis**   | Iterates over a list of values, numbers, or files. | Repeats as long as the condition evaluates to true. |
| **Common Use Cases**  | Looping over a list of items, processing files, iterating over ranges of numbers. | Waiting for conditions (e.g., waiting for a process, file, or condition to change). |
| **Condition Check**   | Predefined list or range; doesn't depend on runtime conditions. | Depends on a condition that is checked before each iteration. |
| **Termination**       | Ends after iterating over all list items or range. | Ends when the condition evaluates to false. |

---

### **When to Use `for` vs `while`**

- **Use a `for` loop** when:
  - You know the number of iterations beforehand.
  - You need to iterate over a fixed list of items (e.g., numbers, files).
  - You are processing a known sequence of items.

- **Use a `while` loop** when:
  - The number of iterations is unknown and depends on a condition.
  - You need to perform an action repeatedly until a certain condition is met.
  - You are reading input dynamically (e.g., user input, file data, or stream data).

---

### **Nested `for` and `while` Loops**

You can nest `for` and `while` loops to perform more complex tasks. For example, you can loop over multiple lists of items or use a `while` loop inside a `for` loop to handle conditions for each item.

```bash
#!/bin/bash
for i in {1..3}
do
    echo "Outer loop iteration: $i"
    j=1
    while [ $j -le 3 ]
    do
        echo "  Inner loop iteration: $j"
        ((j++))
    done
done
```

**Output:**
```
Outer loop iteration: 1
  Inner loop iteration: 1
  Inner loop iteration: 2
  Inner loop iteration: 3
Outer loop iteration: 2
  Inner loop iteration: 1
  Inner loop iteration: 2
  Inner loop iteration: 3
Outer loop iteration: 3
  Inner loop iteration: 1
  Inner loop iteration: 2
  Inner loop iteration: 3
```

---

### **Conclusion**

- Both `for` and `while` loops are essential tools in shell scripting.
- **`for`** is ideal for iterating over a predefined list or a range of numbers, and is typically used when the number of iterations is known in advance.
- **`while`** is more suitable when you need to repeat a task based on a condition that may change during runtime.
