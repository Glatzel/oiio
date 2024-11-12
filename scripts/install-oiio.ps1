# Define the path you want to add
$newPath = Resolve-Path ./

# Retrieve the current user 'Path' variable
$currentPath = [System.Environment]::GetEnvironmentVariable("Path", "User")

# Append the new path, ensuring paths are separated by a semicolon
$newUserPath = $currentPath + ";" + $newPath

# Set the updated path as the new user 'Path' variable
[System.Environment]::SetEnvironmentVariable("Path", $newUserPath, "User")

# Check the user 'Path' variable to verify the new path has been added
[System.Environment]::GetEnvironmentVariable("Path", "User")
