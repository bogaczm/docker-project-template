# How to work with project
There are two ways of interaction, with python venv and with isolated docker evironment
Please run make venv at least once it installs system dependencies

## 1. venv
1. Crete requirement.txt in the ./workspace, in this case, all ports will be set to default of hosted apps
2. ``` make dependencies ``` - creates the .venv folder with all the dependencies
3. ``` source .venv/bin.activate ``` - activates the env
4. In jupyter and ipython one needs to make sure, that right kernel is used

## 2. docker
1. Crete requirement.txt in the ./workspace.
2. Create variables.env based on variables.env-template
3. ``` make build ```
4. ``` make start ```
5. Commands ``` make shell ```, ``` make notebook ``` and ```make api ``` allow you for interaction with main utility container

Caution:
If no gpu in system, comment the deployment-resource-gpu and there is no need to run ``` make dependencies ```


Streamlit
``` streamlit run src/streamlit_app/app.py --server.port=$STREAMLIT_PORT ```

API
``` uvicorn src.api.main:app --host 0.0.0.0 --port $API_PORT --reload ```