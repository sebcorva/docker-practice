from flask import Flask
# Create a instance for flask
app = Flask(__name__)
# Define a route for the root url
@app.route('/')
def inicio():
    #return the response to the client
    print("esto se ve en consola?")
    return 'Servidor Flask iniciado desde docker'


