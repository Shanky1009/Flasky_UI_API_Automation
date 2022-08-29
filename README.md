# Flasky_UI_API_Automation

Step 1 : git clone : https://github.com/Shanky1009/Flasky_UI_API_Automation

Step 2 : Open project in PyCharm IDE from downloaded folder

Step 3 : Create New Python Virtual Environment by selecting Python Interpreter as follows:
1.     a. Go to Project Preferences
2.     b. Select Project
3.     c. Select Python Interpreter
4.     d. Click on "Add" to add new Virtulenv Environment
5.     e. Select **python3** as base interpreter
6.     f. Click on "OK" to add virtual env
    
Step 4 : Open terminal - From Project Root Directory Run below command to install dependencies -
`pip3 install -r requirements.txt`

Step 5 : From Project Root Directory execute Robot command to run **_UI Automation_** - 
`robot -d Reports/ -v BROWSER:Chrome -i userReg Scripts/`

Step 6 : To run API automation, change directory to go to API automation script -
`cd Flasy_API_Automation/`

Step 7 : To execute API Automation script run below command -
`pytest --html=report.html -s`

**Note:**
* UI Automation Reports are generated under **Reports/** folder
* API HTML Reports are generated under **Flasky_API_Automation/** folder 
* pytest, pytest-html, requests are used for API automation script generation 
* robotframework-selenium2library, robotframework are used for UI automation script generation
* Pytest with Requests is used for API framework
* Robot Framework is used for UI framework