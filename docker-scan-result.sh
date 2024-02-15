
# how to print UNKNOWN: 0, LOW: 75, MEDIUM: 31, HIGH: 6, CRITICAL: 0 from Total: 112 (UNKNOWN: 0, LOW: 75, MEDIUM: 31, HIGH: 6, CRITICAL: 0) using bash shell script 
# Define the input string
input="Total: 112 (UNKNOWN: 0, LOW: 75, MEDIUM: 31, HIGH: 6, CRITICAL: 0)"
# Use grep to extract the part within parentheses
extracted=$(echo "$input" | grep -o -P '\(.*\)' | sed 's/(\(.*\))/\1/')
UNKNOWN=$(echo $extracted |awk -F"," '{print$1}' | awk -F": " '{print$2}')
LOW=$(echo $extracted |awk -F"," '{print$2}' | awk -F": " '{print$2}')
MEDIUM=$(echo $extracted |awk -F"," '{print$3}' | awk -F": " '{print$2}')
HIGH=$(echo $extracted |awk -F"," '{print$4}' | awk -F": " '{print$2}')
CRITICAL=$(echo $extracted |awk -F"," '{print$5}' | awk -F": " '{print$2}')

echo "UNKNOWN: $UNKNOWN"
echo "LOW: $LOW"
echo "MEDIUM: $MEDIUM"
echo "HIGH: $HIGH"
echo "CRITICAL: $CRITICAL"


# Your input string
input_string=$(cat /tmp/result.txt |grep Total)
# Use grep to extract the part within parentheses
extracted_part=$(echo "$input_string" | grep -oE '\(.*\)')
# Use sed to remove the parentheses
cleaned_part=$(echo "$extracted_part" | sed 's/[(|)]//g')
# Use awk to extract and print the values


# Print the values
echo "UNKNOWN: $UNKNOWN"
echo "LOW: $LOW"
echo "MEDIUM: $MEDIUM"
echo "HIGH: $HIGH"
echo "CRITICAL: $CRITICAL"

# Make decisions based on the values
if [[ "$CRITICAL" -gt 0 ]]; then
    echo "Action: Take immediate action for CRITICAL issues."
elif [[ "$HIGH" -gt 0 ]]; then
    echo "Action: Address HIGH priority issues."
elif [[ "$MEDIUM" -gt 0 ]]; then
    echo "Action: Consider and plan for MEDIUM priority issues."
elif [[ "$LOW" -gt 0 ]]; then
    echo "Action: Monitor and manage LOW priority issues."
elif [[ "$UNKNOWN" -gt 0 ]]; then
    echo "Action: Investigate UNKNOWN issues."
else
    echo "No issues found."
fi
