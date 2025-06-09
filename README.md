# 📝 Tasky Management App (Flutter)

A clean, responsive task management Flutter app with persistent local storage, theme support, and user profile customization. Inspired by a Figma design and implemented with `provider`, `shared_preferences`, and image support.

---

## ✨ Features

- Add, edit, delete, and mark tasks as complete
- User-friendly navigation with a bottom navigation bar
- Categorized task views: All, To-Do, Completed, High Priority
- Persistent storage using `shared_preferences`
- User profile with image, name, and motivation quote
- Responsive to light/dark mode
- Cupertino-style UI with `flutter_svg` and `image_picker`

---

## 📁 Project Structure

```

lib/
├── core/
│   ├── components/
│   ├── constants/
│   │   └── storage_keys.dart
│   ├── enums/
│   ├── └── tasks_action.dart
│   ├── services/
│   │   └── preferences_manager.dart
│   └── theme/
│       ├── dark_theme.dart
│       ├── light_theme.dart
│       └── theme_controller.dart
├── features/
│   ├── add\_tasks/
│   │   └── add_task_screen.dart
│   ├── home/
│   │   ├── wedgits/
│   │   └── tasks_screen.dart
│   ├── navigation/
│   ├── profile/
│   │   ├── wedgits/
│   │   ├── profile_screen.dart
│   │   ├── user_controller.dart
│   │   └── user_details_screen.dart
│   ├── tasks/
│   │   ├── complete_screen.dart
│   │   ├── high_priority_tasks_screen.dart
│   │   ├── task_model.dart
│   │   ├── tasks_controller.dart
│   │   └── todo_screen.dart
│   └── welcome/
│       └── home_screen.dart
└── main.dart

````

---

## 📸 UI Screens

### Design Reference
![figma design](https://github.com/user-attachments/assets/2cb2f404-0d64-4aa1-9058-92c18fdfa94f)

### Main View
![main screen](https://github.com/user-attachments/assets/96214f25-1ac9-444b-8770-0efbd4475c09)

### Home (Empty)
| Dark Mode | Light Mode |
|-----------|------------|
| ![empty home dark](https://github.com/user-attachments/assets/4de19fba-15d9-489d-a27b-e98a81dcf8a9) | ![empty home white](https://github.com/user-attachments/assets/8b12b4c0-41d0-485d-99a7-cd0c91d20ad4) |

### Home (With Tasks)
| Dark Mode | Light Mode |
|-----------|------------|
| ![home with tasks dark](https://github.com/user-attachments/assets/db2635d1-3e75-47d8-b24f-cfb6f644fdf4) | ![home with tasks white](https://github.com/user-attachments/assets/c0b57a2a-93d3-46d2-9837-046db26ebd2d) |

### Add Task
| Dark Mode | Light Mode |
|-----------|------------|
| ![add new task dark](https://github.com/user-attachments/assets/282aa067-6cfd-4b87-93ad-84a0856f0d02) | ![add new task white](https://github.com/user-attachments/assets/eb387750-4062-43b7-89c3-37304f5f4f55) |

### Task Categories
| To-Do | Complete |
|-------|----------|
| ![to do dark](https://github.com/user-attachments/assets/2e680a8f-83c4-480c-9ee1-2142a7ff41f2) ![to do whit](https://github.com/user-attachments/assets/935787d0-9750-45f6-bcb4-53e8ec233c0e) | ![complete dark](https://github.com/user-attachments/assets/103ce4cc-fc1a-45ad-bf1b-d708a9bb3b92) ![complete white](https://github.com/user-attachments/assets/0f4ae462-540a-4926-87f5-dc4060865722) |

### User Profile
| Dark | Light |
|------|-------|
| ![profile dark](https://github.com/user-attachments/assets/6726ef8c-82d8-41f7-a4d1-774757f01759) | ![profile with image and quote white](https://github.com/user-attachments/assets/5c2ab851-161c-4bd2-8f8d-3f65258642ce) |

### Edit Details
![user details edit page- name and motivation](https://github.com/user-attachments/assets/419330c0-2dd1-4001-b952-98312dbfaf06)

### Task Edit/Delete
![edit and delete pop up](https://github.com/user-attachments/assets/ee7efd81-7528-4cff-8c18-43322ea7c0c6)
![edit task](https://github.com/user-attachments/assets/5a4de7cb-19fd-465e-93ac-db0257981d74)

---

## 🧩 Packages Used

```yaml
cupertino_icons: ^1.0.8
flutter_svg: ^2.1.0
shared_preferences: ^2.5.3
provider: ^6.1.5
image_picker: ^1.1.2
path_provider: ^2.1.5
````

---

## 🧠 Controllers Overview

### 🧍‍♂️ UserController

Manages user info including:

* `username`
* `motivationQuote`
* `userImagePath`

Supports updating, clearing, and saving persistent user data via `PreferencesManager`.

### ✅ TasksController

Handles:

* `addTask()`, `editTask()`, `deleteTask()`
* Filtering tasks into "To Do" and "Completed"
* Persisting and retrieving tasks from storage

