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
py -m venv venv
pip install [packageName]
pip freeze > requirements.txt
pip install -r requirements.txt
___V2___
py -m venv venv
cd venv/scripts
./Activate

(optional error pip) python -m pip install --upgrade pip
pip install --no-cache-dir --upgrade -r requirements.txt

docker build -t [name] .
docker run -p 8080:80 [imageName]

uvicorn app.main:app --port 8080
```
> run 
```shell
uvicorn app.main:app --port 8080
```
