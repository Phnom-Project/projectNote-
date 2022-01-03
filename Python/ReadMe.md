### spacy docker 
#### load spacy model
```dockerfile
FROM python:3-onbuild
RUN python -m spacy download en_core_web_sm
CMD  ["python3", "TextAnalyzerLaunch.py"]
```
#### any() function
```py
x=[5,6,7]
y=[5,6,7]
z=[[8,5,10],[2,3]]
print(5 in y) # return True 
print(any(c in y for c in z[0])) # return True 
```
```py
docs = [nlp(text) for text in LOTS_OF_TEXTS]
```
### uvicorn and venv(virtual enviroment)
```shell
py -m venv [nameEnviroment]
pip install [packageName]
pip freeze > requirements.txt
```
