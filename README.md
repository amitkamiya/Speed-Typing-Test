# 🧠 Typing Speed Test 🎯

Welcome to the **Typing Speed Test**! Challenge yourself and improve your typing speed and accuracy. This simple yet fun game helps you enhance your typing skills while testing your speed in a terminal environment.

## Features

- **Typing Test**: Type sentences within a time limit and measure your typing speed in words per minute (WPM).
- **Accuracy**: Calculate your typing accuracy based on correct characters.
- **Countdown Timer**: A real-time countdown before starting the typing challenge.
- **Results**: Save and view past results to track your progress.
- **Terminal-based**: A simple text-based application using `Bash` and `dialog`.

## Prerequisites

- **Windows Subsystem for Linux (WSL)** or a Linux environment.
- **dialog** package installed on your system for the text-based interface.

## Installation

### 1. Install WSL (Windows Subsystem for Linux)
If you're using **Windows**, set up **WSL** by running the following command in PowerShell (run as Administrator):

```bash
wsl --install
```

This will install Ubuntu (or another Linux distribution of your choice) as the default. Once installed, open Ubuntu or your preferred Linux distribution from the Start Menu.

### 2. Install Required Packages
Open the terminal in your WSL or Linux environment and install the necessary tools:

```bash
sudo apt update
sudo apt install dialog
```

`dialog`: Used for the text-based interface.

### 3. Download or Clone the Project
Clone or download the project files to your system. You can use `git` to clone the project:

```bash
git clone https://github.com/yourusername/typing-speed-test.git
cd typing-speed-test
```

Alternatively, download the script manually.

### 4. Make the Script Executable
Ensure the `typing_test.sh` script is executable:

```bash
chmod +x typing_test.sh
```

### 5. Run the Typing Speed Test
In your terminal, run the script:

```bash
./typing_test.sh
```

This will start the Typing Speed Test program. Follow the on-screen instructions to start a typing test, view past results, or exit the application.

## How It Works

- **Main Menu**: Upon starting, you'll see a menu to start the typing test, view past results, or exit.
- **Countdown**: A countdown timer prepares you before typing begins.
- **Typing Test**: A random sentence is displayed, and you must type it as quickly and accurately as possible.
- **Results**: After the test, your time taken, WPM, and accuracy are calculated, displayed, and saved for future reference.
- **View Past Results**: Access previous results from the main menu.

## Troubleshooting

- **Dialog not working**: If `dialog` doesn't display correctly, ensure the `dialog` package is installed properly.
- **Permission denied**: If you see a permission error when running the script, make it executable with `chmod +x typing_test.sh`.

## Contributing

Feel free to fork the repository, make improvements, and submit pull requests. Contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.