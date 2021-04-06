## Installation
IDLE suggestion : **VSCode**

Download [Chromedriver](https://chromedriver.chromium.org/) corresponds to chrome version

Install Python [3.7.0](https://www.python.org/downloads/release/python-370/) 

=> Add **Chromedriver** and **Python** to Windows PATH

Install PIP for Python. Open terminal in vscode : 
  ```bash
    pip install pip
  ```
Install library from pip:
```bash
  pip install -r requirements.txt
  ```
  
## Run Test
  ```bash
    robot --include city testcases\search.robot
  ```
  - **_city_** : tag of the test case 
  - **_testcases\search.robot_** : absolutely path to the test case
  
  **NOTE** : The path of each desktop may be different. Make sure your right click to specify test case -> Copy Relative Path
