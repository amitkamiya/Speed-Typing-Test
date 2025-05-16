#!/bin/bash

# Typing sentences
SENTENCES=(
    "The quick brown fox jumps over the lazy dog"
    "Linux powers the world with open source magic"
    "Master the terminal to unlock your potential"
    "Code is poetry written for machines to sing"
)

RESULT_FILE="/tmp/typing_results.txt"

# Function: Show a stylized project name
show_title() {
    dialog --title "🧠 Typing Speed Test 🎯" \
           --msgbox "Welcome to the Typing Speed Test\n\nChallenge yourself and improve your typing speed and accuracy!\n\nCreated with ❤️ in Bash + Dialog" 10 50
}

# Function: Countdown using dialog
countdown() {
    for ((i=3; i>0; i--)); do
        dialog --infobox "⏳ Starting in $i..." 5 30
        sleep 1
    done
    dialog --infobox "🚀 Go!" 3 20
    sleep 1
}

# Function: Typing test
typing_test() {
    sentence="${SENTENCES[$RANDOM % ${#SENTENCES[@]}]}"
    
    dialog --title "Typing Challenge" \
           --msgbox "Type the following sentence exactly:\n\n\"$sentence\"\n\nPress OK when you're ready to begin." 12 60

    countdown

    # Prompt for input and time it
    start=$(date +%s)
    user_input=$(dialog --title "Start Typing" \
                        --inputbox "Type the sentence below:\n\n\"$sentence\"" 12 70 3>&1 1>&2 2>&3)
    end=$(date +%s)

    time_taken=$((end - start))
    [[ $time_taken -eq 0 ]] && time_taken=1

    words=$(echo "$sentence" | wc -w)
    wpm=$(( (words * 60) / time_taken ))

    # Calculate accuracy
    correct=0
    total=${#sentence}
    for ((i=0; i<total; i++)); do
        [[ "${user_input:$i:1}" == "${sentence:$i:1}" ]] && ((correct++))
    done
    accuracy=$(( (correct * 100) / total ))

    # Save result
    echo "[$(date)] WPM: $wpm, Accuracy: $accuracy%" >> "$RESULT_FILE"

    dialog --title "🧾 Results" \
           --msgbox "✅ Time Taken: $time_taken seconds\n🚀 WPM: $wpm\n🎯 Accuracy: $accuracy%" 10 50
}

# Function: View past results
view_results() {
    if [[ -f "$RESULT_FILE" ]]; then
        dialog --title "📊 Past Results" \
               --textbox "$RESULT_FILE" 20 60
    else
        dialog --title "No Results" --msgbox "No previous results found." 6 40
    fi
}

# Function: Show main menu
main_menu() {
    while true; do
        choice=$(dialog --clear \
                        --title "🧠 Typing Speed Test Menu" \
                        --menu "Choose an option:" 15 50 4 \
                        1 "Start Typing Test" \
                        2 "View Past Results" \
                        3 "Exit" \
                        3>&1 1>&2 2>&3)
        
        case $choice in
            1) typing_test ;;
            2) view_results ;;
            3) clear; exit ;;
            *) break ;;
        esac
    done
}

# Run
show_title
main_menu
