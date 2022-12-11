
# # Import the Flask class from the flask module
from flask import Flask
from io import open
import os

# Create a new instance of the Flask class
app = Flask(__name__)

with open("./version.txt", mode="r") as file:
    # Read the contents of the file and store it in a variable called `contents`
    contents = file.read()

# Define a route for the default URL
@app.route('/')
def hello():
    return "Hello, world! Version is {}".format(contents)

# Health
@app.route('/health')
def health_check():
    return 'OK'

# Run the Flask application
if __name__ == "__main__":
    app.run(debug=False,use_reloader=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8081)))