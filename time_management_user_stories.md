# Time Management User Stories

# Login/Registration Page

**Account registration** 
- As a user, I want to register by entering my username, email, and password, so that I can create an account.

**Acceptance Criteria:**
1. Users can enter valid details and click “Sign Up” to create an account.
2. An error message is shown if any input is invalid or missing.

**Account login** 
- As a user, I want to log in using my email and password so that I can access my account.

**Acceptance Criteria:**
1. Users can log in with correct credentials and are redirected to their dashboard.
2. An error message is displayed for incorrect credentials.

**Error feedback on signup and login** 
- As a user, I want to receive a message if I click the Sign Up or login button without entering details, or when I enter the wrong email or password for login, so that I know my sign up or login attempt was unsuccessful.

**Acceptance Criteria:**
1. Error messages are displayed for missing fields on sign-up or login attempts.
2. Error messages are displayed for wrong email or password during login.

**Store User Data** 
- As a user, I want my details to be stored in local storage, so that my data persists between app sessions.

**Acceptance Criteria:**
1. User details are saved in local storage after registration and used for authentication during login.


# Home Screen

**View Welcome Message** 
- As a user, I want a motivating quote with my name and a title, so that I feel welcomed and encouraged to manage time.

**Acceptance Criteria:**
1. Display “Hello, [username]” followed by the title “Find your perfect motivation.”
2. Display a motivational quote related to time management.

**Display Monthly Calendar** 
- As a user, I want a monthly calender, so that I can click on a date and organise the tasks for the date.

**Acceptance Criteria:**
1. Display current month calender with option to select different month and date.

**Display Daily Tasks** 
- As a user, I want to see the all my tasks lined up for the day or any selected, so that I can easily manage my time.

**Acceptance Criteria:**
1. Display the list of all tasks for the selected date with the time allocated for each task.
2. Display the completed and pending tasks with different colors.
3. Alert when a task goes overtime.
4. Add button to add new task.

# Detail Screen

**About section** 
- As a user, I want to see the details of a selected tasks, so that I can manage time for it.

**Acceptance Criteria:**
1. Display the task title, time alloted, priority, etc.

**Edit task** 
- As a user, I want to edit the details of selected tasks, so that I can manage it based on my time availability.

**Acceptance Criteria:**
1. Form to edit task title and time.

**Delete task** 
- As a user, I want to delete a selected tasks, if I don't require it.

**Acceptance Criteria:**
1. Button to delete task.

# Persistent Data

**Data Store** 
- As a user, I want my data like login state to persist across sessions so that I don't need to re-enter details every time.

**Acceptance Criteria:**
1. Saves the user data and tasks on the device.

# API Integration

**Cross-device accessibillity** 
- As a user, I want my data to be synced between my laptop and mobile, so that I remain updated about my tasks and time.

**Acceptance Criteria:**
1. Saves the user data and syncs on all devices.

# Settings Menu

**Settings menu** 
- As a user, I want to access a settings menu from any screen so that I can adjust preferences at my convenience.

**Acceptance Criteria:**
1. Display the list of all available settings.

# Settings Screen

**Account Setting** 
- As a user, I want to update my email and password on the settings screen so that I can keep my account secure.

**Acceptance Criteria:**
1. Option to edit email and password.
2. Confirm password change via email otp.

**Notification Preferences** 
- As a user, I want to adjust notification preferences so that I only receive alerts relevant to me.

**Acceptance Criteria:**
1. Option to change the notification ringtone or silence notifications.
2. Edit reminder setting for task going overtime.
3. Edit reminder setting for tasks due.

# Notifications

**Implement Notifications** 
- As a user, I want to receive a timely reminder notification so that I don’t forget to complete my tasks.

**Acceptance Criteria:**
1. Reminder at a selected time before a task is due.



