Student_Attendance_Tracker – Project Factory

Overview

Automates setup for a Student Attendance Tracker project: creates directories, copies files, updates attendance thresholds, and handles interruptions safely.

Directory Structure

attendance_tracker_<name>/
├── attendance_checker.py
├── Helpers/
│   ├── assets.csv
│   └── config.json
└── reports/
    └── reports.log

How to Run

chmod +x project_factory.sh
./project_factory.sh schoolA

	•	$1 is the project name.
	•	Update thresholds when prompted (default Warning=75%, Failure=50%).

Ctrl+C / Archive

Pressing Ctrl+C during execution:
	•	Archives incomplete folder as attendance_tracker_<name>_archive.tar.gz
	•	Deletes the incomplete folder automatically.

Health Check

The script checks if Python 3 is installed and prints a success or warning 

video_presentation:https://m.youtube.com/watch?v=J8VX6gX-QW8&feature=youtu.be
