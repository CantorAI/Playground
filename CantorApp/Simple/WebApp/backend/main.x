# Import necessary modules
from xlang_http import http
from xlang_os import fs
import json
import cantor thru 'lrpc:1000'
from Galaxy import galaxy

# Set the Cantor instance for Galaxy
galaxy.cantor = cantor
port = 9000

# TODO: change line below with pipeline name with path
# pipelineName = "../../pipelines/default.pl"
pipelineName = "../pipelines/Detect_Template.pl"

jsonConfig = fs.ReadAllTexts("../config.json")
if(jsonConfig != ""):
    config = json.loads(jsonConfig)
    if config.has("port"):
        port = config["port"]
    if config.has("pipeline"):
        pipelineName = config["pipeline"]

# Create a new HTTP server instance
srv = http.Server()
srv.SupportStaticFiles = True
# Set the directories from which static files will be served
srv.StaticRoots = ["../frontend"]

# this variable will hold the current pipeline object
currentPipeline = None

# Define a route for starting the pipeline
# will be called when the user clicks the "Start Pipeline" button
@srv.route("/api/pipeline_start")
def pipelineStart():
    # Read the pipeline description from a file
    plDesc = fs.ReadAllTexts(pipelineName)
    cantor.logV("pipelineStart", plDesc)
    
    # Load and run the pipeline
    plObj = galaxy.LoadPipelineFromDescription(plDesc)
    pipelineName = plObj.Name
    currentPipeline = plObj
    retVal = plObj.Run()
    
    # Return the result and pipeline name as JSON
    return [str([retVal, pipelineName], format=True), "text/json"]

# Define a route for stopping the pipeline
# will be called when the user clicks the "Stop Pipeline" button
@srv.route("/api/pipeline_stop")
def pipelineStop():
    # Stop the current pipeline if it exists
    if currentPipeline != None:
        currentPipeline.Stop()
    return ["", "text/json"]

# Start the server
cantor.logV("Web Server http://localhost:", port)
srv.listen("::", port)
