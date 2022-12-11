# Import the `open` function from the `io` module
from io import open

# Print the string "Hello, world!"
print("Hello, world!")

# Open a file called "myfile.txt" in read-only mode
with open("./version.txt", mode="r") as file:
    # Read the contents of the file and store it in a variable called `contents`
    contents = file.read()

# Print the contents of the file using string formatting
print("Content: {}".format(contents))
